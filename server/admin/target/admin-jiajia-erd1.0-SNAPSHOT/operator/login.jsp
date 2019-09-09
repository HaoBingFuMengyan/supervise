<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="decorator" content="none"/>
		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<shiro:hasRole name="admin">
		<meta http-equiv="refresh" content="0;url=${ctx}/index.shtml" /> 
		</shiro:hasRole>
		<shiro:hasRole name="user">
		<meta http-equiv="refresh" content="0;url=${ctx}/logout.shtml" /> 
		</shiro:hasRole>
		<script src="${ctxStatic}/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
		<script src="${ctxStatic}/jquery/jquery-migrate-1.1.1.min.js" type="text/javascript"></script>
		<script src="${ctxStatic}/jquery-validation/1.14.0/jquery.validate.js" type="text/javascript"></script>
		<script src="${ctxStatic}/jquery-validation/1.14.0/localization/messages_zh.min.js" type="text/javascript"></script>
		<script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
		<script src="${ctxStatic}/common/jeeplus.js" type="text/javascript"></script>
		<!-- 引入layer插件 -->
		<title>基金协同监管系统登陆</title>
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/common/login/loginstyle.css" tppabs="css/style.css" />
		<style>
			body{height:100%;background:#244f81;overflow:hidden;}
			canvas{z-index:-1;position:absolute;}
			.alert-success{
			color:#3c763d;
			background-color:#dff0d8;
			border-color:#d6e9c6
			}
			.alert{
			padding:15px;
			margin-bottom:20px;
			border:1px solid transparent;
			border-radius:4px;
			}
			.close{
			float:right;
			font-size:21px;
			font-weight:700;
			line-height:1;
			color:#000;
			text-shadow:0 1px 0 #fff;
			opacity:0.2;
			}
			button.close{
			-webkit-appearance:none;
			padding:0;
			cursor:pointer;
			border:0;
			background:0 0;
			}
		</style>
		<script src="${ctxStatic}/common/Particleground.js" tppabs="js/Particleground.js"></script>
		<script>
			$(document).ready(function() {
                hideDiv();
			  //粒子背景特效
			  $('body').particleground({
			    dotColor: '#4483b3',
			    lineColor: '#4483b3'
			  });
			  //验证码
			//  createCode();
			  //测试提交，对接程序删除即可
			  $(".submit_btn").click(function(){
				  location.href="javascrpt:;"/*tpa=http://***index.html*/;
				  });
			});
		</script>
		<script>
			if (window.top !== window.self) {
				window.top.location = window.location;
			}
		</script>
		<script type="text/javascript">
				function refreshCaptcha() {
					$('#captchaImg').hide().attr('src','${ctx}/captcha.shtml?a=' + Math.floor(Math.random()*100)).fadeIn();
				}
		
				function doSubmit(){
					var form=document.getElementById("loginForm");
					if(form.username.value.length==0 || form.username.value==""){
						document.getElementById("messageText").innerText="用户名不能为空！";
						document.getElementById("messageBox").style.display="";
						return false;
					}
					if(form.password.value.length==0 || form.password.value==""){
						document.getElementById("messageText").innerText="密码不能为空！";
						document.getElementById("messageBox").style.display="";
						return false;
					}
					//alert(form.j_captcha.value.length);
                    if(form.checkword && !form.checkword.value){
						document.getElementById("messageText").innerText="验证码不能为空！";
						document.getElementById("messageBox").style.display="";
						return false;
					}
					form.submit();
				}
				
				// 如果在框架或在对话框中，则弹出提示并跳转到首页
				if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
					alert('未登录或登录超时。请重新登录，谢谢！');
					top.location = "${ctx}";
				}
				
				function refreshCaptcha() {
					
					$('#captchaImg').hide().attr('src','${ctx}/captcha.shtml?a=' + Math.floor(Math.random()*100)).fadeIn();
				}
				
				

				function hideDiv(){
					
					if('${errormsg}'){
						document.getElementById("messageText").innerText='${errormsg}';	
						document.getElementById("messageBox").style.display="";
					}else{
						document.getElementById("messageBox").style.display="none";
					}
					//alert('${errormsg}');
				}
				
				
		</script>
		
	</head>

	
	<body>
	   <div class="center">
								<div id="messageBox" class="alert alert-success" style="display:none; ">
									<button class="close" data-dismiss="alert">×</button>
										<span id="messageText">${errormsg}</span>
								</div>
							</div>
	   <form id="loginForm" class="form-signin" action="${ctx}/login.shtml" method="post">
	   <dl class="admin_login" id="login-box"> 
			 <dt>
				  <strong style="color:#efefef;">基金协同监管系统</strong>
				  <em>Management System</em>
			 </dt>
			 <dd class="user_icon">
			      <input type="text" placeholder="账号" class="login_txtbx" id="username" name="username"/>
			 </dd>
			 <dd class="pwd_icon">
			      <input type="password" placeholder="密码" class="login_txtbx" id="password" name="password"/>
			 </dd>
		   <c:if test="${bisneedword}">
		   <dd class="val_icon">
				  <div class="checkcode">
					    <input id="checkword" name="checkword" type="text"  placeholder="验证码" maxlength="4" class="login_txtbx">    
				  </div>
				  <a href="javascript:refreshCaptcha()" class="yzcode">
				  			<img style="vertical-align: middle;width:85px;height:42px;" id="captchaImg" src="${ctx}/captcha.shtml" />
				  </a>
			 </dd>
		   </c:if>
			 <dd>
			      <input type="button" value="立即登陆" class="tijiao_btn" onclick="return doSubmit();"/>
			 </dd>
			 <dd>
			      <p> © 技术支持：上海精悍网络科技有限公司</p>
			 </dd>
		</dl>
		</form>

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='../assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<style>
		/* Validation */

			label.error {
			    color: #cc5965;
			    display: inline-block;
			    margin-left: 5px;
			}
			
			.form-control.error {
			    border: 1px dotted #cc5965;
			}
		</style>
	<!-- inline scripts related to this page -->
		<script type="text/javascript">
		$(document).ready(function() {
			 $(document).on('click', '.form-options a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});
			
			
			
		</script>
	</body>
</html>