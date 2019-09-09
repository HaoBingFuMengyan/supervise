package com.frogsing.heart.jpa;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Path;
import java.util.function.Consumer;

/**
 * Created by fanyijie on 2018/1/18.
 * mysql5.7 json数据查询函数 获取值
 */
public class J {

//    public static Expression<String> getString(CriteriaBuilder cb, Path<String> path, String dot) {
//        return  J.v(cb,String.class,path,dot);
//    }
//    public static Expression<Integer>  getInt(CriteriaBuilder cb, Path<String> path, String dot) {
//        return  J.v(cb,Integer.class,path,dot);
//    }
//    public static Expression<Long> getLong(CriteriaBuilder cb, Path<String> path, String dot) {
//        return  J.v(cb,Long.class,path,dot);
//    }
//    public static Expression<Double> getDouble(CriteriaBuilder cb, Path<String> path, String dot) {
//        return  J.v(cb,Double.class,path,dot);
//    }
    public static <T> Expression<T> v(Class<T> t,CriteriaBuilder cb,  Path<String> path, String dot) {
        return cb.function("json_extract", t, path, cb.literal(dot));
    }



    public static  <T> T build(Class<T> cls,Consumer<? super T> action) {

        T t = null;
        try {
            t = cls.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        action.accept(t);
       return t;
    }
}
