package com.frogsing.heart.web.login;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Collection;


public interface ILoginService {

	

	public abstract Collection<String> getUserPurview(ILoginUser user);

	public abstract void DoLoginOk(ILoginUser user);
	
	public abstract ILoginUser getIUser(ShiroUsernamePasswordToken token);

	public abstract Collection<String> getUserRole(ILoginUser user);
	
	public abstract void doLoginIntegral(ILoginUser user);

	public abstract String getRedirectUrl(ServletRequest request,
                                          ServletResponse response, Subject subject);

	public abstract String getSuccessUrl(ServletRequest request,
                                         ServletResponse response);

}