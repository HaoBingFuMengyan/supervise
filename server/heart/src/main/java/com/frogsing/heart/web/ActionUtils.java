package com.frogsing.heart.web;

import org.apache.shiro.SecurityUtils;

import javax.servlet.ServletRequest;

/**
 * Created by fanyijie on 2017/11/8.
 */
public class ActionUtils {
    public static String dir(Class<?> cls, String page) {
        return String.format("/%s/%s-%s", cls.getName().split("\\.")[2], cls.getSimpleName().toLowerCase(), page);
    }
    public static void checkPermissionQuery(ServletRequest request, String obj) {
        SecurityUtils.getSubject().checkPermission(
                obj.toLowerCase() + ":" + "query");
    }
}
