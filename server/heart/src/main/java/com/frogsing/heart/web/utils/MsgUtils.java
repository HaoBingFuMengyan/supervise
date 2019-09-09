package com.frogsing.heart.web.utils;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.security.utils.MD5;
import com.frogsing.heart.spring.SpringContextHolder;

public class MsgUtils {


	/**
	 * 兼容性函數,不可再調用
	 * @param msg
	 * @param para
	 * @return
	 */
	public static String pastMsg(String msg, String... para) {
		
		return msg;
	}
	/**
	 * 根据msg的md5值去数据库找对应的值
	 * @param msg
	 * @param para
	 * @return
	 */
	public static String getMsg(String msg, String... para) {
		return msg;
		
	}
	

}
