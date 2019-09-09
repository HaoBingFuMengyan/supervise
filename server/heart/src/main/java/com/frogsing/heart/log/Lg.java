/** 
 * Filename LogFactory.java
 * Create on 2012-11-24
 * Copyright 2012 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.log;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.frogsing.heart.utils.T;

/**
 * Description: 通用日志记录工厂,所有的log4j日志及交易市场、仓库、银行的通讯日志都通过此记录
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class Lg {

	private static  Logger act  = LoggerFactory.getLogger("com.frogsing.act");
	private static  Logger error  = LoggerFactory.getLogger("com.frogsing.error");
	private static  Logger ck  = LoggerFactory.getLogger("com.frogsing.ck");

	private static  Logger bank  = LoggerFactory.getLogger("com.frogsing.bank");
	private static Logger pingan = LoggerFactory.getLogger("com.frogsing.pingan");
	private static  Logger db  = LoggerFactory.getLogger("com.frogsing.db");
	private static  Logger sms  = LoggerFactory.getLogger("com.frogsing.sms");
	private static  Logger frame  = LoggerFactory.getLogger("com.frogsing.frame");
	private static  Logger iflog  = LoggerFactory.getLogger("com.frogsing.interface");
	
	public static void error(String info ,Throwable... e) {
		error.error("=======================Framework Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			error.error(info,e[0]);
		else
			error.error(info);
		error.error("=======================Framework Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
	}
	
	public static void frame(String info ,Throwable... e) {
		frame.info("=======================Framework Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			frame.info(info,e[0]);
		else
			frame.info(info);
		frame.info("=======================Framework Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
	}
	public static void sms(String info ,Throwable... e) {
		sms.info("=======================Msg Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			sms.info(info,e[0]);
		else
			sms.info(info);
		sms.info("=======================Msg Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
	}
	/**
	 * 记录瘫痪型日志
	 * 
	 * @param info
	 * @param obj
	 */
	static public void act(String info, Throwable... e) {
		act.info("=======================Action Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			act.info(info,e[0]);
		else
			act.info(info);
		act.info("=======================Action Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		// sendSystemLog("","","",1,2,"","","",info);
	}
	static public void act(Throwable e) {
		act.info("=======================Action Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		
		act.info(e.getMessage(),e);
		
		act.info("=======================Action Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		// sendSystemLog("","","",1,2,"","","",info);
	}
	static public void bank(String info, Throwable... e) {
		bank.info("=======================Bank Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			bank.info(info,e[0]);
		else
			bank.info(info);
		bank.info("=======================Bank Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		// sendSystemLog("","","",1,2,"","","",info);
	}

	static public void pingan(String info, Throwable... e) {
		pingan.info("=======================Pingan Log Begin Time:" + T.snow("yyyy-MM-dd HH:mm:ss")
				+ "====================================");
		if (e.length > 0)
			pingan.info(info, e[0]);
		else
			pingan.info(info);
		pingan.info("=======================Pingan Log End Time:" + T.snow("yyyy-MM-dd HH:mm:ss")
				+ "====================================");
	}
	
	static public void db(String info, Throwable... e) {
		db.info("=======================Database Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			db.info(info,e[0]);
		else
			db.info(info);
		db.info("=======================Database Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		// sendSystemLog("","","",1,2,"","","",info);
	}
	static public void ck(String info, Throwable... e) {
		ck.info("=======================Database Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			ck.info(info,e[0]);
		else
			ck.info(info);
		ck.info("=======================Database Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		// sendSystemLog("","","",1,2,"","","",info);
	}
	/**
	 * 记录接口类型日志
	 * @param info
	 * @param e
	 */
	static public void iface(String info, Throwable... e) {
		iflog.info("=======================Interface Log Begin Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		if(e.length>0)
			iflog.info(info,e[0]);
		else
			iflog.info(info);
		iflog.info("=======================Interface Log End Time:"+T.snow("yyyy-MM-dd HH:mm:ss")+"====================================");
		// sendSystemLog("","","",1,2,"","","",info);
	}
	/**
	 * 记录接口请求/响应日志
	 * 
	 * @param interfaceType
	 *            接口类型：Constants.MARKET Constants.WAREHOUSE Constants.BANK
	 * @param systemCode
	 *            系统代码：交易市场代码、或仓库代码、银行代码
	 * @param tradeCode
	 *            交易码
	 * @param serialNo
	 *            流水号
	 * @param serialTime
	 *            流水时间
	 * @param operatorType
	 *            操作类型：MessageType.REQUEST 请求 MessageType.RESPONSE 响应
	 * @param singature
	 *            签名信息
	 * @param info
	 *            消息内容
	 */
	static public void interfacelog(int interfaceType, String systemCode,
			String tradeCode, String serialNo, String serialTime,
			int operatorType, String ip, String singature, String info) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("InterfaceType", String.valueOf(interfaceType));
			map.put("SystemCode", systemCode);
			map.put("TradeCode", tradeCode);
			map.put("SerialNo", serialNo);
			map.put("SerialTime", serialTime);
			map.put("IP", ip);
			map.put("OperatorType", String.valueOf(operatorType));
			map.put("Singature", singature);
			map.put("Info", info);

			LogService.sendInterfaceMsg(map);
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
			act.error("记录接口请求日志出错", e);
		}
	}

	/**
	 * 根据传入的内容组装系统日志到Map中。
	 * 
	 * @param slogno
	 * @param memberId
	 * @param userName
	 * @param logType
	 * @param logLevel
	 * @param url
	 * @param ip
	 * @param operatorName
	 * @param logInfo
	 * @return
	 */
	static private void sendSystemLog(String slogno, String memberId, String userName,
			int logType, int logLevel, String url, String ip,
			String operatorName, String logInfo) {

		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("ilogtype", String.valueOf(logType));
			map.put("iloglevel", String.valueOf(logLevel));
			map.put("sloginfo", logInfo);
			map.put("slogno", slogno);
			map.put("smemberid", memberId);
			map.put("slogusername", userName);
			map.put("surl", url);
			map.put("soperateip", ip);
			map.put("soperatename", operatorName);

			LogService.sendSystemLog(map);
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
			act.error("记录接口请求日志出错", e);
		}
	}


}
