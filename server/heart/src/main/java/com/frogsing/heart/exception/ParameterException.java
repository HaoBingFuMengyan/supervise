/** 
 * Filename ParameterException.java
 * Create on 2014-9-1
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.exception;

import com.frogsing.common.utils.MsgUtils;

import javax.frogsing.exception.ServiceException;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class ParameterException extends ServiceException {
	
	private static final long serialVersionUID = 3583566093089790852L;

	public ParameterException() {
		super();
	}

	public ParameterException(String message) {
		super(MsgUtils.getMsg(message));
	}

	public ParameterException(Throwable cause) {
		super(cause);
	}

	public ParameterException(String message, Throwable cause) {
		super(message, cause);
	}

}
