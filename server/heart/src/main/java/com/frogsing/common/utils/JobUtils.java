package com.frogsing.common.utils;

import com.frogsing.common.iface.IJobService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.json.JsonUtils;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.utils.T;
import org.apache.commons.lang.time.DateUtils;

import javax.frogsing.exception.ServiceException;
import java.util.Date;


public class JobUtils {

	private static IJobService s;
	private static Object o=new Object();
	
	private static IJobService getS(){
		if(s==null){
			synchronized (o) {
				if(s==null)
					s=SpringContextHolder.getBean(IJobService.class);
				if(s==null)
					E.S("IPlanJobService的实现类找不到!");
			}
			
		}
		return s;
	}
	public static void nowJob(Class<?> cls,String jobname,Object json) throws ServiceException{
		String s= JsonUtils.Object2Json(json);
		getS().newjob(1000,cls,true, jobname, DateUtils.addHours(T.now(), -1), s);
	}
	public static void nowJob(Class<?> cls,String jobname,Object json,boolean failstop) throws ServiceException{
		String s= JsonUtils.Object2Json(json);
		getS().newjob(1000,cls,failstop, jobname, T.now(), s);
	}
	public static void nowJobN(Class<?> cls,String jobname,Object json) throws ServiceException{
		getS().newjob(1000,cls,false, jobname, T.now(), JsonUtils.Object2Json(json));
	}
	public static void afterSecondJob(Class<?> cls,String jobname,int second,Object json) throws ServiceException{
		String s= JsonUtils.Object2Json(json);

		getS().newjob(1000,cls,true, jobname, second, s);
	}
	public static void timeJob(Class<?> cls,String jobname,Date time,Object json) throws ServiceException{
		String s= JsonUtils.Object2Json(json);
		getS().newjob(1000,cls,true, jobname, time, s);
	}
	public static void timeJob(Class<?> cls,String jobname,Date time,Object json,boolean failstop) throws ServiceException{
		String s= JsonUtils.Object2Json(json);
		getS().newjob(1000,cls,failstop, jobname, time, s);
	}
	public static void nowJob(int TaskType,String code,String jobname,Date doItTime,Object json) throws ServiceException{
		String s= JsonUtils.Object2Json(json);
		getS().newjob(TaskType, null, true, jobname, doItTime, s);
	}
	
}
