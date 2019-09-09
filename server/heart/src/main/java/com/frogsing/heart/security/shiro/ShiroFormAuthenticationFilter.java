package com.frogsing.heart.security.shiro;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ShiroFormAuthenticationFilter extends FormAuthenticationFilter {

	@Override
	protected AuthenticationToken createToken(ServletRequest request,
			ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		String checkword = getCheckwork(request);

		UserType type = ShiroUtils.getUserType(request);
		// if(type==UserType.admin){
		// String checkword = getCheckwork(request);
		// ShiroUtils.CheckCaptcha(checkword);
		// }
		return createToken(username, password, type, request, response,
				checkword);
	}

	private String getCheckwork(ServletRequest request) {

		return WebUtils.getCleanParam(request, "checkword");
	}

	

	protected AuthenticationToken createToken(String username, String password,
			UserType type, ServletRequest request, ServletResponse response,
			String checkword) {
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		return createToken(username, password, rememberMe, host, type,
				checkword);
	}

	protected AuthenticationToken createToken(String username, String password,
			boolean rememberMe, String host, UserType type, String checkword) {
		return new ShiroUsernamePasswordToken(username, password, rememberMe,
				host, type, checkword);
	}
//	@Override
//	public String getSuccessUrl() {
//		String rs= loginService.getSuccessUrl();
//		if(B.Y(rs))
//			return super.getSuccessUrl();
//		else
//			return rs;
//	}
	private ILoginService loginService;
	
	public void setLoginService(ILoginService loginService) {
		this.loginService = loginService;
	}
	@Override
	protected void issueSuccessRedirect(ServletRequest request,
			ServletResponse response) throws Exception {
		
		 String rs= loginService.getSuccessUrl( request,
					 response);
		 
		if(B.Y(rs))
			rs=getSuccessUrl();
		
		WebUtils.redirectToSavedRequest(request, response, rs);
		
	}
	@Override
	protected void setFailureAttribute(ServletRequest request, AuthenticationException ae) {
		String className = ae.getClass().getName();
		request.setAttribute(getFailureKeyAttribute(), className);
		String error=ae.getMessage();
		if(className.equals("com.frogsing.heart.security.shiro.InvaildCaptchaException"))
		{
			error="验证码无效!!";
		}
		else
		if(className.equals("org.apache.shiro.authc.IncorrectCredentialsException"))
			error="密码不正确!";
		else
			if(className.equals("org.apache.shiro.authc.UnknownAccountException"))
				error="用户名不存在!";

		request.setAttribute("errormsg",error);
	}
}
