package com.frogsing.front.shiro;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken;
import com.frogsing.heart.web.login.ILoginService;
import com.frogsing.heart.web.login.ILoginUser;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Collection;

/**
 * 用户管理类.
 * 
 * @frogsing van
 */
// Spring Service Bean的标识.
@Component
@Transactional
public class BankLoginService implements ILoginService {

	@Override
	public Collection<String> getUserPurview(ILoginUser user) {
		
		return null;
	}

	@Override
	public void DoLoginOk(ILoginUser user) {
		
		
	}

	@Override
	public ILoginUser getIUser(ShiroUsernamePasswordToken token) {
		
		return null;
	}

	@Override
	public Collection<String> getUserRole(ILoginUser user) {
		
		return null;
	}

	@Override
	public void doLoginIntegral(ILoginUser user) {
		
		
	}

	@Override
	public String getRedirectUrl(ServletRequest request,
			ServletResponse response, Subject subject) {
		
		return null;
	}

	@Override
	public String getSuccessUrl(ServletRequest request,
			ServletResponse response) {
		
		return null;
	}



}
