package com.frogsing.heart.spring;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.security.shiro.ShiroUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.UUID;

public class AvoidDuplicateSubmissionInterceptor extends
		HandlerInterceptorAdapter {

	private static final Logger LOG =LoggerFactory.getLogger(AvoidDuplicateSubmissionInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,

	HttpServletResponse response, Object handler) throws Exception {
		request.setAttribute("ctx",request.getContextPath());
		request.setAttribute("ctxStatic",request.getContextPath()+"/static");
		checkPage(request,response);
		String user = ShiroUtils.getCurrentUserName();

		if (StringUtils.isNotBlank(user)) {

			if(handler instanceof HandlerMethod){
				HandlerMethod handlerMethod = (HandlerMethod) handler;
	
				Method method = handlerMethod.getMethod();
	
				AvoidDuplicateSubmission annotation = method
						.getAnnotation(AvoidDuplicateSubmission.class);
	
				if (annotation != null) {
	
					boolean needSaveSession = annotation.needSaveToken();
	
					if (needSaveSession) {
	
						request.getSession(false).setAttribute("token",
								UUID.randomUUID().toString());
	
					}
	
					boolean needRemoveSession = annotation.needRemoveToken();
	
					if (needRemoveSession) {
	
						if (isRepeatSubmit(request)) {
	
							LOG.warn("please don't repeat submit,[user:"
									+ user + ",url:"
	
									+ request.getServletPath() + "]");
	
							return false;
	
						}
	
						request.getSession(false).removeAttribute("token");
	
					}
	
				}

		}
		}

		return true;

	}

	private void checkPage(HttpServletRequest request, HttpServletResponse response) {

		if(request.getRequestURI().indexOf(".jsp")>0)
			E.S("禁止访问");
		
	}

	private boolean isRepeatSubmit(HttpServletRequest request) {

		String serverToken = (String) request.getSession(false).getAttribute(
				"token");

		if (serverToken == null) {

			return true;

		}

		String clinetToken = request.getParameter("token");

		if (clinetToken == null) {

			return true;

		}

		if (!serverToken.equals(clinetToken)) {

			return true;

		}

		return false;

	}

}
