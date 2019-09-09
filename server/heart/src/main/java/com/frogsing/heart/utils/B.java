/** 
 * Filename B.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.exception.E;

import java.util.List;

/**
 * Description:
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class B {



	public static void assertIdNotNUll(BaseEntity  obj){
		if(B.Y(obj.getId())){
			E.S("id不能为空");
		}
	}
	public static void assertNotNUll(Object  obj,Object ...paras){

		if(obj instanceof  String){
			if(B.Y((String)obj)){
				throwMsg(paras);

			}

		}
		else
		{
			if(obj==null)
				throwMsg(paras);
		}
	}

	private static void throwMsg(Object[] paras) {
		if(paras.length==0)
			E.S("不能为空");
		else
		if(paras.length==1)
		{
			E.S("%s不能为空",paras);
		}else{
			Object[] rs = new Object[paras.length - 1];
			for (int i=1;i<paras.length;i++) {
				rs[i-1]=paras[i];
			}
			E.S(paras[0].toString(),rs);
		}
	}


	public static boolean Y(String obj) {
		return org.apache.commons.lang3.StringUtils.isBlank(obj);
	}

	public static boolean N(String obj) {
		return org.apache.commons.lang3.StringUtils.isNotBlank(obj);
	}

	public static boolean Y(String[] list) {
		if (null == list || list.length == 0) {
			return true;
		}
		return false;
	}

	public static boolean N(String[] list) {
		if (null == list || list.length == 0) {
			return false;
		}
		return true;
	}

	@SuppressWarnings("rawtypes")
	public static boolean Y(List list) {
		if (null == list || list.size() == 0) {
			return true;
		}
		return false;
	}

	@SuppressWarnings("rawtypes")
	public static boolean N(List list) {
		if (null == list || list.size() == 0) {
			return false;
		}
		return true;
	}

	/**
	 * 判断数组是否包含字符串
	 * 
	 * @param array
	 * @param value
	 * @return
	 */
	public static boolean contains(String[] array, String value) {
		if (array == null || array.length == 0) {
			return false;
		}
		for (String str : array) {
			if (str.equals(value)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 比较两个字符串是否相等,其中一个为null暂时认为不相等
	 * 
	 * @param a
	 * @param b
	 * @return
	 */
	public static boolean equals(String a, String b) {
		if (B.Y(a) || B.Y(b)) {
			return false;
		}
		return a.equals(b);
	}
}
