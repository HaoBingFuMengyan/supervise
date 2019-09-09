<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function (){
		
		window.onload = gosubmit;
		
	});
	
	function gosubmit(){
		document.getElementById("loginForm").submit();
	}
	
</script>
</head>
<body>
	注册成功，登录跳转中...
	<form id="loginForm" action="${ctx}/login.html" method="post">
		<input type="hidden" name="username" id="username" value="${r.smobile}"/>
		<input type="hidden" name="password" id="password" value="${r.spassword}"/>
		<%-- <input type="text" name="checkword" id="checkword" value="${checkword}"/> --%>
	</form>
</body>
</html>