/** 
 * ObjectUtils.java
 * create on 2011-01-01
 * Copyright 2015 Frongsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.frogsing.heart.log.Lg;
import org.apache.commons.beanutils.MethodUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

/**
 * Bean相关操作处理工具类
 * 
 * @since version1.0
 */
@SuppressWarnings("rawtypes")
public class ObjectUtils {

	public static void copyObjValue(Object src, Object dest) {

			BeanUtils.copyProperties(src, dest);
	}

	public static void copyObjValue(Object src, Object dest,  boolean ignoreNull,String ...ignores) {
		Set<String> sets=new HashSet<String>();
		for(String s:ignores){
			sets.add(s);
		}
		if(ignoreNull){
			sets.addAll(getNullPropertyNames(src));
		}
		if(sets.size()>0)
			BeanUtils.copyProperties(src, dest, sets.toArray(new String[sets.size()]));
		else
			BeanUtils.copyProperties(src, dest);
	}
	/**
	 * @author 郑明亮
	 * @Email zhengmingliang911@gmail.com
	 * @Time 2017年2月14日 下午5:14:25
	 * @Description <p>获取到对象中属性为null的属性名  </P>
	 * @param source 要拷贝的对象
	 * @return
	 */
	public static Set<String> getNullPropertyNames(Object source) {
		final BeanWrapper src = new BeanWrapperImpl(source);
		java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();

		Set<String> emptyNames = new HashSet<String>();
		for (java.beans.PropertyDescriptor pd : pds) {
			Object srcValue = src.getPropertyValue(pd.getName());
			if (srcValue == null)
				emptyNames.add(pd.getName());
		}
		return emptyNames;
	}

	/**
	 * @author 郑明亮
	 * @Email zhengmingliang911@gmail.com
	 * @Time 2017年2月14日 下午5:15:30
	 * @Description <p> 拷贝非空对象属性值 </P>
	 * @param source 源对象
	 * @param target 目标对象
	 */
	public static void copyPropertiesIgnoreNull(Object source, Object target) {
		Set<String> sets = getNullPropertyNames(source);
		BeanUtils.copyProperties(source, target, sets.toArray(new String[sets.size()]));
	}

    public static <T> T clone(Object src) {
		if(src==null)
			return null;
		try {
			T t=(T)src.getClass().newInstance();
			BeanUtils.copyProperties(src, t);
			return t;
		}
		catch (Exception ex){

			Lg.act(ex);
			return null;
		}


    }
}
