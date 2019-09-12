<%--
  Created by IntelliJ IDEA.
  User: fanyijie
  Date: 2017/9/25
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
<title>基金协同监管系统沟通</title>
<link href="${ctx}/of/css/setup.css" rel="stylesheet" type="text/css">
<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
<script src="${ctx}/js/sendmobile.js" type="text/javascript"></script>
<style>
.step-list-con .step-list li.item-step2 {
    background-position: 0 -97px;
    color:#0078bf;
}
div.get label.error{
    position: absolute;
    width: 300px;
    left: -233px;
    top: 56px;
}
</style>
<script type="text/javascript">
	
	$(document).ready(function (){
		$("#sendCode").sendCode({
			url:"${ctx}/sendmobilecode.json",
			nodecode:"modifyToNewSmobile",
			checkonly:true,
			voice:false,
			imgcheck:false,
			refresh:function(){}
		});
	});
	
	function nextStep(){
		var flag = true;
		var scheckword = $("#scheckword").val();
		var smobile = $("#smobile").val();

		if(scheckword == "" || scheckword.length != 4){
			flag = false;
			return;
		}
		if(isNaN(smobile) || smobile == "" || smobile.length != 11){
			flag = false;
			return;
		}
		
		if(flag)
			$("#inputForm").submit();
	}
	
	
</script>
</head>
<body>
	<sys:message content="${message}"></sys:message>
	<div class="top50">
		<form id="inputForm" action="${ctx}/hy/user/modifysuccesssmobile.shtml" method="post">
		<input type="hidden" value="${user.id}" name="id"/>
		<input type="hidden" value="${user.smemberid}" name="smemberid"/>
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
						<label></label>
					</li>
					<li class="step-item item-step3">
						<img src="${ctx}/images/cgStep3.jpg">
						<p>成功</p>
					</li>
				</ul>
			</div>
            <div class="input_group input_group_lg bottom20 left100">
            	<label>新手机号码：</label><input type="text" name="smobile" id="smobile" class="form_control" value="" placeholder="请输入新手机号码" />
            </div>
            <div class="input_group input_group_lg bottom20 left100">
            	<label>手机验证码：</label><input type="text" name="scheckword" id="scheckword" class="form_control" placeholder="输入手机验证码" />
            	<div class="get">
            		<input id="sendCode" class="code bluefont" value="获取验证码" readonly="readonly"/>
            	</div>
            </div>
            <div class="input_group input_group_lg bottom20 left100 top50">
            	<label></label>
            	<input type="button" class="form_control comfir" onclick="nextStep();" value="下一步" />
            </div>
        </form>
	</div>
</body>
</html>
