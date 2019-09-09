/**
 * Filename FriendInterceptor.java
 * Create on 2014年12月26日
 * Copyright 2014 Frogsing All Rights Reserved.
 */
package com.frogsing.front.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frogsing.member.IUserService;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IMemberService;
import com.frogsing.member.po.Member;

/**
 * Description: 取合作网站编号
 * 
 * @author <a href="mailto:zhanghaifeng@frogsing.com">chain </a>
 * @since version1.0
 */
public class FriendInterceptor extends HandlerInterceptorAdapter {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		String clientno = request.getParameter("clientno");
		if (B.N(clientno)) {
			request.getSession().setAttribute("clientno", clientno);
		}
		
		try {
			ILoginUser u = ShiroUtils.getCurrentUser();
			if(u != null){
				Member m = SpringContextHolder.getBean(IUserService.class).findBySmemberid(u.getMemberId());
				if(u.getAuthtype() != m.getIauthtype()){
					ShiroUtils.getSubject().logout();

					WebUtils.redirectToSavedRequest(request, response, "/login.html");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return super.preHandle(request, response, handler);
	}
}
