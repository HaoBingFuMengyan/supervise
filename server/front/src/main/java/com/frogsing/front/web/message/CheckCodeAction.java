package com.frogsing.front.web.message;

import com.frogsing.common.utils.MobileCodeUtils;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.ext.ExtResult;
import com.frogsing.heart.security.shiro.InvaildCaptchaException;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.security.utils.MD5;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.BaseAction;
import com.frogsing.member.IMemberService;
import com.frogsing.member.IUserService;
import com.frogsing.member.po.User;
import com.frogsing.member.service.MemberService;
import com.frogsing.member.service.UserService;
import com.frogsing.member.vo.LoginUser;
import com.frogsing.member.vo.TRegister;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * 
 * 真正登录的POST请求由Filter完成,
 * 
 * @frogsing van
 */
@Controller
public class CheckCodeAction extends BaseAction {

	@Autowired
	private UserService userService;

	@Autowired
	private MemberService memberService;


	/**
	 * 给当前登录的用户发送短信验证码
	 * @param simgcheckword
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "sendmobilecode.json", method = RequestMethod.POST)
	@ResponseBody
	public ExtResult sendmobilecode(
			@RequestParam(value = "sendtype", defaultValue = "0") int sendtype,
			@RequestParam(value = "nodecode", defaultValue = "") String nodecode,
			@RequestParam(value = "smobile", defaultValue = "") String smobile,
			@RequestParam(value = "checkonly", defaultValue = "true") boolean checkonly,
			@RequestParam(value = "checkimg", defaultValue = "false") boolean checkimg,
			@RequestParam(value = "simgcheckword", defaultValue = "") String simgcheckword, Model model,
			HttpServletRequest request, HttpSession session) {
		try {
			if(checkimg && B.Y(simgcheckword))
				E.S("请输入图形验证码");
			if(B.Y(smobile))
				E.S("手机号不能为空");
			if(checkimg)
				ShiroUtils.CheckCaptcha(simgcheckword);
			if(checkonly)
				this.userService.CheckWord(smobile);
			if(B.Y(nodecode))
				E.S("发送短信标识错误");
			int check = (sendtype ==  0 ? MobileCodeUtils.mobileCodeHandle(session, smobile, nodecode):MobileCodeUtils.mobileVoiceCodeHandle(session, smobile, nodecode));
			if (check == 0)
				return ExtResult.success("", MobileCodeUtils.itimer);
			else
				return ExtResult.failure("发送验证码间隔时间太短,请稍候再试!", check);
		} catch (ServiceException e) {
			return ExtResult.failure(e.getMessage());
		} catch (InvaildCaptchaException e) {
			return ExtResult.failure("图形验证码错误");
		} catch (Exception e) {
			e.printStackTrace();
			return ExtResult.failure(e.getMessage());
		}
	}
	
	@RequestMapping(value = "sendcode.json", method = RequestMethod.POST)
	@ResponseBody
	public ExtResult sendcode(
			@RequestParam(value = "sendtype", defaultValue = "0") int sendtype,
			@RequestParam(value = "nodecode", defaultValue = "") String nodecode,
			@RequestParam(value = "smobile", defaultValue = "") String smobile,
			@RequestParam(value = "oldpwd", defaultValue = "") String oldpwd,
			@RequestParam(value = "checkonly", defaultValue = "true") boolean checkonly,
			@RequestParam(value = "checkimg", defaultValue = "false") boolean checkimg,
			@RequestParam(value = "simgcheckword", defaultValue = "") String simgcheckword, Model model,
			HttpServletRequest request, HttpSession session) {
		try {
			if(checkimg && B.Y(simgcheckword))
				E.S("请输入图形验证码");
			if(B.Y(smobile))
				E.S("手机号不能为空");
			if(checkimg)
				ShiroUtils.CheckCaptcha(simgcheckword);
			if(checkonly)
				this.userService.CheckWord(smobile);
			if(B.Y(oldpwd))
				E.S("原密码不能为空");
			LoginUser lu=ShiroUtils.getCurrentUser();
			User u=userService.findOne(lu.getId());
			if(!u.getSpassword().equals(MD5.encode(oldpwd)))
				E.S("原密码输入出错");
			if(B.Y(nodecode))
				E.S("发送短信标识错误");
			int check = (sendtype ==  0 ? MobileCodeUtils.mobileCodeHandle(session, smobile, nodecode):MobileCodeUtils.mobileVoiceCodeHandle(session, smobile, nodecode));
			if (check == 0)
				return ExtResult.success("", MobileCodeUtils.itimer);
			else
				return ExtResult.failure("发送验证码间隔时间太短,请稍候再试!", check);
		} catch (ServiceException e) {
			return ExtResult.failure(e.getMessage());
		} catch (InvaildCaptchaException e) {
			return ExtResult.failure("图形验证码错误");
		} catch (Exception e) {
			e.printStackTrace();
			return ExtResult.failure(e.getMessage());
		}
	}

	@RequestMapping(value = "sendtradecode.json", method = RequestMethod.POST)
	@ResponseBody
	public ExtResult sendtradecode(
			@RequestParam(value = "sendtype", defaultValue = "0") int sendtype,
			@RequestParam(value = "nodecode", defaultValue = "") String nodecode,
			@RequestParam(value = "smobile", defaultValue = "") String smobile,
			@RequestParam(value = "oldpwd", defaultValue = "") String oldpwd,
			@RequestParam(value = "checkonly", defaultValue = "true") boolean checkonly,
			@RequestParam(value = "checkimg", defaultValue = "false") boolean checkimg,
			@RequestParam(value = "simgcheckword", defaultValue = "") String simgcheckword, Model model,
			HttpServletRequest request, HttpSession session) {
		try {
			if(checkimg && B.Y(simgcheckword))
				E.S("请输入图形验证码");
			if(B.Y(smobile))
				E.S("手机号不能为空");
			if(checkimg)
				ShiroUtils.CheckCaptcha(simgcheckword);
			if(checkonly)
				this.userService.CheckWord(smobile);
			LoginUser lu=ShiroUtils.getCurrentUser();
			User u=userService.findOne(lu.getId());
			if(B.N(u.getStradepassword())){
				if(B.Y(oldpwd))
					E.S("原密码不能为空");
				if(!u.getStradepassword().equals(MD5.encode(oldpwd)))
					E.S("原密码输入出错");
			}
			if(B.Y(nodecode))
				E.S("发送短信标识错误");
			int check = (sendtype ==  0 ? MobileCodeUtils.mobileCodeHandle(session, smobile, nodecode):MobileCodeUtils.mobileVoiceCodeHandle(session, smobile, nodecode));
			if (check == 0)
				return ExtResult.success("", MobileCodeUtils.itimer);
			else
				return ExtResult.failure("发送验证码间隔时间太短,请稍候再试!", check);
		} catch (ServiceException e) {
			return ExtResult.failure(e.getMessage());
		} catch (InvaildCaptchaException e) {
			return ExtResult.failure("图形验证码错误");
		} catch (Exception e) {
			e.printStackTrace();
			return ExtResult.failure(e.getMessage());
		}
	}
	
	/**
	 * 发送注册短信验证码
	 * @param model
	 * @param request
	 * @param session
	 * @param smobile	发送验证码手机号
	 * @return
	 */
	@RequestMapping(value = "useRegCode.json")
	@ResponseBody
	public ExtResult useRegCode(Model model,HttpServletRequest request,HttpSession session,String smobile,TRegister register){
		try {
			this.userService.CheckWord(smobile);
			
        	int check = MobileCodeUtils.mobileCodeHandle(session,smobile, "register");
			if (check == 0)
				return ExtResult.success("验证码发送成功!", MobileCodeUtils.itimer);
			else
				return ExtResult.failure("时间间隔太短,请稍等!", check);
            
		} catch (Exception e) {
			e.printStackTrace();
			return ExtResult.failure(e.getMessage());
		}
	}
	
	/**
	 * 
	 * 修改密码发送验证码
	 * 
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "goSpasswordSendcode.json")
	@ResponseBody
	public ExtResult goSpasswordSendcode(
			@RequestParam(value = "ncode") String ncode, Model model,
			HttpServletRequest request, HttpSession session) {
		try {
			LoginUser u = ShiroUtils.getCurrentUser();
			int check = MobileCodeUtils.mobileCodeHandle(session, u.getSmobile(),ncode);
			if (check == 0)
				return ExtResult.success("", MobileCodeUtils.itimer);
			else
				return ExtResult.failure("时间间隔太短,请稍等!", check);
		} catch (ServiceException e) {
			return ExtResult.failure(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return ExtResult.failure(e.getMessage());
		}
	}



}
