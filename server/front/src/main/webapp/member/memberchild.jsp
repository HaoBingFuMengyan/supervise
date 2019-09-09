<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>煤亮子</title>
<link href="${ctx}/of/css/member.css" rel="stylesheet" type="text/css">
<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
<script src="${ctx}/js/sendmobile.js" type="text/javascript"></script>
<script>
	$().ready(function(){

		$("#inputForm").validate();
		$("#editForm").validate();
		
		$("#addmem").click(function(){
			//$(".ui-dialog").slideDown(500);
            layer.open({
                type: 2,
                title:'添加子账号',
                area: ["500px", "600px"],
                content: '${ctx}/user/addChild.shtml' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        });

		$("#closed").click(function(){
			$(".ui-dialog").slideUp(500);
		});
		
		$("#editclosed").click(function(){
			$("#edit").slideUp(500);
		});
		
		$("#sendCode").sendCode({
			url:"${ctx}/sendmobilecode.json",
			nodecode:"addMemberChild",
			checkonly:true,//验证手机号是否唯一
			imgcheck:false,//图像验证码
			voice:false,//语音
			checkform:function(){
				return checkSmobile();
			},
			refresh:function(){}
		});
		
	});
	
	function checkSmobile(){
		var smobile = $("#smobile").val();

		if(isNaN(smobile) || smobile == "" || smobile.length != 11)
			return false;
		else
			return true;
	}
	
	function doSubmit(){
//		if($("input[data-sd='add']:checked").length < 1)
//			return;
		$("#inputForm").submit();
	}
	
	function editDoSubmit(){
		if($("input[data-sd='edit']:checked").length < 1)
			return;
		$("#editForm").submit();
	}
	function editMemberChild(susername,sname,smobile,id){
        layer.open({
            type: 2,
            title:'修改子账号',
            area: ["500px", "400px"],
            content: '${ctx}/user/useredit.shtml?id='+id //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
        });
//		$("#edit").slideDown(500);
//		$("#edit-id").val(id);
//		$("#susername").val(susername);
//		$("#edit-sname").val(sname);
//		$("#edit-smobile").val(smobile);
	}
	
	function isDisable(isable,id){
		window.location.href="${ctx}/user/deleteChild.shtml?id="+id+"&isable="+parseInt(isable);
	}
</script>
</head>
<body>
	<div class="tit">职员管理</div>
	<sys:message content="${message}"></sys:message>
	<div class="membernum">您共有<font class="redfont">${count}</font>个子帐号
		<a class="addmem" id="addmem"><font>+</font>添加子帐号</a>
	</div>
	<div class="mem_admin top10">
		<div class="color_bg clearfix">
			<div class="le_wz left">
				<h2>职员管理</h2>
				<p class="privileged top10">多个角色，多层管理</p>
				<span style="position: absolute;width: 0;height: 0;border-width: 8px;border-color: transparent;top: 5px;border-bottom-style: solid;border-bottom-color: #000;"></span>
			</div>
			<div class="rg_mem right">
				<c:forEach items="${userList}" var="user" varStatus="a">
					<div class="mem_list left">
						<p class="m_name">${user.susername}</p>
						<p class="m_icon">
							<img src="${ctx}/images/memberchild.png" />
							<img class="done" src="${ctx}/images/ad_done.png">
						</p>
						<c:if test="${user.bisadmin eq 1}">
							<span class="m_change"></span>
						</c:if>
						<c:if test="${user.bisadmin ne 1}">
							<a onclick="editMemberChild('${user.susername}','${user.sname}','${user.smobile}','${user.id}')" class="m_change">修改</a>
						</c:if>
						
						<p class="m_value top10">角色：
							<c:if test="${user.bisadmin eq 1 }"><span class="red">超级管理员</span></c:if>
							<c:if test="${user.bisadmin ne 1}">
								<c:forEach var="actor" items="${user.actorList}">
									<code>${actor.srolename}</code>
								</c:forEach>
							</c:if>
						</p>
						<p class="m_value">手机：${user.smobile}</p>
						<font class="m_state bluefont">${user.sname}</font>
						<c:if test="${user.bisadmin ne 1 && user.bisvalid eq 1}">
							<p class="m_value">是否禁用：
							<a class="function fun_close" onclick="isDisable(0,'${user.id}')"></a>
							</p>
						</c:if>
						<c:if test="${user.bisadmin ne 1 && user.bisvalid eq 0}">
							<p class="m_value">是否启用：
							<a class="function fun_open" onclick="isDisable(1,'${user.id}')"></a>
							</p>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 新增 子账户-->
	<div class="ui-dialog">
		<div class="ui-dialog-title">
			<span>新增职员</span>
			<a class="closed" id="closed"></a>     
		</div>
		<div class="ui-dialog-content top30">
			<form:form id="inputForm" action="${ctx}/user/addChild.shtml" method="post" modelAttribute="user">
	        	<div class="input_group bottom20">
	            	<label>姓名：</label><form:input type="text" path="sname" class="form_control required" placeholder="请输入姓名" /><font class="icon icon-bitian2 redfont must leftfu"></font>
	            </div>
	            <div class="input_group bottom20">
	            	<label>密码：</label>
					<input type="password" id="spassword" name="spassword" equalTo="#spassword2"  class="form_control required" placeholder="请输入密码" /><font class="icon icon-bitian2 redfont must leftfu"></font>
	            </div>
	            <div class="input_group bottom20">
	            	<label>确认密码：</label><input  id="spassword2" type="password" class="form_control required" placeholder="请再次输入密码" /><font class="icon icon-bitian2 redfont must leftfu"></font>
	            </div>
	            <div class="input_group bottom20">
	            	<label>手机号码：</label><form:input type="text" path="smobile" maxlength="11" class="form_control required" placeholder="请输入手机号码" /><font class="icon icon-bitian2 redfont must leftfu"></font>
	            </div>
	            <!-- <div class="input_group bottom20 diffyzm">
	            	<label>验证码：</label><input type="text" name="scheckword" id="scheckword" required class="form_control" placeholder="请输入手机验证码" />
	            	<input class="yzm" value="获取验证码" type="button" id="sendCode"><font class="icon icon-bitian2 redfont must"></font>
	            </div> -->
	            <div class="input_group bottom20">
	            	<label>角色：</label>
	            	<c:forEach items="${actors}" var="actor">
	            		<span><input type="checkbox" data-sd="add" name="sroleids" value="${actor.id}" data-roletype="${actor.iroletype}"/><code>${actor.srolename}</code></span>
	            	</c:forEach>

	            </div>
	            <div class="input_group bottom20">
	            	<label></label>
					<span>角色为必选项,只有选中角色才能添加子账号</span>
	            </div>
	            <div class="input_group input_group_lg bottom20 top50">
	            	<label></label>
	            	<input onclick="doSubmit()" type="button" class="form_control comfir valid" value="确定" aria-invalid="false">
	            </div>
	        </form:form>
		</div>
	</div>
	<!-- 编辑子账号 -->
	<div class="edit" id="edit">
		<div class="ui-dialog-title">
			<span>编辑职员</span>
			<a class="closed" id="editclosed"></a>     
		</div>
		<div class="ui-dialog-content top30">
			<form id="editForm" action="${ctx}/user/editChild.shtml" method="post">
				<input type="hidden" name="id" id="edit-id" />
				<div class="input_group bottom20">
	            	<label>登录名：</label><input type="text" name="susername" id="susername" class="form_control required" readonly="true" placeholder="请输入姓名" /><font class="icon icon-bitian2 redfont must leftfu"></font>
	            </div>
	            <div class="input_group bottom20">
	            	<label>姓名：</label><input type="text" name="sname" id="edit-sname" class="form_control required" placeholder="请输入密码" /><font class="icon icon-bitian2 redfont must leftfu"></font>
	            </div>
	            <div class="input_group bottom20">
	            	<label>手机：</label><input type="text" name="smobile" id="edit-smobile" class="form_control required" readonly="true" placeholder="请再次输入密码" /><font class="icon icon-bitian2 redfont must leftfu"></font>
	            </div>
	            <div class="input_group bottom20">
	            	<label>角色：</label>
	            	<c:forEach items="${actors}" var="actor">
	            		<span><input type="checkbox" data-sd="edit" name="sroleids" value="${actor.id}" data-roletype="${actor.iroletype}"/><code>${actor.srolename}</code></span>
	            	</c:forEach>
	            	<font class="icon icon-bitian2 redfont must"></font>
	            </div>
	            <div class="input_group bottom20">
	            	<label></label>
					<span>角色为必选项,只有选中角色才能添加子账号</span>
	            </div>
	            <div class="input_group input_group_lg bottom20 top50">
	            	<label></label>
	            	<input onclick="editDoSubmit()" type="button" class="form_control comfir valid" value="确定" aria-invalid="false">
	            </div>
			</form>
		</div>
	</div>
</body>
</html>

