package com.frogsing.heart.security.shiro;

public class ShiroUsernamePasswordTokenNoWord extends ShiroUsernamePasswordToken {


	/**
	 * 
	 */
	private static final long serialVersionUID = -5157976676505143546L;

	public ShiroUsernamePasswordTokenNoWord(String username, String password,
			boolean rememberMe, String host, UserType type) {
		super(username, password, rememberMe, host, type, "");
		
	}

	@Override
	public void CheckCaptcha() {
		
	}
	
}
