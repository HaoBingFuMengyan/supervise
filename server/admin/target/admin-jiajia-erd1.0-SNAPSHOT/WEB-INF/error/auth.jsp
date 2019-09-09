<%@ page contentType="text/html;charset=UTF-8" isErrorPage="false" %>
<%@ page import="com.frogsing.heart.log.Lg" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

  Exception ex=(Exception)request.getAttribute("exception");
  String msg=java.net.URLEncoder.encode(ex.getMessage(),"UTF-8");
  response.setHeader("frog","{status:1,msg:'"+msg.replace("'", "\\'")+"'}");
  response.setHeader("sessionstatus","timeout");

  //记录日志
  Lg.act(ex.toString());
  //response.sendRedirect("login.shtml");
%>
<!DOCTYPE html>
<html>
<head>
  <title>您没有权限,请重新登录</title>
  <meta name="decorator" content="iframe">

</head>

<body>
<div style="margin-top: 100px;margin-left: 100px;">
  <h1 >您没有权限,请向管理员确认您由此权限!</h1>
  <h10><%=ex.getMessage()%></h10>
</div>
</body>
</html>