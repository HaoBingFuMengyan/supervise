package com.frogsing.admin.shiro;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.log.Lg;
import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginService;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.IStaffService;
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.service.StaffService;
import com.frogsing.operator.vo.OperatorUser;
import com.google.common.collect.Sets;
import org.apache.shiro.authc.AuthenticationException;
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
public class OperatorLoginService implements ILoginService {


	//private static Logger logger = LoggerFactory.getLogger(OperatorLoginService.class);

	@Autowired
	private StaffService staffService;
		/**
		 * 获取用户信息
		 */
		@Override
		public ILoginUser getIUser(ShiroUsernamePasswordToken token) {
			try{
			Operator user= staffService.findOperatorByUserName(token.getUsername());
			if(user==null)
				return null;
			if(user.getBisdelete()== Consts.BoolType.YES.val())
				return null;
			token.setId(user.getId());
			checkIsNeedWord(user,token);
			OperatorUser u= new OperatorUser(user.getId(), user.getSusername(), user.getSrealname(),user.getSpassword(),0,user.getBisadmin(),user.getDlastlogintime());
			return u;
			}
			catch (Exception e) {
				Lg.act(e);
				return null;
			}
		}

	private void checkIsNeedWord(Operator user, ShiroUsernamePasswordToken token) {
		int count=0;
		if(user.getDendlogintime()!=null&&user.getDendlogintime().getTime()+1000*60> T.now().getTime())
			count=10;
		boolean rs=ShiroUsernamePasswordToken.isNeedWord(count);
		if(rs)
		{
			if (B.Y(token.getCheckword()))
				throw  new AuthenticationException("请输入验证码!");
		}
	}

	/* 获取用户权限
     *
     */
		@Override
		@Transactional(readOnly = true)
		public Collection<String> getUserPurview(ILoginUser user) {
			
			return this.staffService.getUserPurview(user) ;
			
		}
		

		/**
		 * 用户登录成功!
		 */
		@Override
		public void DoLoginOk(ILoginUser user) {
			//不用了
			//Lg.act("用户登录成功:"+JSONObject.wrap(user).toString());
			//staffService.doLoginOk(user);
		}

		@Override
		public Collection<String> getUserRole(ILoginUser user) {
			return Sets.newHashSet("admin");
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
