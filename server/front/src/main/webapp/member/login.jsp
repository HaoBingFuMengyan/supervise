<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="data-spm" content="">
	<shiro:authenticated>
		<meta http-equiv="refresh" content="0;url=${ctx}/logout.html" />
	</shiro:authenticated>
<title>煤亮子-登录</title>
<link rel="stylesheet" href="${ctx}/css/buxiu.css">
<link rel="stylesheet" href="${ctx}/css/static.css">
<style>
	.layout-top{
		display: none;
	}
</style>
<script>

    function doSubmit(){
        var form=document.getElementById("loginForm");
        if(form.username.value.trim().length==0 || form.username.value==""){
            $(".errorMsg").text("用户名不能为空！");
            $(".errorBox").show();
            return false;
        }
        if(form.password.value.trim().length==0 || form.password.value==""){
            $(".errorMsg").text("密码不能为空！");
            $(".errorBox").show();
            return false;
        }
        if(form.checkword && !form.checkword.value){
            $(".errorMsg").text("验证码不能为空！");
            $(".errorBox").show();
            return false;
        }
        form.submit();
    }

    // 如果在框架或在对话框中，则弹出提示并跳转到首页
    if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
        alert('未登录或登录超时。请重新登录，谢谢！');
        top.location = "${ctx}/index.shtml";
    }

    function refreshCaptcha() {

        $('#captchaImg').hide().attr('src','${ctx}/captcha.shtml?a=' + Math.floor(Math.random()*100)).fadeIn();
    }



    function hideDiv(){

        if('${errormsg}'){
            $(".errorBox").show();
        }else{
            $(".errorBox").hide();
        }
        //alert('${errormsg}');
    }
	$(document).ready(function(){
        hideDiv();
		$(".mod-nav ul li a").each(function(){
			$this = $(this);
			if($this[0].href==String(window.location)){
				$this.addClass("active");
			}
		});
//		var whole = $(window).height();
//		var bg_h = whole - 212 +"px";;
//		$(".login_page").height(bg_h);
//		$(".login").height(bg_h);
	})
</script>
</head>
<body>
<div class="login_page">
	<div class="login-card">
		<div class="login clearfix">
			<div class="login_le">
				<h2>欢迎来到<img src="${ctx}/images/login-icon.png" /> </h2>
				<h4>基金协同监管系统</h4>
			</div>
			<div class="login_rg clearfix" align="center">
				<h2>会员登录</h2>
				<div class="form">
					<form id="loginForm" class="form-signin" method="post" action="${ctx}/login.html">
						<div class="errorBox" ><i class="icon icon_error"></i><span class="errorMsg" style="color:red;position:absolute;margin-top:-20px;">${errormsg}</span></div>
						<div class="errorBox" style="display: none;"><i class="icon icon_error"></i><span class="errorMsg" style="color:red;position:absolute;margin-top:-20px;"></span></div>
						<div class="input_box">
							<input type="text" id="username" name="username" maxlength="11" value="" class="inputs username" placeholder="请输入11位手机号">
							<i class="icon icon-yuangongxinxi"></i>
						</div>
						<div class="input_box">
							<input type="password" id="password" name="password" maxlength="18" class="inputs password" placeholder="请输入密码">
							<i class="icon icon-mima1"></i>
						</div>
						<c:if test="${bisneedword}">
							<div class="input_group input_group_sm m-b text-muted validateCode bottom20">
								<label class="input-label mid">验证码：</label>
								<input type="text" id="checkword" name="checkword" maxlength="5" class="txt required right10" style="font-weight:bold;width:120px;height:27px;margin-bottom:5px;" aria-required="true">
								<img id="captchaImg" src="${ctx}/captcha.shtml" onclick="refreshCaptcha();" class="mid validateCode" style="width: 70px;height: 30px;">
								<a href="javascript:" onclick="refreshCaptcha();" class="mid validateCodeRefresh" style="">看不清</a>
							</div>
						</c:if>
						<input type="button" class="btns" onclick="return doSubmit();" id="btn_login" value="登  录">
					</form>
					<div class="link">
						<a href="${ctx}/hy/user/forgetpwdindex.html" class="le">忘记密码？</a>
						<%--<a href="${ctx}/register.html" class="rg">免费注册</a>--%>
					</div>
					<div class="center"></div>
					<div class="qustion">
						<p>如果您在登陆时遇到问题</p>
						<p>请拨打服务热线:400-086-0101</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
