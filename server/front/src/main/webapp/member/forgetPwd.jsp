<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="decorator" content="none" />
	<meta name="keywords" content="煤亮子,煤亮子商城"/>
	<meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
<title>煤亮子-找回密码</title>
	<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${ctx}/font/iconfont.css">
	<link href="${ctx}/css/buxiu.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/css/reg.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/css/register.css" rel="stylesheet" type="text/css">
	<script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js" charset="UTF-8" ></script>
	<script src="${ctx}/js/additional-methods.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		
		$().ready(function (){
            $("#inputForm").validate({
                rules:{
                    spassword0:{
                        required:true,
                        minlength:6,
                        maxlength:18
                    },
                    spassword:{
                        required:true,
                        equalTo:'#spassword0'
                    }
                }
            });
			

			$("#btn_reg").click(function (){
                var flag=true;
                var r=$("#inputForm").valid();
                if(!r)
                    return;
                if(flag){

                    $('#inputForm').submit();
                }
			});
			
		});
		
	</script>
</head>

<body>
<div class="reg-con">
<div class="register">
	<div class="mycon posi clearfix">
			<div class="reg_le">
				<img src="${ctx}/images/login-le-img.png" />
			</div>
			<div class="regBox">
				<sys:message content="${message}"></sys:message>
				<h2>设置新密码</h2>
				<p id="message">${errormsg}</p>
				<div class="form">
					<form id="inputForm" class="form-signin" method="post" action="${ctx}/hy/user/forgetpwdsuccess.html">
					<input type="hidden" value="${susername}" name="susername"/>
					<div class="errorBox"><i class="icon icon_error"></i><span class="errorMsg"></span></div>
						<div class="input_box">
							<input type="password" name="spassword0"  placeholder="请输入密码，密码由6-20位字母，字符或数字组成"  id="spassword0" class="inputs" placeholder="请输入新密码" />
							<i class="icon icon-yuangongxinxi"></i>
						</div>
						<div class="input_box">
							<input type="password" name="spassword" placeholder="请再次输入密码" id="spassword1" equalTo="#spassword0" class="inputs" placeholder="请确认新密码" />
							<i class="icon icon-yuangongxinxi"></i>
						</div>
						<input type="button" class="btns" id="btn_reg" value="下一步">
					</form>
					<div class="qustion">
						<p>如果您在找回密码时遇到问题</p>
						<p>请拨打服务热线:400-086-0101</p>
					</div>
				</div>
			</div>
		</div>
</div>
</div>
</body>
</html>
