/**
 * Filename FriendInterceptor.java
 * Create on 2014年12月26日
 * Copyright 2014 Frogsing All Rights Reserved.
 */
package com.frogsing.front.interceptor;

import org.apache.shiro.web.util.WebUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Description: 取合作网站编号
 * 
 * @author <a href="mailto:zhanghaifeng@frogsing.com">chain </a>
 * @since version1.0
 */
public class MbInterceptor extends HandlerInterceptorAdapter {

	public String version="v2.0.1";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {

		String version=WebUtils.toHttp(request).getHeader("version");
		checkVersion(version);
		
		return super.preHandle(request, response, handler);
	}

	private void checkVersion(String v) {
//		if(!this.version.equals(v))
//			E.CS("version_force_update","更新......");
	}
}
