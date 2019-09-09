/** 
 * Filename B.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Predicate;

import org.springframework.ui.Model;

import com.google.common.collect.Lists;


/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class S {
	
	public static String Asc(String obj) {
		return "asc_" + obj;
	}

	public static String Desc(String obj) {
		return "desc_" + obj;
	}
	public static String redirect(String url) {
		return "redirect:"+url;
	}
	
	public static String eq(String s) {
		return "search_eq_"+s;
	}

	public static void defaultEq(Map<String, Object> searchParams, Model model, String name, Object val) {
		String k=eq(name);
		Object v=searchParams.get(k);
		if(v==null||v.toString().isEmpty()){
			searchParams.put(k,val);
			model.addAttribute(k,val);
		}
		
	}

	public static Double[] toABC(String str) {
		// String str = "love23next234csdn3423javaeye";
		str = str.trim();
		String temp = "";
		List<String> list = Lists.newArrayList();

		if (str != null) {
			for (int i = 0; i < str.length(); i++) {

				char c = str.charAt(i);
				if ((c >= 48 && c <= 57) || c == '.') {
					temp += str.charAt(i);
				} else {
					if (B.N(temp)) {
						list.add(temp);
						temp = "";
					}
				}
			}
			if (B.N(temp)) {
				list.add(temp);
			}
		}
		Double[] rs = new Double[3];
		for (int i = 0; (i < list.size() && i < 3); i++) {
			rs[i] = Double.parseDouble(list.get(i));
		}
		return rs;
	}

	public static Predicate andList(CriteriaBuilder cb,List<Predicate> list) {
		return cb.and(list.toArray(new Predicate[list.size()]));
	}

	public static String like(String likename) {
		return "%"+likename+"%";
	}
	
}
