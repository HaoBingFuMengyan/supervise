<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>登录密码修改成功</title>
<meta name="decorator" content="officenoleft" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />

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
	    // run listener function
	    var funcRunListener = function(){
	    	$('#timeid').text(5-OBJ_Timer.options.iCurrentCount);
	    };
	    // complete listener function
	    var funcCompleteListener = function(){
	    	window.location.href="${ctx}/logout.html";
	    };
	    OBJ_Timer.addEventListener( 'timer', funcRunListener );
	    OBJ_Timer.addEventListener( 'timerComplete', funcCompleteListener );
	    OBJ_Timer.start();
}
$().ready(gotologin);

</script>
</head>
<body>

<div class="mbody"  style="min-height:100px;">

	<div style="width:100%;text-align:center; color:red;height:200px;margin:0 auto;font-weight:bold;line-height:200px;display:inline-block; font-size:25px">
	密码修改成功!<a href="${ctx}/logout.html" style="color:red"><span id="timeid">5</span>秒后转到登录界面</a>
	</div>
</div><!-- /wrapper -->

</body>
</html>