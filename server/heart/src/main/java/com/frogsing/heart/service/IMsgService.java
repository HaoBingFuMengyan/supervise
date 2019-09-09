/** 
 * Filename IParameterService.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.service;


/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public interface IMsgService {

	String getMsg(String src);
	void newMsg(String scode, String src);


}
