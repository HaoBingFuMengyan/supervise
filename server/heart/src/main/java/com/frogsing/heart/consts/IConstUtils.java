package com.frogsing.heart.consts;

import java.util.Map;

import com.google.common.collect.Maps;

public class IConstUtils {
	public static  Map<Integer,String> map(IConst[] cs){
		 
		 Map<Integer,String> m=Maps.newLinkedHashMap();
		 for(IConst c:cs ){
		  m.put(c.val(), c.label());
		 }
		 return m;
	 }
	
	 public static  Map<String,String> smap(IConst[] cs){
		 Map<String,String> m=Maps.newLinkedHashMap();
		 for(IConst c:cs ){
		  m.put(String.valueOf(c.val()), c.label());
		 }
		 return m;
	}
}

