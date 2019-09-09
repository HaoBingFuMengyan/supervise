package com.frogsing.heart.data;

import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;


public interface IQueryService{

	<X extends BaseEntity> Page<X> listPage(Class<?> cls, Pageable page, Map<String, Object> searchParams);

	<X extends BaseEntity> Page<X> listPage(Pageable page, XSpec<X> spec);

	<X extends BaseEntity> Page<X> listPage(Class<?> cls, Pageable page, Map<String, Object> searchParams, SearchFilter... searchFilters);

	<X extends BaseEntity> Page<X> fetchPage(Class<?> cls, Pageable page, Map<String, Object> searchParams);

	//<X extends BaseEntity> Page<X> fetchPage(Class<?> cls,Pageable page, Specification<X> spec);

	<X extends BaseEntity> Page<X> fetchPage(Class<?> cls, Pageable page, Map<String, Object> searchParams, SearchFilter... searchFilters);


	<X extends BaseEntity> List<X> list(PageSort sort, XSpec<X> spec);

	<X extends BaseEntity> List<X> list(Class<?> cls, Map<String, Object> searchParams, String[] sort, SearchFilter... searchFilters);

	<X extends BaseEntity> List<X> list(Class<?> cls, Map<String, Object> searchParams, PageSort sort, SearchFilter... searchFilters);

	<X extends BaseEntity> List<X> fetchList(Class<?> cls, Map<String, Object> searchParams, PageSort sort, SearchFilter... searchFilters);

	<X extends BaseEntity> X findOne(Class<?> cls, String id);

	<X extends BaseEntity> X fetchOne(Class<?> cls, String id);

	<X extends BaseEntity> X fetchOne(XSpec<X> spec);

	<X extends BaseEntity> List<X> findAll(Class<?> cls);

	<X extends BaseEntity> List<X> findAll(Class<?> cls, Map<String, Object> searchParams);

	<X extends BaseEntity> List<X> findFiltersLimit(Class<?> cls, PageSort sort, int limit, SearchFilter... searchFilters);

	<X extends BaseEntity> List<X> findByColumn(Class<?> cls, String colName, Object colValue);

	<X extends BaseEntity> X findOneByProperty(Class<?> cls, String colName, Object colValue);

	<X extends BaseEntity> Page<X> listsPage(Class<?> cls, Pageable page, Map<String, Object> searchParams, SearchFilter... searchFilters);

	<X extends BaseEntity> List<X> findAll(Class<?> cls, Map<String, Object> searchParams, PageSort sort);
	
	<X extends BaseEntity> Long countByColumn(Class<?> cls, String colName, Object colValue, String id);
	

}
