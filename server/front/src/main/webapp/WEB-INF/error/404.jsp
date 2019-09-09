<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

<body>
	<script type="text/javascript">
		if(window.location.href.indexOf("${ctx}/index.html")<0){
			//alert("页面不存在哦!"+window.location.href)
            //window.location.href="${ctx}/index.html";
        }
	</script>
</body>
</html>