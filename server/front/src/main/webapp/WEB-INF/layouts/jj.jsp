<%@ page import="org.apache.shiro.web.util.WebUtils" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="jj" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html style="overflow-x:hidden;">
<head>
	<title><sitemesh:title/></title>
	<%@ page contentType="text/html;charset=UTF-8" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=9,IE=10" />
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-store">

	<script type="text/javascript">
        var ctx = '${ctx}', ctxStatic='${ctxStatic}';
        // if(top==window)
		// {
		//     window.location.href=ctx+"/index.shtml";
		// }
	</script>

	<link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.css" rel="stylesheet" type="text/css">
	<link href="${ctxStatic}/jj/jj.css?v=1" rel="stylesheet" type="text/css"/>

	<script src="${ctxStatic}/jquery/jquery-1.9.1.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery/jquery.collapse.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
	<script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>
	<script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js" charset="UTF-8" ></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/add.js" charset="UTF-8" ></script>
	<link href="${ctx}/js/jquery-validation-1.17.0/demo/css/cmxform.css" rel="stylesheet" type="text/css">
	<script src="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jj/jj.js" type="text/javascript"></script>

	<sitemesh:head/>
</head>
<body class=" <sitemesh:getProperty property='body.class'/>"  style="background-color: #ffffff;<sitemesh:getProperty property='body.style'/>">
<shiro:authenticated>
	<sitemesh:body/>
</shiro:authenticated>

<shiro:notAuthenticated>
<script>
	layui.use('layer',function(){
        jj.error("登录超时,需要重新登录");
        window.location.href="${ctx}/index.shtml";
	});
</script>
</shiro:notAuthenticated>
<script type="text/javascript">
    layui.use('element',function(){
        var element = layui.element;

    });
</script>
</body>
</html>