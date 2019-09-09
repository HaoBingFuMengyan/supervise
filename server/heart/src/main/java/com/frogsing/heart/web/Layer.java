package com.frogsing.heart.web;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

public class Layer {

	public static String close() {

		return "/layer/close";
	}
	public static String success(Model model, String msg) {
		model.addAttribute("reload",true);
		Msg.success(model,msg,1);
		return "/layer/close";
	}
	public static String error(Model model, String msg) {
		model.addAttribute("reload",true);
		Msg.error(model,msg);
		return "/layer/close";
	}
	public static String success(Model model, String msg,boolean reload) {
		model.addAttribute("reload",reload);
		Msg.success(model,msg,1);
		return "/layer/close";
	}
	public static String error(Model model, String msg,boolean reload) {
		model.addAttribute("reload",reload);
		Msg.error(model,msg);
		return "/layer/close";
	}
	public static String redirect(RedirectAttributesModelMap model, String msg, String url, Integer type, HttpServletRequest request) {
		if(type==0)
			Msg.success(model,msg,1);
		else
			Msg.error(model,msg);
		String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
		model.addAttribute("url",ctx+url);
		return "/layer/redirect";
	}

	public static String redirectSelf(RedirectAttributesModelMap model, String msg,Integer type) {
		if(type==0)
			Msg.success(model,msg,1);
		else
			Msg.error(model,msg);
		return "/layer/redirectSelf";
	}
	
}
