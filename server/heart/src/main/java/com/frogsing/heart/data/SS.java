package com.frogsing.heart.data;

import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.DynamicSpecifications;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.utils.AnnotationUtils;
import com.frogsing.heart.spring.SpringContextHolder;
import com.google.common.collect.Maps;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.ReflectionUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

/**
 * 内部类,不要到外面用
 */
class SS {


	/**
	 * 根据po获取Dao
	 *
	 * @param cls
	 * @return
	 */
	public static <X extends BaseEntity> BaseDao<X, String> getDao(Class<?> cls) {
		String sname = cls.getSimpleName();
		String beanName;
		if(StringUtils.isAllUpperCase(sname.substring(0,2)))
			beanName=sname+"Dao";
		else
			beanName=sname.substring(0, 1).toLowerCase() + sname.substring(1, sname.length()) + "Dao";
		BaseDao<X, String> dao = SpringContextHolder
				.getBean(beanName);
		return dao;
	}
	public static <X extends BaseEntity> void  save(X obj){
		BaseDao<X, String> dao = getDao(obj.getClass());
		dao.save(obj);
	}
	public static <X extends BaseEntity> void  save(List<X> list){
		if(list.size()==0)
			return;
		BaseDao<X, String> dao = getDao(list.get(0).getClass());
		dao.save(list);
	}
	public static <X extends BaseEntity> void  delete(X obj){
		BaseDao<X, String> dao = getDao(obj.getClass());
		dao.delete(obj);
	}
	public static <X extends BaseEntity> void  delete(List<X> list){
		if(list.size()==0)
			return;
		BaseDao<X, String> dao = getDao(list.get(0).getClass());
		dao.delete(list);
	}


	public static <X extends BaseEntity> List<X>  findAll(Class<X> cls,Sort... sort){
		BaseDao<X, String> dao = getDao(cls);
		if(sort.length>0)
			return dao.findAll(sort[0]);
		else
			return dao.findAll();
	}
	public static <X extends BaseEntity> List<X>  findAll(Class<X> cls,List<String> ids){
		BaseDao<X, String> dao = getDao(cls);
		return dao.findAll(ids);
	}
	public static <X extends BaseEntity> X  findOne(Class<X> cls,String id){
		BaseDao<X, String> dao = getDao(cls);
		return dao.findOne(id);
	}
	public static <X extends BaseEntity> X  lock(Class<X> cls,String id){
		BaseDao<X, String> dao = getDao(cls);
		return dao.lock(id);
	}
	/**
	 * 获取列表,默认不加载关联对象
	 * @param cls
	 * @param page
	 * @param searchParams
	 * @param searchFilters
	 * @return
	 */
	public  static <T extends BaseEntity> Page<T> pageList(Class<T> cls ,Pageable page, Map<String, Object> searchParams,
														   SearchFilter... searchFilters) {
		boolean fetchAllFlag=false;
		return innerPageList(fetchAllFlag, cls, page, searchParams, searchFilters);

	}
	public static <X extends BaseEntity> Page<X> pageList(Class<X> cls,Pageable page, Specification<X> spec) {
		boolean fetchAllFlag=false;
		return innerPageList(fetchAllFlag, cls, page, null, spec);
	}
	public  static <X extends BaseEntity> Page<X> pageList(Class<X> cls, Pageable page,
														   Map<String, Object> searchParams) {
		return innerPageList(false, cls, page, searchParams);
	}
	public static <X extends BaseEntity> Page<X> pageList(Class<X> cls, Pageable page,
														  Map<String, Object> searchParams, final Specification<X> diySpec) {
		return innerPageListNoFetch( cls, page, searchParams, diySpec);
	}
	public  static <X extends BaseEntity> Page<X> fetchPage(Class<X> cls, Pageable page,
															Map<String, Object> searchParams) {
		return innerPageList(true, cls, page, searchParams);
	}
	public static <X extends BaseEntity> Page<X> fetchPage(Class<X> cls, Pageable page,
														   Map<String, Object> searchParams, final Specification<X> diySpec) {
		return innerPageList(true, cls, page, searchParams, diySpec);
	}
	/**
	 * 获取列表,默认加载关联对象
	 * @param cls
	 * @param page
	 * @param searchParams
	 * @param searchFilters
	 * @return
	 */
	public  static <T extends BaseEntity> Page<T> fetchPage(Class<T> cls , Pageable page, Map<String, Object> searchParams,
															SearchFilter... searchFilters) {
		boolean fetchAllFlag=true;
		return innerPageList(fetchAllFlag, cls, page, searchParams, searchFilters);

	}
	private  static <X extends BaseEntity> Page<X> innerPageList(final boolean fetchAllFlag,Class<X> cls, Pageable page,
																 Map<String, Object> searchParams) {

		BaseDao<X, String> dao = getDao(cls);
		Specification<X> spec;
		if (searchParams != null && searchParams.size() > 0) {
			Map<String, SearchFilter> ss = SearchFilter.parse(searchParams);
			spec=doFetch(fetchAllFlag,cls,ss);
		} else
		{
			Map<String, SearchFilter>  ss = Maps.newHashMap();
			spec = doFetch(fetchAllFlag,cls,ss);
		}
		return dao.findAll(spec, page);
	}

	private static <X extends BaseEntity> Page<X> innerPageListNoFetch(Class<X> cls, Pageable page,
																	   Map<String, Object> searchParams, final Specification<X> diySpec) {
		BaseDao<X, String> dao = getDao(cls);
		final Specification<X> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();
		spec = DynamicSpecifications.bySearchFilter(ss.values(), cls);
		Specification<X> last;
		if (diySpec == null)
			last = spec;
		else
			last = new Specification<X>() {
				@Override
				public Predicate toPredicate(Root<X> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					return cb.and(spec.toPredicate(root, query, cb), diySpec.toPredicate(root, query, cb));
				}
			};
		return dao.findAll(last, page);
	}

	private static <X extends BaseEntity> Page<X> innerPageList(boolean fetchAllFlag,Class<X> cls, Pageable page,
																Map<String, Object> searchParams, final Specification<X> diySpec) {
		BaseDao<X, String> dao = getDao(cls);
		final Specification<X> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();

		spec=doFetch(fetchAllFlag,cls,ss);

		Specification<X> last;
		if (diySpec == null)
			last = spec;
		else
			last = new Specification<X>() {
				@Override
				public Predicate toPredicate(Root<X> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					return cb.and(spec.toPredicate(root, query, cb), diySpec.toPredicate(root, query, cb));
				}
			};
		return dao.findAll(last, page);
	}


	/**
	 * 根据fetchAllFlag标志直接获取po的所有关联对象
	 * @param cls
	 * @param page
	 * @param searchParams
	 * @param searchFilters
	 * @return
	 * @return
	 */
	private  static <T extends BaseEntity> Page<T> innerPageList(boolean fetchAllFlag,Class<T> cls ,Pageable page, Map<String, Object> searchParams,
																 SearchFilter... searchFilters) {


		final Specification<T> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();

		for (SearchFilter sf : searchFilters) {
			ss.put(sf.fieldName, sf);
		}
		//Class<?> cls = Class.forName(clsname);
		BaseDao<T, String> dao = SS.getDao(cls);
		spec=doFetch(fetchAllFlag,cls,ss);
		return dao.findAll(spec, page);

	}
	public   static <T extends BaseEntity> List<T> list(Class<T> cls , PageSort sort, Map<String, Object> searchParams, SearchFilter... searchFilters) {

		return innerList(false,cls,sort,searchParams,searchFilters);
	}
	public   static <T extends BaseEntity> List<T> fetchList(Class<T> cls , PageSort sort, Map<String, Object> searchParams, SearchFilter... searchFilters) {

		return innerList(true,cls,sort,searchParams,searchFilters);
	}

	public   static <T extends BaseEntity> List<T> list(Class<T> cls , PageSort sort, Map<String, Object> searchParams, XSpec<T> xSpec) {

		return innerList(false,cls,sort,searchParams,xSpec);
	}
	public   static <T extends BaseEntity> List<T> fetchList(Class<T> cls , PageSort sort, Map<String, Object> searchParams,XSpec<T> xSpec) {
		return innerList(true,cls,sort,searchParams,xSpec);
	}

	/**
	 * 根据fetchAllFlag标志直接获取po的所有关联对象
	 * @param
	 * @param
	 * @param searchParams
	 * @param searchFilters
	 * @return
	 * @return
	 */
	private  static <T extends BaseEntity> List<T> innerList(boolean fetchAllFlag, Class<T> cls , PageSort sort, Map<String, Object> searchParams,
															 SearchFilter... searchFilters) {


		final Specification<T> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();

		for (SearchFilter sf : searchFilters) {
			ss.put(sf.fieldName, sf);
		}
		//Class<?> cls = Class.forName(clsname);
		BaseDao<T, String> dao = SS.getDao(cls);
		spec=doFetch(fetchAllFlag,cls,ss);
		return dao.findAll(spec, sort == null?null:sort.ToSort());

	}

	/**
	 * 根据fetchAllFlag标志直接获取po的所有关联对象
	 * @param
	 * @param
	 * @param searchParams
	 * @return
	 * @return
	 */
	private  static <T extends BaseEntity> List<T> innerList(boolean fetchAllFlag, Class<T> cls , PageSort sort, Map<String, Object> searchParams,final Specification<T> diySpec) {

		final Specification<T> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();


		//Class<?> cls = Class.forName(clsname);

		BaseDao<T, String> dao = SS.getDao(cls);
		spec=doFetch(fetchAllFlag,cls,ss);

		Specification<T> last;
		if (diySpec == null)
			last = spec;
		else
			last = new Specification<T>() {
				@Override
				public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					return cb.and(spec.toPredicate(root, query, cb), diySpec.toPredicate(root, query, cb));
				}
			};

		return dao.findAll(last, sort == null?null:sort.ToSort());

	}

	private  static <T extends BaseEntity>  Specification<T> doFetch(boolean fetchAllFlag,Class<T> cls,Map<String, SearchFilter> ss) {
		String[] fetchs=AnnotationUtils.getFetchs(cls,!fetchAllFlag);
		Specification spec = DynamicSpecifications.bySearchFilter(ss.values(), cls,fetchs);
		//		Specification<T> spec;
//		if(fetchAllFlag){
//			String[] fetchs=AnnotationUtils.getFetchs(cls,!fetchAllFlag);
//			spec = DynamicSpecifications.bySearchFilter(ss.values(), cls,fetchs);
//		}
//		else{
//			spec = DynamicSpecifications.bySearchFilter(ss.values(), cls);
//		}
		return spec;
	}
	public static  <T extends BaseEntity> T fetchOne(Class<T> cls, String id) {
		BaseDao<T, String> dao = getDao(cls);
		T rs = dao.fetchOne(id);
		//Hibernate.initialize(rs);

		return rs;
	}
	@SuppressWarnings("rawtypes")
	public static IFetchData getFetchDataService(Class<?> cls) {
		String name="fetch"+(cls.getSimpleName());
		Object rs=SpringContextHolder.getBean(name);
		if(rs instanceof IFetchData)
			return (IFetchData)rs;
		else
			return null;
	}


	public static Object getFetchOpService(Class<?> cls) {
		String name=(cls.getSimpleName())+"FetchOp";
		Object obj= SpringContextHolder.getBean(org.springframework.util.StringUtils.uncapitalize(name));
		if(obj==null)
			return getFetchDataService(cls);
		return obj;
	}

	public static <X extends BaseEntity> List<X> list(Class<?> cls, PageSort sort, XSpec<X> spec) {
		BaseDao<X, String> dao = SS.getDao(cls);
		return dao.findAll(spec, sort==null?null:sort.ToSort());
	}

}
