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

/**
 * Description: 通用日志记录工厂,所有的log4j日志及交易市场、仓库、银行的通讯日志都通过此记录
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class FrogLog {

	private Logger log = null;

	@SuppressWarnings("unused")
	private FrogLog() {
	}

	@SuppressWarnings("rawtypes")
	public FrogLog(Class clazz) {
		log = LoggerFactory.getLogger(clazz);
	}

	public FrogLog(String clazzName) {
		log = LoggerFactory.getLogger(clazzName);
	}

	/**
	 * 记录普通型日志
	 * 
	 * @param info
	 */
	public void info(String... info) {
		for (String msg : info)
			log.info(msg);
	}

	/**
	 * 记录普通型日志
	 * 
	 * @param info
	 * @param obj
	 */
	public void info(String info, Throwable e) {
		log.info(info, e);
	}

	/**
	 * 记录业务型日志
	 * 
	 * @param info
	 */
	public void biz(String... info) {
		StringBuffer infos = new StringBuffer();
		for (String msg : info)
			infos.append(msg);
		log.info(infos.toString());
		// sendSystemLog("","","",LogType.BUSINESS,LogLevel.INFO,"","","",infos.toString());
	}

	/**
	 * 记录业务型日志
	 * 
	 * @param memberId
	 *            企业名
	 * @param operatorId
	 *            操作员
	 * @param operatorName
	 *            用户名
	 * @param info
	 *            消息
	 */
	public void biz(int memberType, String memberId, String operatorId,
			String operatorName, String... info) {
		StringBuffer infos = new StringBuffer();
		for (String msg : info)
			infos.append(msg);
		log.info(infos.toString());
		// sendSystemLog("",memberId,operatorName,LogType.BUSINESS,LogLevel.INFO,"","","",infos.toString());
	}

	/**
	 * 记录业务型日志
	 * 
	 * @param info
	 */
	public void biz(String info, Throwable e) {
		log.info(info, e);
		// sendSystemLog("","","",3,LogLevel.INFO,"","","",info);
	}

	/**
	 * 记录警告型日志
	 * 
	 * @param info
	 */
	public void warning(String... info) {
		StringBuffer infos = new StringBuffer();
		for (String msg : info)
			infos.append(msg);
		log.warn(infos.toString());
		// sendSystemLog("","","",1,LogLevel.WARNING,"","","",infos.toString());
	}

	/**
	 * 记录警告型日志
	 * 
	 * @param info
	 * @param obj
	 */
	public void warning(String info, Throwable e) {
		log.warn(info, e);
		// sendSystemLog("","","",1,LogLevel.WARNING,"","","",info);
	}

	/**
	 * 记录调试型日志
	 * 
	 * @param info
	 */
	public void debug(String... info) {
		for (String msg : info)
			log.debug(msg);
	}

	/**
	 * 记录调试型日志
	 * 
	 * @param info
	 * @param obj
	 */
	public void debug(String info, Throwable e) {
		log.debug(info, e);
	}

	/**
	 * 记录严重型日志
	 * 
	 * @param info
	 */
	public void cruel(String... info) {
		for (String msg : info)
			log.error(msg);
	}

	/**
	 * 记录严重型日志
	 * 
	 * @param info
	 * @param obj
	 */
	public void cruel(String info, Throwable e) {
		log.error(info, e);
		// sendSystemLog("","","",1,2,"","","",info);
	}

	/**
	 * 记录错误型日志
	 * 
	 * @param info
	 */
	public void error(String... info) {
		StringBuffer infos = new StringBuffer();
		for (String msg : info)
			infos.append(msg);
		log.error(infos.toString());
		sendSystemLog("", "", "", 1, 2, "", "", "", infos.toString());
	}

	/**
	 * 记录错误型日志
	 * 
	 * @param info
	 * @param obj
	 */
	public void error(String info, Throwable e) {
		log.error(info, e);
		// sendSystemLog("","","",1,2,"","","",info);
	}

	/**
	 * 记录瘫痪型日志
	 * 
	 * @param info
	 */
	public void dead(String... info) {
		StringBuffer infos = new StringBuffer();
		for (String msg : info)
			infos.append(msg);
		log.error(infos.toString());
		sendSystemLog("", "", "", 1, 2, "", "", "", infos.toString());
	}

	/**
	 * 记录瘫痪型日志
	 * 
	 * @param info
	 * @param obj
	 */
	public void dead(String info, Throwable e) {
		log.error(info);
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
	public void interfacelog(int interfaceType, String systemCode,
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
			log.error("记录接口请求日志出错", e);
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
	private void sendSystemLog(String slogno, String memberId, String userName,
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
			log.error("记录接口请求日志出错", e);
		}
	}

}
