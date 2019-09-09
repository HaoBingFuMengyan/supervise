/**
 * Filename JsonUtils.java
 * Create on 2014年8月14日
 * Copyright 2014 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.json;

import java.lang.reflect.Type;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.vo.FrogVo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Description:json 接口json工具类
 * 
 * @author <a href="mailto:zhanghaifeng@frogsing.com">chain </a>
 * @since version1.0
 */
public class JsonUtils {
	public static Gson gson = null;
    static {
        gson = new GsonBuilder().registerTypeAdapter(String.class,new NullToEmptyStringAdapter()).setDateFormat("yyyy-MM-dd HH:mm:ss").create();
    }
	
	public static <T> T json2bean(String json, Class<T> clazz)
			throws InstantiationException, IllegalAccessException {
		if (B.Y(json)) {
			return clazz.newInstance();
		}
		T obj = null;
		try {
			obj = (T) net.sf.json.JSONObject.toBean(
					net.sf.json.JSONObject.fromObject(json), clazz);
		} catch (Exception e) {
			E.S("json格式错误");
		}
		return obj;
	}
	
	public static <T> T json2Object(String json,Class<T> clazz){
		return gson.fromJson(json, clazz);
	}
	
	public static <T> T json2Object(String json,Type type){
		return gson.fromJson(json, type);
	}

	public static String Object2Json(Object obj){
		return gson.toJson(obj);
	}


}
