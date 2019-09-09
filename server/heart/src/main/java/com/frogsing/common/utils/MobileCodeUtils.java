package com.frogsing.common.utils;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class MobileCodeUtils {

	public static final int itimer = 60;
	public static final String REG_LAST_SEND_TIME = "REG_LAST_SEND_TIME";
	public static final String REG_LAST_SEND_CODE = "REG_LAST_SEND_CODE";
	public static final String REG_LAST_SEND_MOBILE = "REG_LAST_SEND_MOBILE";
	public final static String SMS_INTO_TYPE="SMS_INTO_TYPE";
	private static enum InfoType{
		SMS(0,"短信"),
		SITE(1,"站内信"),
		VOICE(2,"语音");
		public  static InfoType get(int i){
			switch(i)
			{
				case 0:
					return InfoType.SMS;
				case 1:
					return InfoType.SITE;
				case 2:
					return InfoType.VOICE;
			}
			return null;
		}


		private   int   nCode ;
		private   InfoType ( int   _nCode,String _nlabel) {
			this. nCode  = _nCode;
		}

		public int val(){
			return nCode;
		}

	}

	public static enum MobileCodeType{
		BINDACCOUNT("bindAccount","绑定账号发送短信"),
		DELIVERY("Delivery","提货发送短信"),
		FORGETPWD("forgetpwd","忘记密码发送短信"),
		SALEDELIVERYCODE("SaleDeliveryCode","卖家审核提货单发送短信"),
		SALETRANSFERCODE("SaletransferCode","卖家审核过户发送短信"),
		TRANSFER("Transfer","卖家审核过户发送短信"),
		UPDATELOGINPWD("updateLoginPwd","修改登录密码发送短信"),
		TRADEPWD("TradePwd","设置修改发送短信"),
		USERREG("userReg","新增用户发送短信"),
		FINDTRADEPWD("findTradePwd","找回密码发送短信");
		public  static MobileCodeType get(String i){
			switch(i)
			{
				case "BINDACCOUNT":
					return MobileCodeType.BINDACCOUNT;
				case "DELIVERY":
					return MobileCodeType.DELIVERY;
				case "FORGETPWD":
					return MobileCodeType.FORGETPWD;
				case "SALEDELIVERYCODE":
					return MobileCodeType.SALEDELIVERYCODE;
				case "SALETRANSFERCODE":
					return MobileCodeType.SALETRANSFERCODE;
				case "TRANSFER":
					return MobileCodeType.TRANSFER;
				case "UPDATELOGINPWD":
					return MobileCodeType.UPDATELOGINPWD;
				case "TRADEPWD":
					return MobileCodeType.TRADEPWD;
				case "USERREG":
					return MobileCodeType.USERREG;
				case "FINDTRADEPWD":
					return MobileCodeType.FINDTRADEPWD;
			}
			return null;
		}

		private   String   nCode ;
		private   MobileCodeType ( String   _nCode,String _nlabel) {
			this. nCode  = _nCode;
		}

		public String val(){
			return nCode;
		}
	}



	/**
	 *
	 * @param session
	 * @param smobile
	 * @param scode
	 * @param flag，业务类型
	 * @throws ServiceException
	 */
	public static void checkCode(HttpSession session, String smobile, String scode, String flag)
			throws ServiceException {
		if (B.Y(smobile))
			E.S("手机号不能为空");
		if (B.Y(scode)) {
			E.S("验证码不能为空");
		}
		System.out.println(session.getAttribute(flag + "~" + REG_LAST_SEND_CODE)+",flag="+flag);
		if (!scode.equals(session.getAttribute(flag + "~" + REG_LAST_SEND_CODE))) {
			E.S("验证码错误!");
		}
		if (!smobile.equals(session.getAttribute(flag + "~" + REG_LAST_SEND_MOBILE)))
			E.S("手机号变更需要重发验证码!");
		session.removeAttribute(flag + "~" + REG_LAST_SEND_CODE);
		session.removeAttribute(flag + "~" + REG_LAST_SEND_MOBILE);
		session.removeAttribute(flag + "~" + REG_LAST_SEND_TIME);
	}

	

	/**
	 * 发送验证码
	 * 
	 * @param session
	 * @param smobile
	 * @param flag,业务类型
	 * @return
	 */
	public static int mobileCodeHandle(HttpSession session, String smobile, String flag) {
		Long lasttime = (Long) session.getAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_TIME);

		if (lasttime == null) {
			lasttime = System.currentTimeMillis();
			session.setAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_TIME, lasttime);
			sendMobileCode(session, smobile, flag,InfoType.SMS.val());
			return 0;
		} else {
			Long nowtime = System.currentTimeMillis();
			if ((nowtime - lasttime) / 1000 > (MobileCodeUtils.itimer - 1)) {
				sendMobileCode(session, smobile, flag,InfoType.SMS.val());
				session.setAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_TIME, nowtime);
				return 0;
			} else
				return (int) (MobileCodeUtils.itimer - (nowtime - lasttime) / 1000);
		}
	}
	
	public static int mobileVoiceCodeHandle(HttpSession session, String smobile, String flag) {
		Long lasttime = (Long) session.getAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_TIME);

		if (lasttime == null) {
			lasttime = System.currentTimeMillis();
			session.setAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_TIME, lasttime);
			sendMobileCode(session, smobile, flag,InfoType.VOICE.val());
			return 0;
		} else {
			Long nowtime = System.currentTimeMillis();
			if ((nowtime - lasttime) / 1000 > (MobileCodeUtils.itimer - 1)) {
				sendMobileCode(session, smobile, flag,InfoType.VOICE.val());
				session.setAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_TIME, nowtime);
				return 0;
			} else
				return (int) (MobileCodeUtils.itimer - (nowtime - lasttime) / 1000);
		}
	}
	

	/**
	 *
	 * @param session
	 * @param smobile
	 * @param flag,业务类型
	 */
	private static void sendMobileCode(HttpSession session, String smobile, String flag,int infotype) {
		String code = String.valueOf(System.currentTimeMillis());
		int len = code.length();
		code = code.substring(len - 5, len - 1);
		session.setAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_CODE, code);
		session.setAttribute(flag + "~" + MobileCodeUtils.REG_LAST_SEND_MOBILE, smobile);
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		if(-1 != infotype)
			map.put(MobileCodeUtils.SMS_INTO_TYPE, String.valueOf(infotype));
		System.out.println(session.getId() + "验证码:" + code+",flag="+flag);
		NoticeUtils.sendSmsWithNode(flag, smobile, map);

	}

}
