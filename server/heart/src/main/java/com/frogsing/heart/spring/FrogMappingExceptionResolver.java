package com.frogsing.heart.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class FrogMappingExceptionResolver extends SimpleMappingExceptionResolver {

	
	@Override
	protected ModelAndView doResolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
	
			String viewName = determineViewName(ex, request);
			if (viewName != null) {
				Integer statusCode = determineStatusCode(request, viewName);
				if (statusCode != null) {
					applyStatusCodeIfPossible(request, response, statusCode);
				}
				if(request.getRequestURI().endsWith(".json") || request.getRequestURI().endsWith(".jhtml") )
				{
					viewName=viewName.replace("error", "jerror");
				}
				return getModelAndView(viewName, ex, request);
			}
			else {
				return null;
			}
	}
}
