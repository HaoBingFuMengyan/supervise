<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="decorator" content="none" />
	<title>密码找回成功</title>
	<link href="${ctx}/css/register.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/css/buxiu.css" rel="stylesheet" type="text/css">
	<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>	

<script type="text/javascript">
var  OBJ_Timer;
function gotologin(){

	   OBJ_Timer = $.timer.init({
  			        iTimerDelay: 1000,
  			        iRepeatCount: 5,
  			        cRepeatType: 'timeout',
  			        name: 'my timer'
  			    });
	    //run listener function
	    var funcRunListener = function(){
	    	$('#timeid').text(5-OBJ_Timer.options.iCurrentCount);
	    };

	    //complete listener function
	    var funcCompleteListener = function(){
	    	window.location.href="${ctx}/login.html";
	    };

	    OBJ_Timer.addEventListener( 'timer', funcRunListener );
	    OBJ_Timer.addEventListener( 'timerComplete', funcCompleteListener );
	    OBJ_Timer.start();

}
$().ready(gotologin);

</script>
</head>

<body>
<div class="reg-con">
<div class="register">
	<div class="mycon posi">
			<div class="reg_le">
				<img src="${ctx}/images/login-le-img.png" />
			</div>
			<div class="regBox">
				<img class="bingo" src="${ctx}/images/find_suc.png" />
				<h2 class="diffh">密码找回成功</h2>
				<p class="grayfont fbdone">
					<a class="grayfont" href="${ctx}/login.html"><span id="timeid" class="redfont">5</span>秒后转到登录界面</a>
				</p>
				<%--<div class="form">--%>
					<%--<div class="qustion diffques">--%>
						<%--<p>如果您在找回密码时遇到问题</p>--%>
						<%--<p>请拨打服务热线:4008-8783888</p>--%>
					<%--</div>--%>
				<%--</div>--%>
			</div>
	</div>
</div>
</div>
</body>
</html>
