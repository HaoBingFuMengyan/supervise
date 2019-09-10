<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title><sitemesh:title/></title>
	<link type="image/x-icon" href="${ctx}/title/favicon.png" rel="shortcut icon">
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/font/iconfont.css"/>
    <script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
    
    <!-- 校验js -->
    <script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js" charset="UTF-8" ></script>
	<link href="${ctx}/js/jquery-validation-1.17.0/demo/css/cmxform.css" rel="stylesheet" type="text/css">

    <sitemesh:head></sitemesh:head>
</head>
<body>
<!-- 头部-->
<jsp:include page="page/_head.jsp"/>
<!-- 中间logo及菜单-->
<sitemesh:body></sitemesh:body>
<!-- 尾部-->
<jsp:include page="page/_buttom.jsp"/>
<!-- 右侧菜单-->
</body>
</html>
