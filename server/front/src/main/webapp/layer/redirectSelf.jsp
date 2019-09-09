<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<meta name="decorator" content="iframe"/>
<head>

	<script type="text/javascript">

        top.layer.msg("${message.title}",{icon:1});

        parent.location.reload();

	</script>
</head>
