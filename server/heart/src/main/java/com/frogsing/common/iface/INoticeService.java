package com.frogsing.common.iface;

import freemarker.template.TemplateException;

import java.io.IOException;

public interface INoticeService {


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
	void sendToUser(String snode, String suserid, Object params);

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
	void sendToMber(String snode, String smemberid, Object params);

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
	void sendSmsWithNode(String snode, String smobile, Object params);

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
	void sendSmsWithNoNode(String scontent, String smobile, Object[] params);

	void sendSmsToTech(String snode, Object params);

	/**
	 * 根据后台角色发送短信
	 * @param role
	 * @param snode
	 * @param params
	 */
	void sendSmsToPlatRole(String role, String snode, Object params);

	/**
	 * 根据权限码发送短信
	 * @param right
	 * @param snode
	 * @param params
	 */
	void sendSmsToPlatRight(String right, String snode, Object params);

	/**
	 * 根据后台角色发送短信
	 * @param role
	 * @param snode
	 * @param params
	 */
	void sendSmsToFrontRole(String role, String snode, Object params);

	/**
	 * 根据权限码发送短信
	 * @param right
	 * @param snode
	 * @param params
	 */
	void sendSmsToFrontRight(String right, String snode, Object params);



}