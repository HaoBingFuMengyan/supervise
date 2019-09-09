<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html style="overflow-x:hidden;overflow-y:auto;">
<head>
	<title><sitemesh:title/></title>
	<%@include file="/include/head.jsp" %>
	<sitemesh:head/>
</head>
<body class=" <sitemesh:getProperty property='body.class'/>"  style="<sitemesh:getProperty property='body.style'/>">
     
     <sitemesh:body/>
  	
</body>
</html>