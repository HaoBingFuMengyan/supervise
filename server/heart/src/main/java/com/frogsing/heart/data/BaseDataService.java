package com.frogsing.heart.data;


import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@SuppressWarnings({ "rawtypes", "unchecked" })
public abstract class BaseDataService implements IDataService {


	/**
	 * 根据对象名,查询对象的列表fetchAll
	 */

	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> fetchPage(ILoginUser u,Class<?> cls, Pageable page, Map<String, Object> searchParams,
										 SearchFilter... searchFilters) {

//
		Map<String, Object> map=Maps.newHashMap();



		IFetchData service=SS.getFetchDataService(cls);
		if(service!=null)
		{
			//如果fetchlist true 就不再执行通用分页
			if(!service.fetchListData(map,page,searchParams,searchFilters,u)){
				Page rs = SS.pageList((Class)cls, page, searchParams, searchFilters);
				map.put("list", rs);
			}
		}
		else {
			Page rs = SS.pageList((Class)cls, page, searchParams, searchFilters);
			map.put("list", rs);
		}
		return map;

	}

	/**
	 * 如果id 不为空,找出 cls的 po,否则 new po(),找fetchdetaildata();
	 */

	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> fetchOneForUpate(BaseEntity po ) {

		Map<String,Object> map=Maps.newHashMap();
		IFetchData service=SS.getFetchDataService(po.getClass());

		if(service!=null)
		{
			service.fetchDetailData(po,map,null);
			if(!map.containsKey("data"))
				map.put("data",po);

		}

		return map;
	}
	@Override
	public BaseEntity fetchOne(Class<? extends BaseEntity> cls   ,String id) {

		BaseEntity po=null;
		po= SS.fetchOne((Class<? extends BaseEntity>)cls, id);
		return po;
	}


	@Override
	public Map<String, Object> fetchOpData(Class<? extends BaseEntity> cls, BaseEntity vo, String op, Pageable pageable, Map<String, Object> searchPara, ILoginUser iLoginUser) {
		Map<String,Object> map=Maps.newHashMap();


		//Map<String, Object> map, MemberFund order,
		// Pageable pageable,
		// Map<String, Object> searchPara,
		// ILoginUser iLoginUser
		Object service=SS.getFetchOpService(cls);
		if(service != null){
			Method opmethod= ReflectionUtils.findMethod(service.getClass(),op,null);//,Map.class,vo.getClass(),Pageable.class,Map.class,ILoginUser.class);
			if(opmethod != null){
				if(opmethod.getParameterTypes().length==5)
					ReflectionUtils.invokeMethod(opmethod,service,map,vo,pageable,searchPara, iLoginUser);
				return map;
			}
		}


		return map;
	}


	@Override
	@Transactional(readOnly=false)
	public void save(BaseEntity vo,ILoginUser u) {
		Class<? extends BaseEntity> cls = vo.getClass();

		IFetchData service=SS.getFetchDataService(cls);
		BaseEntity po =vo;
		if(service!=null)
		{
			service.commonCheck(vo, u);
			if(B.Y(vo.getId())){
				vo.setId(null);
				service.beforeAdd(vo,u);
				service.beforeSave(vo,po,u);
			}
			else
			{
				po= SS.lock(cls, vo.getId());
				if(po==null)
					E.S("找不到记录:"+vo.getId());
				service.beforeUpdate(vo,po,u);
				service.beforeSave(vo,po,u);
				BeanUtils.copyProperties(vo, po, po.getClass().getSuperclass());
			}

		}


		if(service!=null)
		{
			if(!service.doSave(po,u))
				SS.save(po);
			if(B.Y(vo.getId())){
				service.afterAdd(vo,u);
			}
			else
			{
				service.afterUpdte(vo,po,u);
			}
			service.afterSave(vo,po, u);

		}
		else
		{
			SS.save(po);
		}

	}

	@Override
	@Transactional(readOnly=false)
	public void deleteit(Class<? extends BaseEntity> cls, String[] ids, ILoginUser u) {

		if(ids.length==0)
			return;
		List<? extends BaseEntity> list = SS.findAll(cls,Lists.newArrayList(ids));
		IFetchData service=SS.getFetchDataService(cls);
		if(service!=null)
		{
			service.beforeDelete(list);
			if(!service.doDelete(list))
			{
				SS.delete(list);
			}
			service.afterDelete(list);
		}else{
			SS.delete(list);
		}

	}





}
