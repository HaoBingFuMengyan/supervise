package com.frogsing.heart.data;

import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.web.login.ILoginUser;
public interface IDataService {


	Map<String,Object> fetchOpData(Class<? extends BaseEntity> cls, BaseEntity vo,String op,Pageable page,Map<String,Object> searchParams ,ILoginUser u);

	Map<String, Object> fetchPage(ILoginUser u,Class<?> cls, Pageable page, Map<String, Object> searchParams, SearchFilter... searchFilters);

	void save(BaseEntity vo, ILoginUser u);

	void deleteit(Class<? extends BaseEntity> cls, String[] ids, ILoginUser u);

	Map<String, Object> fetchOneForUpate(BaseEntity po);

	BaseEntity fetchOne(Class<? extends BaseEntity> cls, String id);

}