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
	</script>

	<script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>
	<script src="${ctx}/jj/jquery-1.11.1.min.js"  type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/jquery.validate.min.js?v=6" type="text/javascript"></script>

	<script src="${ctxStatic}/jquery-validation/1.14.0/localization/messages_zh.min.js?v=1" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/add.js?v=1" type="text/javascript"></script>


	<script src="${ctx}/jj/jj.js"  type="text/javascript"></script>
	<link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/jj/jj.css?v=2" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${ctx}/static/bigautocomplete/jquery.bigautocomplete.css" type="text/css" />

	<sitemesh:head/>
</head>
<body class=" <sitemesh:getProperty property='body.class'/>"  style="background-color: #ffffff;<sitemesh:getProperty property='body.style'/>">
<shiro:authenticated>
	<sitemesh:body/>
</shiro:authenticated>

<shiro:notAuthenticated>
<script>
	layui.use('layer',function(){


        jj.error("登录超时,需要重新登录...");
        top.location = "${ctx}/index.shtml";

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