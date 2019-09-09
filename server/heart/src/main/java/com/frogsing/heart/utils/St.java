/** 
 * Filename B.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;

import com.google.common.collect.Lists;


/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class St {
	
	private static Sort sort(Direction d,String ...obj) {
		
		List<Order> list=Lists.newArrayList();
		for(String o:obj){
			list.add(new Order(d, o));
		}
		return new Sort(list);

	}

	public static Sort Desc(String ... obj) {
		
		return sort(Direction.DESC,obj);

	}
	public static Sort Asc(String ... obj) {
		
		return sort(Direction.ASC,obj);

	}
	
}
