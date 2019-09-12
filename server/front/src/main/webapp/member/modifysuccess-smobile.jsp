<%--
  Created by IntelliJ IDEA.
  User: fanyijie
  Date: 2017/9/25
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>基金协同监管系统沟通</title>
<link href="${ctx}/of/css/setup.css" rel="stylesheet" type="text/css">
<style>
.step-list-con .step-list li.item-step2,.step-list-con .step-list li.item-step3 {
    background-position: 0 -97px;
    color:#0078bf;
}
</style>

	<script language=javascript>
        setTimeout(function () {
            window.location.href="${ctx}/logout.html";
            }, 5000);
	</script>
</head>
<body>
	<div class="top50 ac">
		<form action="">
			<div class="step-list-con bottom50">
				<ul class="step-list fn-clear current-step1 clearfix" style="margin-left: 96px">
					<li class="step-item item-step1">
						<img src="${ctx}/images/cgStep1.jpg">
						<p class="cur">验证原手机号</p>
					</li>
					<li class="step-item item-space">
						<label class="pass"></label>
					</li>
					<li class="step-item item-step2">
						<img src="${ctx}/images/cgStep22.jpg">
						<p class="cur">验证新手机号</p>
					</li>
					<li class="step-item item-space">
						<label class="pass"></label>
					</li>
					<li class="step-item item-step3">
						<img src="${ctx}/images/cgStep33.jpg">
						<p class="cur">成功</p>
					</li>
				</ul>
			</div>
		    <div class="suc">手机号码修改成功！
		    	<img class="aha" src="${ctx}/images/choose.png" /> 
		    </div>
        </form>
	</div>
</body>
</html>
