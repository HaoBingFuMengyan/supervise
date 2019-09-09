/** 
 * Filename B.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class R {

	@SuppressWarnings("rawtypes")
	public static Map<String,String>  show(HttpServletRequest request){
		// 参数Map
        Map properties = request.getParameterMap();
        Iterator entries = properties.entrySet().iterator();
        Map.Entry entry;
        String name = "";
        String value = "";
        Map<String,String> maps=new HashMap<String,String>();
        while (entries.hasNext()) {
            entry = (Map.Entry) entries.next();
            name = (String) entry.getKey();
            
        	 Object valueObj = entry.getValue();
             if(null == valueObj){
                 value = "";
             }else if(valueObj instanceof String[]){
                 String[] values = (String[])valueObj;
                 for(int i=0;i<values.length;i++){
                     value = values[i] + ",";
                 }
                 value = value.substring(0, value.length()-1);
             }else{
                 value = valueObj.toString();
             }
             //System.out.println(name+"="+value);
             maps.put(name, value);
        }
        return maps;
	}
	
	
}
