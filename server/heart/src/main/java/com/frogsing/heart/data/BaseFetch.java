package com.frogsing.heart.data;


import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.web.login.ILoginUser;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public  class BaseFetch<T> implements IFetchData<T> {
	
	@Override
	public void fetchDetailData(T obj,Map<String, Object> map) {
	}

	@Override
	public void fetchDetailData(T obj, Map<String, Object> map, ILoginUser u) {
		fetchDetailData(obj,map);
	}

	@Override
	public 	boolean fetchListData(Map<String, Object> map,Pageable page,
								 Map<String, Object> searchParams,
								 SearchFilter[] searchFilters){
		return false;
		
	}

	@Override
	public boolean fetchListData(Map<String, Object> map, Pageable page, Map<String, Object> searchParams, SearchFilter[] searchFilters, ILoginUser u) {
		return fetchListData(map,page,searchParams,searchFilters);
	}

	@Override
	public void beforeAdd(T vo, ILoginUser u) {
	}

	@Override
	public void afterAdd(T vo, ILoginUser u) {
		
	}
	
	@Override
	public void beforeUpdate(T vo,T po, ILoginUser u) {

	}

	@Override
	public void afterUpdte(T vo, T po,ILoginUser u) {
		
	}
	@Override
	public void commonCheck(T vo, ILoginUser u) {
		
	}

	@Override
	public void afterSave(T vo,T po, ILoginUser u) {
		
	}


	@Override
	public void beforeSave(T vo, T po, ILoginUser u) {

	}
	@Override
	public void beforeDelete(List<T> list) {

	}
	@Override
	public void afterDelete(List<T> list) {

	}
	@Override
	public boolean doDelete(List<T> list) {
		return false;
	}

	@Override
	public boolean doDelete(List<T> list, ILoginUser u) {
		return doDelete(list);
	}

	@Override
	public boolean doSave(BaseEntity vo, ILoginUser u) {
		return false;
	}


}
