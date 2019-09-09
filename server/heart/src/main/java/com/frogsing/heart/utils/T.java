/** 
 * Filename B.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import com.frogsing.heart.spring.Props;

import java.util.Calendar;
import java.util.Date;

/**
 * Description:
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class T {

	public static Date now() {
		return DateUtils.getCurrentDateTime();
	}


	public static Date today() {
		return DateUtils.getToday();
	}
	
	public static Date todaybegin(){
		return DateUtils.getDate(T.today());
	}
	
	public static Date todayend(){
		return DateUtils.getDayEnd(T.today());
	}
	
	public static Date dateofbegin(Date date){
		return DateUtils.getDate(date);
	}
	
	public static Date dateofend(Date date){
		return DateUtils.getDayEnd(date);
	}

	public static String fdate(Date d,String format){
		return DateUtils.dateToString(d, format);
	}

	public static String snow(String format) {
		return DateUtils.dateToString(DateUtils.getCurrentDateTime(), format);
	}

	public static String toDatetime(Date d) {
		return DateUtils.dateToString(d,
				"yyyy-MM-dd HH:mm:ss");
	}
	public static String toDate(Date d) {
		return DateUtils.dateToString(d,
				"yyyy-MM-dd");
	}
	public static String toS(Date d) {
		return DateUtils.dateToString(DateUtils.getCurrentDateTime(),
				"yyyyMMddHHmmss");
	}
	public static String snow() {

		return snow("yyyy-MM-dd HH:mm:ss");
	}

	public static boolean isDebug() {
		return "true".equals(Props.get("debug"));
	}

	public static Date Date() {
		return DateUtils.getToday();
	}

	public static int dayOfMonth(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 把日期修改为 day日
	 * 
	 * @param date
	 * @param day
	 * @return
	 */
	public static Date toDayOfMonth(Date date, int day) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);

		int year = c.get(Calendar.YEAR);
		int mon = c.get(Calendar.MONTH);

		c.set(year, mon, day);

		return c.getTime();
	}



	public static int subMonth(Date b, Date a) {
		Calendar c = Calendar.getInstance();
		c.setTime(b);

		int yearb = c.get(Calendar.YEAR);
		int monb = c.get(Calendar.MONTH);
		c.setTime(a);
		int yeara = c.get(Calendar.YEAR);
		int mona = c.get(Calendar.MONTH);
		int year=yearb-yearb;
		int mon=monb-mona;
		return year*12+mon;


	}
}
