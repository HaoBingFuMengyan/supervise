/** 
 * Filename LogFactory.java
 * Create on 2012-11-24
 * Copyright 2012 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.log;


/**
 * Description: 通用日志记录工厂,所有的log4j日志及交易市场、仓库、银行的通讯日志都通过此记录
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class FrogLogFactory {
	private FrogLogFactory(){
	}
	
	@SuppressWarnings("rawtypes")
	public static FrogLog getLog(Class clazz){
		return new FrogLog(clazz);
	}
	
	public static FrogLog getLog(String clazzName){
		return new FrogLog(clazzName);
	}	
}
