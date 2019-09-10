<%--
  Created by IntelliJ IDEA.
  User: wesson
  Date: 2017/9/26
  Time: 下午2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://www.frogsing.com/tags/shiro" %>
<%@ taglib prefix="mw" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cs" uri="http://www.frogsing.com/tags/parameter" %>
<link href="${ctx}/css/page.css" type="text/css" rel="stylesheet">
<div class="layout-top">
    <!-----------------------------------------顶部-------------->
    <header id="header">
        <div class="header-box">
            <ul class="header-left">
                <shiro:notAuthenticated>
                    <li class="denglu"><a href="${ctx}/index.html" class="right10">煤亮子商城</a><a href="${ctx}/login.html">您好，请登录</a> <a href="${ctx}/register.html"  class="red">免费注册</a></li>
                </shiro:notAuthenticated>
                <shiro:authenticated>
                     <li class="denglu"><a href="${ctx}/index.html" class="right10">煤亮子商城</a>您好，<a href="${ctx}/index.shtml" class="red"><shiro:principal property="memberName"/> <c:set var="user" value="${mw:user()}"/>
                             ${ (empty mw:user().name)?mw:user().loginName: mw:user().name}
                         </font></a><a href="${ctx}/logout.html">,退出</a>
                </shiro:authenticated>
            </ul>

        </div>
    </header>


    <div class="clear"></div>
    <!--轮播图上方导航栏  一栏-->
    <div id="navv">
        <div class="nav-img" style="background:url(${ctx}/images/page/568a1258N2edec1ab.jpg) repeat-x"></div>
    </div>

</div>

