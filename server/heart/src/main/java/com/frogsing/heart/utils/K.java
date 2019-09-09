/**
 * 
 */
package com.frogsing.heart.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * @author wesson
 *
 */
public class K {
	
	private static Map<String, Object> map = new HashMap<String, Object>();
	private static Object o=new Object();
	private static final String split="___key___";
	
	
	public static Object gHour(String key){
		return getObject(hour(key));
	}
	
	public static Object getObject(String key){
		if(map.containsKey(key))
			return map.get(key);
		else
			return null;
	}
	
	public static Object gDay(String key,Object obj){
		return getObject(day(key));
	}
	
	public static Object gMonth(String key,Object obj){
		return getObject(month(key));
	}
	
	public static void pHour(String key,Object obj){
		remove(key);
		map.put(hour(key), obj);
	}
	
	public static void pDay(String key,Object obj){
		remove(key);
		map.put(day(key), obj);
	}
	
	public static void pMonth(String key,Object obj){
		remove(key);
		map.put(month(key), obj);
	}
	
	private static void remove(String key) {
		for(Entry<String,Object> entry:map.entrySet()){
			if(entry.getKey().endsWith(split+key))
				map.remove(entry);
		}
	}
	
	public static String hour(String key) {
		return T.snow("yyyyMMddHH") + split + key;
	}

	public static String day(String key){
		return T.snow("yyyyMMdd") + split + key;
	}
	
	public static String month(String key){
		return T.snow("yyyyMM") + split + key;
	}
	
	public static void clearcache(){
		synchronized (o) {
			map.clear();
		}
	}
}
