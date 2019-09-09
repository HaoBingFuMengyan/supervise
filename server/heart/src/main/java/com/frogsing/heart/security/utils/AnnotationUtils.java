package com.frogsing.heart.security.utils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider;
import org.springframework.core.type.filter.AnnotationTypeFilter;
import org.springframework.stereotype.Controller;

import javax.persistence.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class AnnotationUtils {

	public static Set<String> getAllRight(String pack){
		Set<String> set=Sets.newHashSet();
		ClassPathScanningCandidateComponentProvider scanner =
				new ClassPathScanningCandidateComponentProvider(false);
				
				scanner.addIncludeFilter(new AnnotationTypeFilter(Controller.class));
				
				for (BeanDefinition bd : scanner.findCandidateComponents(pack)){
				    
					Method[] rs=null;
					try {
						rs = Class.forName(bd.getBeanClassName()).getMethods();
					} catch (SecurityException | ClassNotFoundException e) {
						e.printStackTrace();
					}
					if(rs==null)
						return set;
					for(Method r:rs){
						RequiresPermissions x = r.getAnnotation(RequiresPermissions.class);
						if(x!=null){
							for(String s:x.value()){
								//System.out.println(String.format("%s.%s.%s",bd.getBeanClassName(),r.getName(),s));
								if(!set.contains(s)){
									set.add(s);
								}
							}
						}
					}
				}
				return set;
	}
	public static Map<String,Class<?>> getAllEntity(String pack){
		Map<String,Class<?>> map=Maps.newHashMap();
		ClassPathScanningCandidateComponentProvider scanner =
				new ClassPathScanningCandidateComponentProvider(false);
				
				scanner.addIncludeFilter(new AnnotationTypeFilter(Entity.class));
				
				for (BeanDefinition bd : scanner.findCandidateComponents(pack)){
				    
					try {
						Class<?> cls = Class.forName(bd.getBeanClassName());
						String key=cls.getSimpleName().toLowerCase();
						map.put(key,cls);
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
				}
				return map;
	}
	public static String[] getFetchs(Class<?> cls,boolean ignoreList) {
		List<String> list=Lists.newArrayList();
		Method[] rs = cls.getMethods();
		for(Method r:rs){
			if(r.getAnnotation(ManyToOne.class)!=null){
				list.add(lowerFirst(r.getName().replaceAll("get", "")));
			}
			if(r.getAnnotation(OneToOne.class)!=null){
				list.add(lowerFirst(r.getName().replaceAll("get", "")));
			}
			if(!ignoreList){
				if(r.getAnnotation(OneToMany.class)!=null){
					list.add(lowerFirst(r.getName().replaceAll("get", "")));
				}
				if(r.getAnnotation(ManyToMany.class)!=null){
					list.add(lowerFirst(r.getName().replaceAll("get", "")));
				}
			}
		}
		
		return list.toArray(new String[list.size()]);
	}
	public static String upperFirst(String name) {
        name = name.substring(0, 1).toUpperCase() + name.substring(1);
       return  name;
      
    }
	public static String lowerFirst(String name) {
        name = name.substring(0, 1).toLowerCase() + name.substring(1);
       return  name;
      
    }

    public static  void fetchAll(Object obj,boolean ignoreList) {

		if(obj==null)
			return;
		try {
			Method[] rs = obj.getClass().getMethods();
			for(Method r:rs){
                if(r.getAnnotation(ManyToOne.class)!=null){

                    Hibernate.initialize(r.invoke(obj));
                }
                if(r.getAnnotation(OneToOne.class)!=null){
                    Hibernate.initialize(r.invoke(obj));			}
                if(!ignoreList){
                    if(r.getAnnotation(OneToMany.class)!=null){
                        Hibernate.initialize(r.invoke(obj));				}
                    if(r.getAnnotation(ManyToMany.class)!=null){
                        Hibernate.initialize(r.invoke(obj));
                    }
                }
            }
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
