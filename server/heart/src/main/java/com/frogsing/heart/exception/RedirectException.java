package com.frogsing.heart.exception;

import javax.frogsing.exception.ServiceException;

/**
 * service层需要跳转公用的Exception.
 * 
 * 继承自RuntimeException, 从由Spring管理事务的函数中抛出时会触发事务回滚.
 * 
 * @frogsing van
 */
public class RedirectException extends ServiceException {

	private static final long serialVersionUID = 3583566093089790852L;
	
	public RedirectException() {
		super();
	}

	public RedirectException(String message) {
		super(message);
	}

	public RedirectException(Throwable cause) {
		super(cause);
	}

	public RedirectException(String message, Throwable cause) {
		super(message, cause);
	}
	
	
}
