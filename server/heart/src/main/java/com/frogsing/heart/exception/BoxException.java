package com.frogsing.heart.exception;

import com.frogsing.heart.web.utils.MsgUtils;

import javax.frogsing.exception.ServiceException;

/**
 * Service层公用的Exception.
 * 
 * 继承自RuntimeException, 从由Spring管理事务的函数中抛出时会触发事务回滚.
 * 
 * @frogsing van
 */
public class BoxException extends ServiceException {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3823328126306396914L;

	public BoxException() {
		super();
	}

	public BoxException(String message) {
		super(MsgUtils.getMsg(message));
	}

	public BoxException(Throwable cause) {
		super(cause);
	}

	public BoxException(String message, Throwable cause) {
		super(message, cause);
	}
}
