﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/side.css">
<meta name="data-spm" content="">
<title>基金协同监管系统沟通-注册</title>
<link rel="stylesheet" href="css/buxiu.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/static.css">
<link rel="stylesheet" href="font/iconfont.css">
	<style>
		.layout-top{
			display: none;
		}
	</style>
<script src="js/jquery-1.11.3.js"></script>
	<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
<script>
    var OBJ_Timer;
    function useRegCode(){
        var smobile = $.trim($("#smobile").val());
        if(isNaN(smobile) || smobile == "" || smobile.length != 11)
            return;

        if(!/^(13[0-9]|15[0-9]|14[7]|17[0-9]|18[0-9])[0-9]{8}$/.test(smobile)){
            $("#message").removeClass("greentip");
            $("#message").text("请输入正确的手机号");
            $("#smobile").focus();
            return;
        }

        $("#sendCode").attr("disabled",true);
        $.ajax({
            type:"post",
            url:"${ctx}/useRegCode.json",
            cache:false,
            data:{'smobile':smobile},
            success:function (data){
                if(data.success){
                    $("#message").html("验证码发送成功，请注意查收");
                    $("#message").addClass("greentip");
                }
                else{
                    $("#message").removeClass("greentip");
                    $("#message").html(data.msg);
                }


                OBJ_Timer = $.timer.init({
                    iTimerDelay: 1000,
                    iRepeatCount: data.obj,
                    cRepeatType: 'timeout',
                    name: 'my timer'
                });

                var funcRunListener = function(){
                    $("#sendCode").attr("disabled",true);
                    $("#sendCode").val("重获验证码("+(data.obj-OBJ_Timer.options.iCurrentCount)+")");
                };
                var funcCompleteListener = function(){
                    $("#sendCode").attr("disabled",false);
                    $("#sendCode").val("重获验证码");
                };

                OBJ_Timer.addEventListener( 'timer', funcRunListener );
                OBJ_Timer.addEventListener( 'timerComplete', funcCompleteListener );
                OBJ_Timer.start();
            },
            error:function(data){
                $("#message").removeClass("greentip");
                $("#message").html("系统出错，请联系管理员!");
            }
        });

    }

    $(document).ready(function(){
		$(".mod-nav ul li a").each(function(){
			$this = $(this);
			if($this[0].href==String(window.location)){
				$this.addClass("active");
			}
		});
		var whole = $(window).height();
		var bg_h = whole - 212 +"px";;
//		$(".regi_page").height(bg_h);

        $("#btn_reg").click(function (){
            var isNo = true;
            var flag = $("input[type='checkbox']").is(":checked");

            if(flag)
                $("#message").html("");
            else{
                $("#message").html("须通过用户服务协议,才允许进行注册!");
                isNo = false;
                return;
            }

            var smobile = $("#smobile").val();
            var scheckword = $("#scheckword").val();
            if(isNaN(smobile) || smobile == "" || smobile.length != 11){
                isNo = false;
                return;
            }
            if(isNaN(scheckword) || scheckword == "" || scheckword.length != 4){
                isNo = false;
                return;
            }
            if(isNo)
                $("#inputForm").submit();
        });
	})
</script>
</head>
<body>
<div class="login-tit">
	<div class="mycon">
		<a href="${ctx}/index.html"><img src="${ctx}/images/logo.png" /></a>
		<span>欢迎注册</span>
	</div>
</div>
<div class="regi_page">
	<%--<div class="regi_bg">--%>
		<%--<img src="${ctx}/images/login_bg.png" />--%>
	<%--</div>--%>
	<div class="mycon clearfix">
		<div class="reg_le">
			<img src="${ctx}/images/login-le-img.png" />
		</div>
		<div class="regBox">
			<h2>会员注册</h2>
			<p id="message">${error}</p>
			<div class="form">
				<form id="inputForm" method="post" action="${ctx}/register.html">
					<div class="input_box">
						<input id="smobile" name="smobile" placeholder="请输入11位手机号" type="text" class="inputs username" value="" maxlength="11">
						<i class="icon icon-yuangongxinxi"></i>
					</div>
					<div class="input_box">
						<input id="scheckword" name="scheckword" placeholder="请输入短信验证码" type="text" class="inputs username num" value="" maxlength="6">
						<input class="yzm right" value="获取验证码" type="button" onclick="useRegCode()" id="sendCode">
						<i class="icon icon-mima1"></i>
					</div>
					<div class="input_box">
						<input id="spassword" name="spassword" placeholder="请输入密码，密码由6-20位字母，字符或数字组成" type="password" class="inputs password" value="" maxlength="20">
						<i class="icon icon-mima1"></i>
					</div>
					<div class="link bottom10">
						<label for="read1" class="left">
							<input type="checkbox" id="read1" name="accept" checked="">我已阅读并同意 <a target="_blank" href="${ctx}/help_P000035.html">用户服务协议</a>
						</label>
						<a href="login.html" class="rg">已有账号</a>
					</div>
					<input type="button" class="btns" id="btn_reg" value="注册">
				</form>
				<div class="qustion">
					<p>如果您在登陆时遇到问题</p>
					<p>请拨打服务热线:400-086-0101</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>