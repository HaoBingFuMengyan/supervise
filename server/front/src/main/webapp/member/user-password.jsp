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
<title>煤亮子</title>
<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
<link href="${ctx}/of/css/setup.css" rel="stylesheet" type="text/css">
<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
<script src="${ctx}/js/sendmobile.js" type="text/javascript"></script>
<script type="text/javascript">
	
	$(document).ready(function (){
		$("#sendCode").sendCode({
			url:"${ctx}/sendcode.json",
			nodecode:"modifySpassword",
			checkonly:false,
			voice:false,
			imgcheck:false,
			oldpwd:"#oldpassword",
			refresh:function(){}
		});
		$('.get').click(function(){
            if( $("#code-error").css("display")=='none' ) {

            }
            else{
				$("#code-error").css({"display":"none"})
            }
		})

	});


	function doSubmit(){
	    $("#inputForm").submit();
	}
	
	$.validator.setDefaults({
	    submitHandler: function() {
	        return true;
	    }
	});
	
	 $().ready(function() {
         $("#inputForm").validate();
     });
</script>
</head>
<body>
	<sys:message content="${message}"></sys:message>
	<div class="ac top10" style="background: #fff;padding:30px 0">
		<form id="inputForm" action="${ctx}/hy/user/password.shtml" method="post">
			<input type="hidden" name="id" value="${user.id}">
			<input type="hidden" name="smobile" id="smobile" value="${user.smobile}">
			<div class="sqcon top30" style="width: 660px;">
				<div class="input_group input_group_lg bottom20 left120">
					<label>原密码：</label><input type="password" name="oldpassword" id="oldpassword" class="form_control" required placeholder="请输入您的原密码" />
				</div>
				<div class="input_group input_group_lg bottom20 left120">
					<label>新密码：</label><input type="password" name="newpassword" id="newpassword1" minlength="6" maxlength="20" class="form_control" required placeholder="密码由6-20字母、字符或数字组成" />
				</div>
				<div class="input_group input_group_lg bottom20 left120">
					<label>确认新密码：</label><input type="password" name="newpassword2" minlength="6" maxlength="20" class="form_control" required equalTo="#newpassword1" placeholder="请再次输入您的新密码" /><!-- equalTo="newpassword" -->
				</div>
				<div class="input_group input_group_lg bottom20 left120">
					<label>手机验证码：</label><input type="text" name="code" id="code" class="form_control" required placeholder="输入手机验证码" />
					<div class="get"><input class="code bluefont" id="sendCode" value="获取验证码 " readonly="readonly"/></div>
				</div>
				<div class="input_group input_group_lg bottom20 left120 top50">
					<label></label>
					<input onclick="doSubmit()" type="button" class="form_control comfir" style="width:356px;" value="确定" />
				</div>
			</div>
        </form>
	</div>
</body>
</html>
