package com.frogsing.common.utils;

import com.frogsing.common.iface.INoticeService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.spring.SpringContextHolder;
import freemarker.template.TemplateException;

import java.io.IOException;

/**
 * Description:
 *
 * @author <a href="mailto:zhanghaifeng@frogsing.com">chain </a>
 * @since version1.0
 */
public class NoticeUtils {

	private static INoticeService s;
	private static Object o=new Object();

	private static INoticeService getS(){
		if(s==null){
			synchronized (o) {
				if(s==null)
					s=SpringContextHolder.getBean(INoticeService.class);
				if(s==null)
					E.S("INoticeService的实现类找不到!");
			}

		}
		return s;
	}


	/**
	 * 根据配置给操作员发消息
	 *
	 * @param snode
	 *            ,节点编号
	 * @param suserid
	 *            ,操作员id
	 * @param params
	 *            ,参数必须为[key,value,key,value...],其中key为Sring,value可以是对象, 如果value是对象，在模板中可以用${key.xxx}
	 */
	public static void sendToUser(String snode, String suserid, Object params) {

		getS().sendToUser(snode, suserid, params);
	}

	/**
	 * 根据配置给会员的管理员发消息
	 *
	 * @param snode
	 *            ,节点编号
	 * @param smemberid
	 *            ,操作员id
	 * @param params
	 *            ,参数必须为[key,value,key,value...],其中key为Sring,value可以是对象, 如果value是对象，在模板中可以用${key.xxx}
	 */
	public static void sendToMber(String snode, String smemberid, Object params) {
		getS().sendToMber(snode, smemberid, params);
	}

	/**
	 * 根据配置给任意手机发消息
	 *
	 * @param snode
	 *            ,节点编号
	 * @param smobile
	 *            ,手机号
	 * @param params
	 *            ,参数必须为[key,value,key,value...],其中key为Sring,value可以是对象, 如果value是对象，在模板中可以用${key.xxx}
	 * @throws TemplateException
	 * @throws IOException
	 */
	public static void sendSmsWithNode(String snode, String smobile,
			Object params)  {
		getS().sendSmsWithNode(snode,smobile,params);
	}

	/**
	 * 直接给手机发消息
	 *
	 * @param scontent
	 *            ,发送内容
	 * @param smobile
	 *            ,手机号
	 * @param params
	 *            ,参数必须为[key,value,key,value...],其中key为Sring,value可以是对象, 如果value是对象，在模板中可以用${key.xxx}
	 * @throws TemplateException
	 * @throws IOException
	 */
	public static void sendSmsWithNoNode(String scontent, String smobile,
			Object[] params)  {
		getS().sendSmsWithNoNode(scontent, smobile, params);
	}

	public static void sendSmsToTech(String snode,Object params){
		getS().sendSmsToTech(snode, params);
	}

	/**
	 * 根据后台角色发送短信
	 * @param role
	 * @param snode
	 * @param params
	 */
	public static void sendSmsToPlatRole(String role,String snode,Object params){
		getS().sendSmsToPlatRole(role, snode, params);
	}

	/**
	 * 根据后台权限码发送短信
	 * @param right
	 * @param snode
	 * @param params
	 */
	public static void sendSmsToPlatRight(String right,String snode,Object params){
		getS().sendSmsToPlatRight(right, snode, params);
	}

	/**
	 * 根据前台角色发送短信
	 * @param role
	 * @param snode
	 * @param params
	 */
	public static void sendSmsToFrontRole(String role,String snode,Object params){
		getS().sendSmsToFrontRole(role, snode, params);
	}

	/**
	 * 根据前台权限码发送短信
	 * @param right
	 * @param snode
	 * @param params
	 */
	public static void sendSmsToFrontRight(String right,String snode,Object params){
		getS().sendSmsToFrontRight(right, snode, params);
	}


	public enum SendMessageType {
		ToMember("ToMember", "发给会员，必须参数：NODECODE节点、TOMEMBERID会员ID、参数"),
		ToUser("ToUser", "发给用户，必须参数：NODECODE节点、TOUSERID用户ID、参数"),
		ToTech("ToTech", "发给会员，必须参数：NODECODE节点、参数"),
		ToPlatRole("ToPlatRole", "发给平台操作，必须参数：NODECODE节点、SENDROLE发送角色、参数"),
		ToPlatRight("ToPlatRight", "发给拥有平台权限码的操作，必须参数：NODECODE节点、SENDRIGHT发送权限码、参数"),
		ToFrontRole("ToFrontRole", "发给前台拥有某一角色的交易员，必须参数：NODECODE节点、SENDROLE发送角色、参数"),
		ToFrontRight("ToFrontRight", "发给前台拥有权限码的操作，必须参数：NODECODE节点、SENDRIGHT发送权限码、参数"),
		WithNode("WithNode", "按节点发送，必须参数：NODECODE节点、SMOBILE手机号、参数"),
		WithNoNode("WithNoNode","不按节点，直接发送内容，必须参数：NODECODE节点、SMOBILE手机号、CONTENT模版、参数");

		private String nCode;
		private SendMessageType(String _nCode, String _nlabel) {
			this.nCode = _nCode;
		}

		public String val() {
			return nCode;
		}
		public final static String NODECODE="NODECODE";
		public final static String SENDTYPE="SENDTYPE";
		public final static String TOMEMBERID="TOMEMBERID";
		public final static String SENDROLE="SENDROLE";
		public final static String SMOBILE="SMOBILE";
		public final static String CONTENT="CONTENT";
		public final static String TOUSERID="TOUSERID";
		public final static String SENDRIGHT="SENDRIGHT";
		public final static String DEFAULT_SENDROLE="PlatMsgRole";   //发送给平台的默认角色
		public final static String DEFAULT_SENDTYPE=SendMessageType.ToMember.val();   //发送给平台的默认角色

	}
}
