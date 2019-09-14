<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>基金协同监管系统</title>
	<link rel="stylesheet" href="${ctx}/css/static.css">
	<style>
		.layui-layer{
			top:40%!important;
		}
	</style>

	<script type="text/javascript">
        window.onload = function () {(
            setInterval(function () {
                var second = parseInt($("#second").text());
                if (second == 0){
					window.location.href="${ctx}/hy/authapply/list.shtml";
                    return;
                }
                $("#second").text(parseInt(second - 1));
            },1000)
        )};

	</script>
</head>
<body>
<div class="mei-view">
	<div class="mycon">
		<div class="tips-con">
			<img src="${ctx}/images/tips-ok.png" />
			<p>申请成功，<i id="second">5</i>s后跳转申请列表...</p>
			<a href="${ctx}/hy/authapply/list.shtml">立即跳转</a>
		</div>
	</div>
</div>
</body>
</html>
