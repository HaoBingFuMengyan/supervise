package com.frogsing.heart.security.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;


public class ShiroCredentialsMatcher extends SimpleCredentialsMatcher {
	@Override
	protected Object getCredentials(AuthenticationToken token) {
		return ShiroUtils.EncodePassword(new String((char[])token.getCredentials()));
		
    }
	/**
	 * Asserts that the submitted {@code AuthenticationToken}'s credentials match the stored account
	 * {@code AuthenticationInfo}'s credentials, and if not, throws an {@link AuthenticationException}.
	 *
	 * @param token the submitted authentication token
	 * @param info  the AuthenticationInfo corresponding to the given {@code token}
	 * @throws AuthenticationException if the token's credentials do not match the stored account credentials.
	 */



}
