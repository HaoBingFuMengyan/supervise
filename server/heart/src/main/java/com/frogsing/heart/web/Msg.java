/** 
 * Filename MsgUtils.java
 * Create on 2014-3-1
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.web;

import com.frogsing.heart.log.Lg;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.frogsing.exception.ServiceException;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class Msg {
	
	private String metype;
	private int allowhide=0;
	public String getMetype() {
		return metype;
	}
	public void setMetype(String metype) {
		this.metype = metype;
	}
	private int type=0;
	private String title="";
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String msg) {
		this.title = msg;
	}
		
	public Msg(int type,String msg){
		this.title = msg;
		this.type = type;
	}
	
	public Msg(String metype,String msg,int allowhide){
		this.title = msg;
		this.metype = metype;
		this.allowhide=allowhide;
		initType(metype);
	}
	public Integer getAllowhide() {
		return allowhide;
	}
	public void setAllowhide(int allowhide) {
		this.allowhide = allowhide;
	}
	public Msg(String metype,String msg){
		this.title = msg;
		this.metype = metype;
		initType(metype);
	}

	private void initType(String metype){
		if("danger".equals(metype)){
			this.type=1;
			return;
		}
		if("warning".equals(metype)){
			this.type=2;
			return;
		}

	}
	
	/**
	 * 增加前置页面成功提示信息
	 * @param model
	 * @param message
	 * @param allowHide  是否允许自动隐藏
	 */
	public static void success(Model model,String message,int allowHide) {
		model.addAttribute("message",new Msg("success", message,allowHide));
	}
	public static void success(RedirectAttributes model,String message,int allowHide) {
		model.addFlashAttribute("message",new Msg("success", message,allowHide));
	}
	/***
	 * 增加前置页面错误提示信息
	 * @param message <String> 消息内容
	 */
	public static void error(Model model,String message) {
		model.addAttribute("message",new Msg("danger", message)); 
	}
	public static void error(RedirectAttributes model,String message) {
		model.addFlashAttribute("message",new Msg("danger", message));	
	}
	
	/***
	 * 增加前置页面警告提示信息
	 * @param message  <String> 消息内容
	 */
	public static void warn(Model model,String message) {
		model.addAttribute("message",new Msg("warning", message));
	}
	public static void warn(RedirectAttributes model,String message) {
		model.addFlashAttribute("message",new Msg("warning", message));
	}
	
	public static void error(Model model, Exception e) {
		
		error(model, e.getMessage());
		if(!(e instanceof ServiceException))
			Lg.act(e.getMessage(), e);
		
	}
	public static void error(RedirectAttributes model, Exception e) {

		String msg=e.getMessage();
		if(!(e instanceof ServiceException)) {
			msg="操作失败了";
			Lg.act(e.getMessage(), e);
		}
		error(model, msg);
	}
}
