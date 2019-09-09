package com.frogsing.heart.security.shiro;


import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginService;

public class ShiroLogoutFilter extends LogoutFilter {
	
	
	private ILoginService loginService;
	
	public void setLoginService(ILoginService loginService) {
		this.loginService = loginService;
	}
	@Override
	 public String getRedirectUrl() {
        return super.getRedirectUrl();
    }
//	protected String getRedirectUrl(ServletRequest request, ServletResponse response, Subject subject) {
//		HttpServletRequest req=(HttpServletRequest)request;
//		if(req.getRequestURI().indexOf("logout.shtml")>=0)
//			return "/login.shtml";
//		else
//			return "/login.html";
//    }
	 @Override
	    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
	        Subject subject = getSubject(request, response);
	        String redirectUrl =loginService.getRedirectUrl(request, response, subject);
	        if(B.Y(redirectUrl))
	        	redirectUrl = getRedirectUrl(request, response, subject);
	        //try/catch added for SHIRO-298:
	        try {
	            subject.logout();
	        } catch (SessionException ise) {
	        	ise.printStackTrace();
	          //  log.debug("Encountered session exception during logout.  This can generally safely be ignored.", ise);
	        }
	       
	        issueRedirect(request, response, redirectUrl);
	        return false;
	    }
}
