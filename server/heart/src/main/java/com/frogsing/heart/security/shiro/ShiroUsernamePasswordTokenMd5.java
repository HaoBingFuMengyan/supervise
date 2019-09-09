package com.frogsing.heart.security.shiro;

import com.frogsing.heart.security.utils.MD5;

public class ShiroUsernamePasswordTokenMd5 extends ShiroUsernamePasswordToken {


	/**
	 * 
	 */
	private static final long serialVersionUID = -5157976676505143546L;

	public ShiroUsernamePasswordTokenMd5(String username, String password,
			boolean rememberMe, String host, UserType type) {
		super(username, password, rememberMe, host, type, "");
		
	}

	@Override
	public void CheckCaptcha() {
		
	}
	@Override
	public String prePassword(String spassword) {
		return MD5.encode(spassword);
	}
}
