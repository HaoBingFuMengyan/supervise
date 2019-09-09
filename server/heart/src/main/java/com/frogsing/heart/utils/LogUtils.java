package com.frogsing.heart.utils;

import com.frogsing.heart.service.ILogService;

import javax.frogsing.exception.ServiceException;


public class LogUtils {
	private static ILogService s;
	public static void log(String info) throws ServiceException {
		if(s==null){
//			synchronized (s) {
////				s=SpringContextHolder.getBean(ILogService.class);
////				if(s==null)
////					E.S("ILogService的实现类找不到!");
//			}
			
		}
		s.log(info);
	}
	
	
}
