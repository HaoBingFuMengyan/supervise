<%@ page contentType="text/html;charset=UTF-8" isErrorPage="false" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://www.frogsing.com/tags/shiro" %>
{"success":false,"code":1,<shiro:authenticated>"islogin":1,"msg":"您没有权限哦"</shiro:authenticated><shiro:notAuthenticated>"islogin":0,"msg":"请重新登录"</shiro:notAuthenticated>}