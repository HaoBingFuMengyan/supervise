/*
 * Copyright 2008-2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.frogsing.heart.jpa;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.Servlets;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import javax.servlet.ServletRequest;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

/**
 * Basic {@code Page} implementation.
 * 
 * @author Oliver Gierke
 */
public class JJResult implements Serializable{

	private static final long serialVersionUID = 867655909294344406L;

	private  List<?> data;

	private  String code="0";

	private  String msg="";

	private  long count =0;

	public  static JJResult jj(Page<?> p){
		return new JJResult(p);
	}

	public  static Pageable page(ServletRequest request){
		String page=request.getParameter("page");
		String limit=request.getParameter("limit");
		String[] sort=request.getParameterValues("sort");
		Pageable pageable = PageUtils.jjpage(B.Y(page)?1:Integer.parseInt(page), B.Y(limit)?Integer.parseInt(PageUtils.Limit):Integer.parseInt(limit),sort);
		return pageable;
	}

	public  static <T extends BaseEntity> JJResult jj(Class<T> cls, ServletRequest request, IQueryService queryService, Consumer<XSpec<T>>... consumer){
		String page=request.getParameter("page");
		String limit=request.getParameter("limit");
		String[] sort=request.getParameterValues("sort");
		Pageable pageable = PageUtils.jjpage(B.Y(page)?1:Integer.parseInt(page), B.Y(limit)?Integer.parseInt(PageUtils.Limit):Integer.parseInt(limit),sort);
		XSpec<T> xSpec=new XSpec<>(cls);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request);
		xSpec.and(searchParams);
		if(consumer.length != 0)
			consumer[0].accept(xSpec);
		Page<T> rpage = queryService.listPage(pageable, xSpec);
		return new JJResult(rpage);
	}

	public JJResult(){

	}
	public JJResult(Page<?> p){
		this.data=p.getContent();
		this.count=p.getTotalElements();
		if(this.count==0)
			msg="抱歉，没有加载到任何数据！";
	}

	public List<?> getData() {
		return data;
	}

	public String getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	public long getCount() {
		return count;
	}
}
