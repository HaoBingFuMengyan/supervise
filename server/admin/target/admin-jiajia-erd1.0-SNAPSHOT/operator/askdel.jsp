<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
<title>角色管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	 	
	</script>
</head>
<body class="">
	<div class="wrapper wrapper-content">

		<form action="${ctx}/${obj}/delete.shtml" method="post">
		<c:forEach var="id" items="${ids}">
		<input type="hidden" name="ids" value="${id }"/>
		</c:forEach>
		</form>
		确认删除??
	</div>




</body>
</html>