/** 
 * Filename BaseAction.java
 * Create on 2014-2-27
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.web;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.utils.B;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Map;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public abstract class IListAction<T> {


	@Autowired
	IQueryService queryService;

	@RequestMapping(value = "list.shtml")
	public String list(
			String flag,
			@RequestParam(value = "start", defaultValue = "0") int start,
			@RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
			String[] sort, Model model,
			ServletRequest request) {

		Class clz = this.getClass();
		//2得到子类对象的泛型父类类型（也就是BaseDaoImpl<T>）
		ParameterizedType type = (ParameterizedType) clz.getGenericSuperclass();
		//
		Type[] types = type.getActualTypeArguments();

		Class<?> cls = (Class<T>) types[0];
		if (cls == null)
			E.S("未知对象类型:" );
		ActionUtils.checkPermissionQuery(request, cls.getSimpleName().toLowerCase());
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
		SearchFilter[] sf=filter(request,searchParams,B.Y(flag)?"":flag);

		fetchPageData(model, cls, start, limit, sort, searchParams,sf);
		return ActionUtils.dir(cls, "list");
	}


	public void fetchPageData(Model model, Class<?> cls, int start, int limit, String[] sort, Map<String, Object> searchParams,SearchFilter[] sf) {

		try {

			Pageable page = PageUtils.page(start, limit,sort );
			Page<BaseEntity> list;
			if(sf==null)
				list = queryService.listPage(cls, page, searchParams);
			else
				list= queryService.listPage(cls, page, searchParams,sf);
			model.addAttribute("list",list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	public SearchFilter[] filter(ServletRequest request,Map<String, Object>  searchParams,String flag){
		return null;
	}
}
