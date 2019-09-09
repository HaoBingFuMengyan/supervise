package com.frogsing.heart.security.shiro;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;
import com.frogsing.heart.security.utils.MD5;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.google.common.collect.Sets;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;

public  class ShiroUtils {

	/**
	 * 取得当前用户的登录名, 如果当前用户未登录则返回空字符串.
	 */
	public static String getCurrentUserName() {

		ILoginUser user = (ILoginUser) SecurityUtils.getSubject()
				.getPrincipal();
		if (user == null)
			return "";
		return user.getLoginName();

	}

	public static String getCurrentName() {

		ILoginUser user = (ILoginUser) SecurityUtils.getSubject()
				.getPrincipal();
		if (user == null)
			return "";
		return user.getName();

	}

	public static String getCurrentMemberId() {

		ILoginUser user = (ILoginUser) SecurityUtils.getSubject()
				.getPrincipal();
		if (user == null)
			return "";
		return user.getMemberId();

	}

	public static String getCurrentUserId() {

		ILoginUser user = (ILoginUser) SecurityUtils.getSubject()
				.getPrincipal();
		if (user == null)
			return "";
		return user.getId();

	}

	public static boolean isAdmin() {

		ILoginUser user = (ILoginUser) SecurityUtils.getSubject()
				.getPrincipal();
		if (user == null)
			return false;
		Sets.newHashSet();
		return user.IsAdmin();

	}

	@SuppressWarnings("unchecked")
	public static <T extends ILoginUser> T getCurrentUser() {
		return (T) SecurityUtils.getSubject().getPrincipal();
	}
	public static  ILoginUser  getUser() {
		return (ILoginUser) SecurityUtils.getSubject().getPrincipal();
	}
	public static void CheckCaptcha(String word) throws InvaildCaptchaException {
		Session session = SecurityUtils.getSubject().getSession();
		String code = (String) session
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (B.N(word) && !word.equalsIgnoreCase(code)) {
			throw new InvaildCaptchaException();
		}
	}

	public static String EncodePassword(String spassword) {

		return MD5.encode(spassword);
		// return Md5Crypt.md5Crypt(spassword.getBytes(),"$1$frogsing");
	}

	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}
	
	public static UserType getUserType(ServletRequest request) {
	
			String type = WebUtils.getCleanParam(request, "usertype");
			if(type==null)
				return UserType.user;

			if ("user".equals(type))
				return UserType.user;
			else
				if ("bank".equals(type))
					return UserType.bank;
				else
					if ("admin".equals(type))
						return UserType.admin;
					else
						return UserType.user;

		
	}
	

}
