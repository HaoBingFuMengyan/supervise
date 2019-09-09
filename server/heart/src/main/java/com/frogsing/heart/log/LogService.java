/** 
 * 
 * create on 2011-1-24
 * Copyright 2011-2020 鸣蛙软件 All Rights Reserved.
 */
package com.frogsing.heart.log;

import java.util.HashMap;
import java.util.Map;

import com.frogsing.heart.utils.StringHelper;

/**
 * 日志服务类
 * 
 * @author sandy
 * 
 */
public class LogService {

	/**
	 * 发送接口类型的日志
	 * 
	 * @param params
	 */
	public static void sendInterfaceMsg(Map<String, String> params) {
		try {
			if (params == null & params.isEmpty())
				return;
			Map<String, String> logcc = new HashMap<String, String>();
			logcc.put("LOG_TYPE", "INTERFACE");
			logcc.put("LOG_TIME", StringHelper.getStringOfTodayDatetime());
			logcc.putAll(params);

//			ThreadUtils.execute(new Thread(new SendMsgThread(logcc, 1)));
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
//			log.warn("接口信息发送失败！");
		}
	}

	/**
	 * 发送系统日志的日志
	 * 
	 * @param params
	 */
	public static void sendSystemLog(Map<String, String> params) {
		try {
			if (params == null & params.isEmpty())
				return;
			Map<String, String> logcc = new HashMap<String, String>();
			logcc.put("LOG_TYPE", "SYSTEMLOG");
			logcc.put("LOG_TIME", StringHelper.getStringOfTodayDatetime());
			logcc.putAll(params);

			//ThreadUtils.execute(new Thread(new SendMsgThread(logcc, 1)));
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
//			log.warn("接口信息发送失败！");
		}
	}
}
