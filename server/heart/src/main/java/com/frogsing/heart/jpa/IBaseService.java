package com.frogsing.heart.jpa;

import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.web.login.ILoginUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import javax.frogsing.exception.ServiceException;
import java.util.List;
import java.util.Map;

 interface IBaseService<T> {

	Class<T> getDomainClass();

	Page<T> listPage(Pageable page, Map<String, Object> searchParams);

	Page<T> listPage(Pageable page, Specification<T> spec);

	Page<T> listPage(Pageable page, Map<String, Object> searchParams, SearchFilter... searchFilters);

	List<T> list(Map<String, Object> searchParams, String sort, SearchFilter... searchFilters);

	List<T> list(Map<String, Object> searchParams, PageSort sort, SearchFilter... searchFilters);

	T BaseSave(T obj, String id, ILoginUser u) throws ServiceException;

	void BaseDelete(String[] checkboxId) throws ServiceException;

	T findOne(String id);

	List<T> findAll();

	List<T> findAll(Map<String, Object> searchParams);


	List<T> findFiltersLimit(PageSort sort, int limit, SearchFilter... searchFilters);

	//List<T> findSpecLimit(Specification<T> spec, PageSort sort, int limit, String... fetch);

	List<T> findByColumn(String colName, Object colValue);

	T findOneByProperty(String colName, Object colValue);

	Page<T> listsPage(Pageable page, Map<String, Object> searchParams, SearchFilter... searchFilters);

	List<T> findAll(Map<String, Object> searchParams, PageSort sort);

}