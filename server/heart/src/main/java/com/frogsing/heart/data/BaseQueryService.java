package com.frogsing.heart.data;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.DynamicSpecifications;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.utils.B;
import com.google.common.collect.Maps;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;


/**
 * 查询通用的Service
 * @author Administrator
 *
 * @param
 */
@SuppressWarnings({ "rawtypes","unchecked"})
public abstract class BaseQueryService implements IQueryService{

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> Page<X> listPage(Class<?> cls,Pageable page, Map<String, Object> searchParams) {
        return SS.pageList((Class)cls, page, searchParams);//获取列表，默认加载关联对象
    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> Page<X> listPage(Pageable page, XSpec<X> spec) {
        return SS.pageList(spec.getCls(),page,null,spec);

    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> Page<X> listPage(Class<?> cls,Pageable page, Map<String, Object> searchParams,
                                                   SearchFilter... searchFilters) {
        return SS.pageList((Class)cls, page, searchParams,searchFilters);
    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> Page<X> fetchPage(Class<?> cls,Pageable page, Map<String, Object> searchParams) {
        return SS.fetchPage((Class)cls, page, searchParams);//获取列表，默认加载关联对象
    }

//    @Override
//    @Transactional(readOnly = true)
//    public <X extends BaseEntity> Page<X> fetchPage(Class<?> cls,Pageable page, Specification<X> spec) {
//        Map<String, Object> searchParams=null;
//	    return SS.fetchList((Class)cls, page,searchParams,spec);//获取列表，默认加载关联对象
//
//    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> Page<X> fetchPage(Class<?> cls,Pageable page, Map<String, Object> searchParams,
                                                    SearchFilter... searchFilters) {
        return SS.fetchPage((Class)cls, page, searchParams,searchFilters);
    }

    @Override
    public <X extends BaseEntity> List<X> list(PageSort sort, XSpec<X> spec) {

        return SS.list(spec.getCls(),sort,spec);
    }


    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> List<X> list(Class<?> cls,Map<String, Object> searchParams, String[] sort,
                                               SearchFilter... searchFilters) {
        return this.list(cls,searchParams, PageSort.parase(sort), searchFilters);
    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> List<X> list(Class<?> cls,Map<String, Object> searchParams, PageSort sort,
                                               SearchFilter... searchFilters) {

        return SS.list((Class)cls,sort,searchParams,searchFilters);
    }
    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> List<X> fetchList(Class<?> cls,Map<String, Object> searchParams, PageSort sort,
                                                    SearchFilter... searchFilters) {

        return SS.fetchList((Class)cls,sort,searchParams,searchFilters);
    }
    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> X findOne(Class<?> cls,String id) {
        BaseDao<X, String> dao = SS.getDao((Class)cls);
        return dao.findOne(id);
    }
    @Override
    public <X extends BaseEntity> X fetchOne(Class<?> cls, String id) {
        BaseDao<X, String> dao = SS.getDao((Class)cls);
        return dao.fetchOne(id);
    }

    @Override
    public <X extends BaseEntity> X fetchOne(XSpec<X> spec) {
         List<X> list = SS.fetchList(spec.getCls(),null,null,spec);
         if(B.Y(list))
             return null;
         return list.get(0);
    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> List<X> findAll(Class<?> cls) {
        BaseDao dao = SS.getDao((Class)cls);
        return dao.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> List<X> findAll(Class<?> cls,Map<String, Object> searchParams) {
        Specification<X> spec;
        BaseDao dao = SS.getDao((Class)cls);
        if (searchParams != null) {
            Map<String, SearchFilter> ss = SearchFilter.parse(searchParams);
            spec = DynamicSpecifications.bySearchFilter(ss.values(),
                    dao.getDomainClass());
        } else
            spec = null;
        return dao.findAll(spec);
    }


    @Override
    @Transactional(readOnly=true)
    public <X extends BaseEntity> List<X> findAll(Class<?> cls, Map<String, Object> searchParams, PageSort sort) {
        Specification<X> spec;
        BaseDao dao = SS.getDao((Class)cls);
        if (searchParams != null) {
            Map<String, SearchFilter> ss = SearchFilter.parse(searchParams);
            spec = DynamicSpecifications.bySearchFilter(ss.values(),
                    dao.getDomainClass());
        } else
            spec = null;
        return dao.findAll(spec, sort.ToSort());

    }

    @Override
    public <X extends BaseEntity> List<X> findFiltersLimit(Class<?> cls,PageSort sort, int limit,
                                                           SearchFilter... searchFilters) {
        Specification<X> spec;
        BaseDao dao = SS.getDao((Class)cls);
        Map<String, SearchFilter> ss = Maps.newHashMap();
        for (SearchFilter sf : searchFilters) {
            ss.put(sf.fieldName, sf);
        }
        spec = DynamicSpecifications.bySearchFilter(ss.values(), dao.getDomainClass());
        return dao.findAllLimit(spec, (sort != null? sort.ToSort() : null), limit);
    }


    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> List<X> findByColumn(Class<?> cls,String colName, Object colValue) {
        BaseDao dao = SS.getDao((Class)cls);
        return dao.findByPropertyName(colName, colValue);
    }

    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> X findOneByProperty(Class<?> cls,final String colName, final Object colValue) {
        BaseDao<X, String> dao = SS.getDao((Class)cls);
        return dao.findOne(new Specification<X>() {
            public Predicate toPredicate(Root<X> root, CriteriaQuery<?> query,
                                         CriteriaBuilder cb) {
                return cb.equal(root.get(colName), colValue);
            }
        });
    }


    @Override
    @Transactional(readOnly = true)
    public <X extends BaseEntity> Page<X> listsPage(Class<?> cls,Pageable page, Map<String, Object> searchParams,
                                                    SearchFilter... searchFilters) {
        Specification<X> spec;
        Map<String, SearchFilter> ss;
        BaseDao dao = SS.getDao((Class)cls);
        if (searchParams != null)
            ss = SearchFilter.parse(searchParams);
        else
            ss = Maps.newHashMap();

        for (SearchFilter sf : searchFilters) {
            ss.put(sf.fieldName, sf);
        }
        spec = DynamicSpecifications.bySearchFilter(ss.values(), dao.getDomainClass());

        return dao.findAll(spec, page);
    }

    //id可以为 空
    @Override
    public <X extends BaseEntity> Long countByColumn(Class<?> cls, String colName, Object colValue,String id) {
        BaseDao<X, String> dao = SS.getDao((Class)cls);
        return dao.count(colName,colValue,id);
    }
	

}
