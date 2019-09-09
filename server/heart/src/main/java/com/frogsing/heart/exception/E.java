/** 
 * Filename E.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.exception;

import java.util.Map;


/**
 * Description:
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class E {

	public static void S(String obj ,Object ...para) {
		if(obj.length()>0){
			obj=String.format(obj,para);
		}
		throw new javax.frogsing.exception.ServiceException(obj);
	}
	public static void CS(String code, String obj ,Object ...para) {
		if(obj.length()>0){
			obj=String.format(obj,para);
		}
		throw new javax.frogsing.exception.ServiceException(code,obj);
	}
	
	public static void MapS(Map<String,String> obj,String msg) {
		throw new javax.frogsing.exception.ServiceException(obj,msg);
	}
	
	public static void PS(String obj) {
		throw new ParameterException(obj);
	}
	
	public static void DS(String obj) {
		throw new DaoException(obj);
	}
	public static void REDIRECT(String obj,String url){
		throw new RedirectException(url);
	}
	

	/**
	 * 获取exception详情信息
	 * 
	 * @param e
	 *            Excetipn type
	 * @return String type
	 */
	public static String getDetail(Exception e) {
		StringBuffer msg = new StringBuffer("null");
		if (e != null) {
			msg = new StringBuffer("");
			String message = e.toString();
			int length = e.getStackTrace().length;
			if (length > 0) {
				msg.append(message + "\n");
				for (int i = 0; i < length; i++) {
					msg.append("\t" + e.getStackTrace()[i] + "\n");
				}
			} else {
				msg.append(message);
			}
		}
		return msg.toString();
	}
	public static void  Box(String obj){
		throw new javax.frogsing.exception.ServiceException(obj);
	}

}
