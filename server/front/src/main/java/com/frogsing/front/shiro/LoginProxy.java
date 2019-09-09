package com.frogsing.front.shiro;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken;
import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.web.login.ILoginService;
import com.frogsing.heart.web.login.ILoginUser;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
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
public class LoginProxy implements ILoginService {

	@Autowired
	private UserLoginService userLoginService;

	@Autowired
	private BankLoginService bankLoginService;

	/**
	 * 获取用户信息
	 */
	@Override
	public ILoginUser getIUser(ShiroUsernamePasswordToken token) {
		UserType type = token.getUsertype();
		switch (type) {
		case user:
			return userLoginService.getIUser(token);
		case bank:
			return bankLoginService.getIUser(token);
		case open:
			return userLoginService.getIUser(token);
		default:
			break;
		}

		return null;
	}

	/*
	 * 获取用户权限
	 */
	@Override
	@Transactional(readOnly = true)
	public Collection<String> getUserPurview(ILoginUser user) {
		UserType type = user.getUsertype();
		switch (type) {
		case user:
			return userLoginService.getUserPurview(user);
		case open:
			return userLoginService.getUserPurview(user);
		case bank:
			return bankLoginService.getUserPurview(user);
		default:
			break;
		}
		return null;

	}

	@Override
	public void DoLoginOk(ILoginUser user) {
		UserType type = user.getUsertype();
		switch (type) {
		case user:
			userLoginService.DoLoginOk(user);
		case bank:
			bankLoginService.DoLoginOk(user);
		default:
			break;
		}
	}

	@Override
	public Collection<String> getUserRole(ILoginUser user) {
		UserType type = user.getUsertype();
		switch (type) {
		case user:
			return userLoginService.getUserRole(user);
		case open:
			return userLoginService.getUserRole(user);
		case bank:
			return bankLoginService.getUserRole(user);
		default:
			break;
		}
		return null;

	}

	@Override
	public void doLoginIntegral(ILoginUser user) {

	}

	@Override
	public String getRedirectUrl(ServletRequest request,
			ServletResponse response, Subject subject) {
		UserType type = ShiroUtils.getUserType(request);
		if (type == null) {
			ILoginUser user = (ILoginUser) subject.getPrincipal();
			if (user != null)
				type = user.getUsertype();
		}
		if (type == null)
			return "";
		switch (type) {
		case user:
			return userLoginService.getRedirectUrl(request, response, subject);
		case bank:
			return bankLoginService.getRedirectUrl(request, response, subject);
		default:
			break;
		}
		return null;
	}

	@Override
	public String getSuccessUrl(ServletRequest request,
			ServletResponse response) {
		
		ILoginUser user = ShiroUtils.getCurrentUser();
		UserType type = user.getUsertype();
		switch (type) {
		case user:
			return userLoginService.getSuccessUrl( request,
					 response);
		case bank:
			return bankLoginService.getSuccessUrl( request,
					 response);
		default:
			break;
		}
		return null;
	}

}
