/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.frogsing.heart.security.shiro;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginService;
import com.frogsing.heart.web.login.ILoginUser;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.PostConstruct;
import java.util.Collection;

public class ShiroDbRealm extends AuthorizingRealm {
	//
	// private void AdminRole(SimpleAuthorizationInfo info, ShiroUser user) {
	//
	// // Collection<String> permissions;
	// // if(Consts.isTrue(user.getBisadmin())){
	// // permissions =loginService.getAllPurview();
	// //
	// // }
	// // else{
	// // permissions=loginService.getAllPurview(user.getId());
	// // }
	// // info.addStringPermissions(permissions);
	// // loginService.DoLoginOk(user.getId());
	// // return;
	// // info.addStringPermission("purview:add");
	// // info.addStringPermission("purview:delete");
	// // info.addStringPermission("purview:edit");
	// // info.addStringPermission("purview:query");
	// //
	// //
	// // info.addStringPermission("menu:add");
	// // info.addStringPermission("menu:delete");
	// // info.addStringPermission("menu:edit");
	// // info.addStringPermission("menu:query");
	// //
	// // info.addStringPermission("operator:add");
	// // info.addStringPermission("operator:delete");
	// // info.addStringPermission("operator:edit");
	// // info.addStringPermission("operator:query");
	// // info.addStringPermission("operator:role");
	// //
	// // info.addStringPermission("role:add");
	// // info.addStringPermission("role:delete");
	// // info.addStringPermission("role:edit");
	// // info.addStringPermission("role:query");
	// // info.addStringPermission("role:purview");
	// //
	// // info.addStringPermission("sequence:add");
	// // info.addStringPermission("sequence:delete");
	// // info.addStringPermission("sequence:edit");
	// // info.addStringPermission("sequence:query");
	// //
	//
	// }

	protected ILoginService loginService;

	public void setLoginService(ILoginService loginService) {
		this.loginService = loginService;
	}

	/**
	 * 认证回调函数,登录时调用.
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {

		ShiroUsernamePasswordToken token = (ShiroUsernamePasswordToken) authcToken;
		if (!(token.getUsertype() == UserType.open)) {
			token.CheckCaptcha();
		}
		ILoginUser user = loginService.getIUser(token);
		if (user != null) {
			if (B.Y(user.getPassword()))
				return null;
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), null, getName());
			return info;
		} else {
			return null;
		}
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		ILoginUser user = (ILoginUser) principals.getPrimaryPrincipal();

		// User user = userService.findUserByLoginName(shiroUser.loginName);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Collection<String> permissions;

		permissions = loginService.getUserPurview(user);

		info.addStringPermissions(permissions);

		Collection<String> roles = loginService.getUserRole(user);
		info.addRoles(roles);

		return info;

	}

	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		ShiroCredentialsMatcher matcher = new ShiroCredentialsMatcher();
		setCredentialsMatcher(matcher);
	}

	public void setloginService(ILoginService loginService) {
		this.loginService = loginService;
	}

//	/**
//	 * 强制退出用户
//	 */
//	public void forceLogout(String loginName) {
//
//		//Session currentSession = null;
//		Collection<Session> sessions = sessionDAO.getActiveSessions();
//		for (Session session : sessions) {
//			if (loginName.equals(String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)))) {
//				session.setTimeout(0);// 设置session立即失效，即将其踢出系统
//				break;
//			}
//
//		}
//	}
}
