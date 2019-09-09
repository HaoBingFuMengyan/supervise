package com.frogsing.heart.jpa;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.persistence.DynamicSpecifications;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.web.login.ILoginUser;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;

abstract class BaseService<T> implements IBaseService<T>  {

    protected abstract BaseDao<T, String> getBaseDao();

    protected abstract void BaseSaveCheck(ILoginUser u,T obj);


    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#getDomainClass()
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#getDomainClass()
	 */
	@Override
	public Class<T> getDomainClass() {
        return this.getBaseDao().getDomainClass();
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listPage(org.springframework.data.domain.Pageable, java.util.Map)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listPage(org.springframework.data.domain.Pageable, java.util.Map)
	 */
	@Override
	@Transactional(readOnly = true)
    public Page<T> listPage(Pageable page, Map<String, Object> searchParams) {

        Specification<T> spec;
        if (searchParams != null && searchParams.size() > 0) {
            Map<String, SearchFilter> ss = SearchFilter.parse(searchParams);
            spec = DynamicSpecifications.bySearchFilter(ss.values(),
                    getBaseDao().getDomainClass());
        } else
            spec = null;
        return getBaseDao().findAll(spec, page);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listPage(org.springframework.data.domain.Pageable, org.springframework.data.jpa.domain.Specification)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listPage(org.springframework.data.domain.Pageable, org.springframework.data.jpa.domain.Specification)
	 */
	@Override
	@Transactional(readOnly = true)
    public Page<T> listPage(Pageable page, Specification<T> spec) {

        return getBaseDao().findAll(spec, page);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listPage(org.springframework.data.domain.Pageable, java.util.Map, com.frogsing.heart.persistence.SearchFilter)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listPage(org.springframework.data.domain.Pageable, java.util.Map, com.frogsing.heart.persistence.SearchFilter)
	 */
	@Override
	@Transactional(readOnly = true)
    public Page<T> listPage(Pageable page, Map<String, Object> searchParams,
                            SearchFilter... searchFilters) {

        Specification<T> spec;
        Map<String, SearchFilter> ss;
        if (searchParams != null)
            ss = SearchFilter.parse(searchParams);
        else
            ss = Maps.newHashMap();

        for (SearchFilter sf : searchFilters) {
            ss.put(sf.fieldName, sf);
        }
        spec = DynamicSpecifications.bySearchFilter(ss.values(), getBaseDao()
                .getDomainClass());

        return getBaseDao().findAll(spec, page);
        // return getBaseDao().findAll( spec,page);
    }

   	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listPage(org.springframework.data.domain.Pageable, java.util.Map, org.springframework.data.jpa.domain.Specification)
	 */
	@Transactional(readOnly = true)
    public Page<T> listPage(Pageable page, Map<String, Object> searchParams,
                            final Specification<T> diySpec) {

        final Specification<T> spec;
        Map<String, SearchFilter> ss;
        if (searchParams != null)
            ss = SearchFilter.parse(searchParams);
        else
            ss = Maps.newHashMap();

        spec = DynamicSpecifications.bySearchFilter(ss.values(), getBaseDao()
                .getDomainClass());

        Specification<T> last = new Specification<T>() {
            
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
                                         CriteriaBuilder cb) {
                if(diySpec == null)
                	return spec.toPredicate(root, query, cb);
                else
                	return cb.and(spec.toPredicate(root, query, cb),
                        diySpec.toPredicate(root, query, cb));
            }
        };
        return getBaseDao().findAll(last, page);
        // return getBaseDao().findAll( spec,page);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#list(java.util.Map, java.lang.String, com.frogsing.heart.persistence.SearchFilter)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#list(java.util.Map, java.lang.String, com.frogsing.heart.persistence.SearchFilter)
	 */
	@Override
	@Transactional(readOnly = true)
    public List<T> list(Map<String, Object> searchParams, String sort,
                        SearchFilter... searchFilters) {
        return this.list(searchParams, PageSort.parase(sort), searchFilters);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#list(java.util.Map, org.springframework.data.domain.Sort, com.frogsing.heart.persistence.SearchFilter)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#list(java.util.Map, org.springframework.data.domain.Sort, com.frogsing.heart.persistence.SearchFilter)
	 */
	@Override
	@Transactional(readOnly = true)
    public List<T> list(Map<String, Object> searchParams, PageSort sort,
                        SearchFilter... searchFilters) {

        Specification<T> spec;
        Map<String, SearchFilter> ss;
        if (searchParams != null)
            ss = SearchFilter.parse(searchParams);
        else
            ss = Maps.newHashMap();

        for (SearchFilter sf : searchFilters) {
            if (sf.value == null)
                continue;
            ss.put(sf.fieldName, sf);
        }
        spec = DynamicSpecifications.bySearchFilter(ss.values(), getBaseDao()
                .getDomainClass());

        return getBaseDao().findAll(spec, sort.ToSort());
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#BaseSave(T, java.lang.String)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#BaseSave(T, java.lang.String)
	 */
	@Override
	@Transactional
    public T BaseSave(T obj, String id,ILoginUser u) throws ServiceException {
        BaseSaveCheck(u,obj);
        obj = getBaseDao().save(obj);
        return obj;
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#BaseDelete(java.lang.String[])
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#BaseDelete(java.lang.String[])
	 */
	@Override
	@Transactional
    public void BaseDelete(String[] checkboxId) throws ServiceException {
        try {
            for (String id : checkboxId) {
                if (StringUtils.isNotBlank(id)) {
                    T obj = getBaseDao().findOne(id);
                    if (obj != null) {
                        BaseDeleteBefore(id, obj);
                        getBaseDao().delete(obj);
                    }
                }
            }
        } catch (ServiceException ex) {
            E.S(ex.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new ServiceException("根据id数组删除单据编号失败");
        }
    }

    @Transactional
    protected void BaseDeleteBefore(String id, T obj) {

    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findOne(java.lang.String)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findOne(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
    public T findOne(String id) {
        return getBaseDao().findOne(id);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findAll()
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findAll()
	 */
	@Override
	@Transactional(readOnly = true)
    public List<T> findAll() {
        return getBaseDao().findAll();
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findAll(java.util.Map)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findAll(java.util.Map)
	 */
	@Override
	@Transactional(readOnly = true)
    public List<T> findAll(Map<String, Object> searchParams) {
        Specification<T> spec;
        if (searchParams != null) {
            Map<String, SearchFilter> ss = SearchFilter.parse(searchParams);
            spec = DynamicSpecifications.bySearchFilter(ss.values(),
                    getBaseDao().getDomainClass());
        } else
            spec = null;
        return getBaseDao().findAll(spec);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findAll(java.util.Map, org.springframework.data.domain.Sort)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findAll(java.util.Map, org.springframework.data.domain.Sort)
	 */
	@Override
	@Transactional(readOnly = true)
    public List<T> findAll(Map<String, Object> searchParams, PageSort sort) {
        Specification<T> spec;
        if (searchParams != null) {
            Map<String, SearchFilter> ss = SearchFilter.parse(searchParams);
            spec = DynamicSpecifications.bySearchFilter(ss.values(),
                    getBaseDao().getDomainClass());
        } else
            spec = null;
        return getBaseDao().findAll(spec, sort.ToSort());
    }

   

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findFiltersLimit(org.springframework.data.domain.Sort, int, com.frogsing.heart.persistence.SearchFilter)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findFiltersLimit(org.springframework.data.domain.Sort, int, com.frogsing.heart.persistence.SearchFilter)
	 */
	@Override
	public List<T> findFiltersLimit(PageSort sort, int limit,
                                    SearchFilter... searchFilters) {
        Specification<T> spec;
        Map<String, SearchFilter> ss = Maps.newHashMap();
        for (SearchFilter sf : searchFilters) {
            ss.put(sf.fieldName, sf);
        }
        spec = DynamicSpecifications.bySearchFilter(ss.values(), getBaseDao()
                .getDomainClass());
        return getBaseDao().findAllLimit(spec, sort.ToSort(), limit);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findSpecLimit(org.springframework.data.jpa.domain.Specification, org.springframework.data.domain.Sort, int, java.lang.String)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findSpecLimit(org.springframework.data.jpa.domain.Specification, org.springframework.data.domain.Sort, int, java.lang.String)
	 */
	@Transactional(readOnly = true)
    public List<T> findSpecLimit(final Specification<T> spec, PageSort sort,
                                 int limit, final String... fetch) {
        Specification<T> newspec = new Specification<T>() {
            
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
                                         CriteriaBuilder cb) {
                for (int i = 0; i < fetch.length; i++) {

                    root.fetch(fetch[i]);
                }

                return spec.toPredicate(root, query, cb);
            }
        };
        return getBaseDao().findAllLimit(newspec, sort.ToSort(), limit);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findByColumn(java.lang.String, java.lang.Object)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findByColumn(java.lang.String, java.lang.Object)
	 */
	@Override
	@Transactional(readOnly = true)
    public List<T> findByColumn(String colName, Object colValue) {
        return getBaseDao().findByPropertyName(colName, colValue);
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findOneByProperty(java.lang.String, java.lang.Object)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#findOneByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	@Transactional(readOnly = true)
    public T findOneByProperty(final String colName, final Object colValue) {
        return getBaseDao().findOne(new Specification<T>() {

            
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
                                         CriteriaBuilder cb) {
                return cb.equal(root.get(colName), colValue);
            }
        });
    }

    /* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listsPage(org.springframework.data.domain.Pageable, java.util.Map, com.frogsing.heart.persistence.SearchFilter)
	 */
    
	/* (non-Javadoc)
	 * @see com.frogsing.heart.jpa.IBaseService#listsPage(org.springframework.data.domain.Pageable, java.util.Map, com.frogsing.heart.persistence.SearchFilter)
	 */
	@Override
	@Transactional(readOnly = true)
    public Page<T> listsPage(Pageable page, Map<String, Object> searchParams,
                             SearchFilter... searchFilters) {

        Specification<T> spec;
        Map<String, SearchFilter> ss;
        if (searchParams != null)
            ss = SearchFilter.parse(searchParams);
        else
            ss = Maps.newHashMap();

        for (SearchFilter sf : searchFilters) {
            ss.put(sf.fieldName, sf);
        }
        spec = DynamicSpecifications.bySearchFilter(ss.values(), getBaseDao()
                .getDomainClass());

        return getBaseDao().findAll(spec, page);
    }

}
