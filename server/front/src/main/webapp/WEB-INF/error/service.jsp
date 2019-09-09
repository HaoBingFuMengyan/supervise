<%@ page contentType="text/html;charset=UTF-8" isErrorPage="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Exception ex=(Exception)request.getAttribute("exception");
	String msg=java.net.URLEncoder.encode(ex.getMessage(),"UTF-8");
 	response.setHeader("frog","{\"status\":2,\"msg\":\"" + msg.replace("'", "\\'") + "\"}");
 //	response.setHeader("P3P","CP=CAO PSA OUR");  
 //	response.setHeader("Access-Control-Expose-Headers","frog");
%>
<!DOCTYPE html>
<html>
<head>
	<title>您没有此操作的权限</title>
</head>

<body>

<div style="margin-top: 100px;margin-left: 100px;">
	<h1 >服务没有正常启动!</h1>
	<h10><%=ex.getMessage()%></h10>
</div>

</html>