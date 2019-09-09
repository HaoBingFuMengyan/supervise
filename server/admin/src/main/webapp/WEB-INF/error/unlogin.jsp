<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

		<script type="text/javascript">
            top.layer.alert('登录超时!, [确定] 跳转到登录界面!', {
                skin: 'layui-layer-molv' //样式类名
                ,closeBtn: 0
            }, function(){
                top.location.href="${ctx}/login.shtml";
            });


		</script>
	</head>
</html>