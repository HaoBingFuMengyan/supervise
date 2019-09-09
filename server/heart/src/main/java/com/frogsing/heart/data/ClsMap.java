package com.frogsing.heart.data;

import java.util.Map;

import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.security.utils.AnnotationUtils;

public class ClsMap {
	
	private  static Map<String,Class<?>> map;
	static{
		
		map=AnnotationUtils.getAllEntity("com.frogsing");
		/*for (Map.Entry<String,Class<?>> entry : map.entrySet()) {
			System.out.println(entry.getKey()+"//"+entry.getValue());
		}*/
		
	}
	@SuppressWarnings("unchecked")
	public static  Class<? extends BaseEntity> getEntityClass(String key){
		return (Class<? extends BaseEntity>)map.get(key);
	}
}
