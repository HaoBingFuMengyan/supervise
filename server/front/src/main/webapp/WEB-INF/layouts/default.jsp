<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="format-detection" content="telephone=no" />
    <title><sitemesh:title/></title>
	<link type="image/x-icon" href="${ctx}/title/favicon.png" rel="shortcut icon">
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/font/iconfont.css"/>
    <script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="${ctx}/static/common/common.js" type="text/javascript"></script>
     <!-- 校验js -->
    <script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js" charset="UTF-8" ></script>
	<link href="${ctx}/js/jquery-validation-1.17.0/demo/css/cmxform.css" rel="stylesheet" type="text/css">

    <!--屏蔽鼠标右键 -->
    <%
        if(!(request.getServerName().contains("localhost"))){
            out.print("<script type='text/javascript' src='"+request.getContextPath()+"/js/disableMouse.js'></script>");
        }
    %>

    <!-- 引入layer插件 -->
    <script src="${ctxStatic}/layer-v3.1.0/layer/layer.js"></script>
    <script src="${ctxStatic}/layDate-v5.0.8/laydate/laydate.js"></script>
    <script src="${ctxStatic}/common/jeeplus.js"></script>
    <link href="${ctx}/css/page.css" type="text/css" rel="stylesheet">
    <script>
        var ctx="${ctx}";

        $().ready(function () {

        });

    </script>
    <sitemesh:head></sitemesh:head>
</head>
<body>
<!-- 头部-->
<jsp:include page="page/_head.jsp"/>
<!-- 中间logo及菜单-->
<jsp:include page="page/_menu.jsp"/>
<sitemesh:body></sitemesh:body>
<!-- 尾部-->
<jsp:include page="page/_buttom.jsp"/>
<%--<!-- 右侧菜单-->--%>
<%--<jsp:include page="page/_right.jsp"/>--%>
</body>
</html>
