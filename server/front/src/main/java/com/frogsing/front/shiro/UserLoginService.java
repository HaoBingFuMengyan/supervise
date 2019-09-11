package com.frogsing.front.shiro;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.log.Lg;
import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginService;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IUserService;
import com.frogsing.member.po.Mber;
import com.frogsing.member.po.User;
import com.frogsing.member.service.UserService;
import com.frogsing.member.utils.MEMBER.AuthenticateType;
import com.frogsing.member.utils.MEMBER.MemberType;
import com.frogsing.member.vo.LoginUser;
import com.google.common.collect.Sets;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Collection;
import java.util.HashSet;

/**
 * 用户管理类.
 * 
 * @frogsing van
 */
// Spring Service Bean的标识.
@Component
@Transactional
public class UserLoginService implements ILoginService {

	@Autowired
	private UserService userService;
	

	/**
	 * 获取用户信息
	 */
	@Override
	public ILoginUser getIUser(ShiroUsernamePasswordToken token) {
		User user = userService.findBySusername(token.getUsername());
		if (user == null)
			return null;
		if (user.getBisdelete() == Consts.BoolType.YES.val())
			return null;
		if (user.getBisvalid()== Consts.BoolType.NO.val())
			return null;
		Mber member = user.getMember();
		if (member == null)
			return null;
		token.setId(user.getId());
		checkIsNeedWord(user,token);
		LoginUser u = new LoginUser(user.getId(), user.getSmobile(), user.getSname(),
				token.prePassword(user.getSpassword()), member.getImembertype(), user.getBisadmin(),
				user.getDlastloginsuccessdate(), user.getSmemberid(),
				member.getScnname() == null ? "" : member.getScnname(), member.getSmemberno(), member.getIauthtype(),
				0, user.getSlikename(), user.getSmobile(), 0);
		u.setImembersitetype(0);
		return u;
	}

	private void checkIsNeedWord(User user, ShiroUsernamePasswordToken token) {
	    boolean rs=ShiroUsernamePasswordToken.isNeedWord(user.getIerrorcount());
		if(rs)
		{
			if (B.Y(token.getCheckword()))
                   throw  new AuthenticationException("请输入验证码!");
        }
	}

	/*
	 * 获取用户权限
	 */
	@Override
	@Transactional(readOnly = true)
	public Collection<String> getUserPurview(ILoginUser user) {

		LoginUser u = (LoginUser) user;

		Collection<String> db;
		Collection<String> rs = Sets.newHashSet();
		if (user.IsAdmin()) {
			if (u.getBissalesman() == Consts.BoolType.YES.val()) {
				db = userService.getAllPurview(u.getMembertype(), u.getAuthtype(), u.getMemberId());
			} else {
				db = userService.getAllPurview(u.getMembertype(), u.getAuthtype(), u.getMemberId());
			}
			Collection<String> special = userService.getAllSpecialPurview(u.getMembertype(), u.getMemberId());
			if (special != null)
				db.addAll(special);
		} else {
			db = userService.getAllPurview(user.getId());
		}
		for (String t : db) {
			String[] as = t.split(",");
			for (String b : as) {
				if(B.N(b.trim()))
					rs.add(b.trim());
			}
		}
		Lg.act("所有权限:" + rs.toString());
		return rs;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.frogsing.service.sys.ILoginService#DoLoginOk(java.lang.String)
	 */
	@Override
	public void DoLoginOk(ILoginUser user) {
	    //已经不用这个方法了,新增过滤器处理
		//userService.updateLoginTime(user.getId(), DateUtils.getCurrentDateTime());
	}

	@Override

	public Collection<String> getUserRole(ILoginUser user) {
		// LoginUser u=(LoginUser)user;
		HashSet<String> map = Sets.newHashSet("user");

		if (user instanceof LoginUser) {
			LoginUser u = (LoginUser) user;
			map.add(AuthenticateType.get(u.getAuthtype()).name().toLowerCase());
			map.add(MemberType.get( user.getMembertype()).name().toLowerCase());
		}
		return map;
	}


	@Override
	public void doLoginIntegral(ILoginUser user) {

	}

	@Override
	public String getRedirectUrl(ServletRequest request, ServletResponse response, Subject subject) {

		return "index.shtml";
	}

//	private String newLoginPoint(String susername) {
//		String key = StringHelper.randomNum(128);
//		Singlepointlogin t = new Singlepointlogin();
//		t.setDaddtime(T.now());
//		t.setDvalidtime(DateUtils.addSeconds(T.now(), 120));
//		t.setSusername(susername);
//		t.setSkey(key);
//		singlepointloginDao.save(t);
//		singlepointloginDao.deleteInvalid(T.now());
//		return key;
//	}

	@Override
	public String getSuccessUrl(ServletRequest request, ServletResponse response) {
//		HttpServletRequest r=(HttpServletRequest)request;
//		LoginUser u = ShiroUtils.getCurrentUser();
//		String host = Props.get("site.host");
//		if (B.N(host)) {
//			if (host.contains(r.getServerName())) {
//				String h = SiteUtils.getSiteHost(u.getImembersitetype());
//				if (B.N(h)) {
//					String key = newLoginPoint(u.getLoginName());
//					ShiroUtils.getSubject().logout();
//					return "http://" + h + request.getServletContext().getContextPath() + "/loginpoint.html?id=" + key;
//
//				}
//			}
//		}
		return "index.shtml";
	}


}
