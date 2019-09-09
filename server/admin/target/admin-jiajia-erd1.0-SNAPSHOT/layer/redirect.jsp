<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript">
        top.layer.msg("${message.title}",{icon:1});

        top.location.href="${ctx}/${url}";

	</script>
</head>
