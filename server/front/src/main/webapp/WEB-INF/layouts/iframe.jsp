<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title><sitemesh:title/></title>
	<link type="image/x-icon" href="${ctx}/title/favicon.png" rel="shortcut icon">
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/font/iconfont.css"/>
    <script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/jeeplus.js"></script>


    <!-- 校验js -->
    <script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js" charset="UTF-8" ></script>
    <script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/add.js" charset="UTF-8" ></script>
    <link href="${ctx}/js/jquery-validation-1.17.0/demo/css/cmxform.css" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <sitemesh:head></sitemesh:head>
    <script type="text/javascript">

        if(top.layer)
           top.layer.closeAll('loading');
        if(!parent||parent==window)
            window.location.href="${ctx}/index.shtml";
        $(document).ready(function() {
            $("form").validate({});
        });
    </script>
</head>
<body class=" <sitemesh:getProperty property='body.class'/>"  style="<sitemesh:getProperty property='body.style'/>">
<sitemesh:body></sitemesh:body>
</body>
</html>
