<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="decorator" content="none" />
	<meta name="keywords" content="基金协同监管系统沟通,基金协同监管系统沟通"/>
	<meta name="description" content="基金协同监管系统沟通(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
	<title>基金协同监管系统沟通</title>
	<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${ctx}/font/iconfont.css">
	<link href="${ctx}/css/register.css" rel="stylesheet" type="text/css">
	<script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
	<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
	<script src="${ctx}/js/sendmobile.js" type="text/javascript"></script>
	<script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js" charset="UTF-8" ></script>
	<script src="${ctx}/js/additional-methods.js" type="text/javascript"></script>

	<script type="text/javascript">
        $(document).ready(function (){
            hideDiv();
            $("#inputForm").validate({
                rules:{
                    smobile:{
                        required:true,
                        mobile:true
                    }
                }
            });
            $("#btn_reg").click(function (){
                var smobile = $("#smobile").val();
                //var suername = $("#susername").val();
                var scheckword = $("#scheckword").val();

                if(isNaN(smobile) || smobile == "" || smobile.length != 11)
                    return;
                /* if(suername == "")
                    return; */
                if(isNaN(scheckword) || scheckword == "" || scheckword.length != 4)
                    return;

                $("#inputForm").submit();
            });


            $("#sendCode").sendCode({
                url:"${ctx}/sendmobilecode.json",
                nodecode:"forgetpwd",
                checkonly:false,
                imgcheck:false,
                voice:false,
                checkform:function(){
                    var r=$("#inputForm").valid();
                    if(!r)
                        return false;
                    if(smobile()){
                        $(".errorBox").hide();
                        return true;
                    }else{
                        $(".errorBox").show();
                        return false;
                    }
                },
                refresh:function(){}
            });


        });

        function smobile(){
            var smobile=$("#smobile").val();
            var flag=false;
            $.ajax({
                url : "${ctx }/hy/user/findSmobile.json",
                data: {"smobile":smobile},
                cache : false,
                async:false,
                dataType:"html",
                success : function(data) {
                    $(".errorBox").html(data);
                    flag= $("#flag").val();
                    if(flag=="true"){
                        flag =  true;
                    }else{
                        flag =  false;
                    }


                },
                error: function(html){}
            });
            return flag;
        };

        function hideDiv(){

            if('${errormsg}'){
                $(".errorBox").show();
            }else{
                $(".errorBox").hide();
            }
            //alert('${errormsg}');
        }

        function checkSmobileAndSusername(){
            var smobile = $("#smobile").val();
            var susername = $("#susername").val();

            if(isNaN(smobile) || smobile == "" || smobile.length != 11)
                return false;
            if(susername == "")
                return false;

            var flag = false;
            $.ajax({
                type:'POST',
                dataType:'json',
                cache: false,
                async:false,
                data:{'susername':$("#susername").val(),'smobile':$("#smobile").val()},
                url:'${ctx}/checkuser.json',
                success:function(data){
                    if(data.success){
                        $("#message").text("");
                        flag = true;
                    }else{
                        $("#message").text(data.msg);
                        flag = false;
                    }
                }
            });
            return flag;
        }
	</script>
</head>

<body>
<div class="nav_logo logo_regi">
	<div class="mycon">
		<div class="logo_reg"><img src="${ctx}/images/logo_findback.png" /></div>
	</div>
</div>
<div class="register">
	<div class="mycon posi">
		<div class="regBox">
			<sys:message content="${message}"></sys:message>
			<h2>验证账户信息</h2>
			<p id="message">${error}</p>
			<div class="form">
				<form id="inputForm" class="form-signin" method="post" action="${ctx}/user/dofindtradepasswd.html">


					<!-- <div class="input_box">
                        <input type="text" name="susername" id="susername" maxlength="11" class="inputs username" placeholder="请输入账户名" />
                        <i class="icon icon-yuangongxinxi"></i>
                    </div> -->
					<input type="hidden" name="users" id="users" value="${users}">

					<div class="input_box">
						<input type="text" name="smobile" id="smobile" maxlength="11" class="inputs " placeholder="请输入11位手机号" />
						<i class="icon icon-yuangongxinxi"></i>

					</div>
					<div class="errorBox"></div>
					<div class="input_box">
						<input type="text" name="scheckword" id="scheckword" maxlength="6" class="inputs  num" placeholder="请输入短信验证码"  />
						<input class="yzm right" value="获取验证码" type="button" id="sendCode" >
						<i class="icon icon-mima"></i>
					</div>

					<input type="button" class="btns" id="btn_reg" value="下一步">
				</form>
				<div class="qustion">
					<p>如果您在找回密码时遇到问题</p>
					<p>请拨打服务热线:4008-8783888</p>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
