<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<title>煤亮子</title>
<link href="${ctx}/of/css/member.css" rel="stylesheet" type="text/css">
	<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
<script src="${ctx}/js/sendmobile.js" type="text/javascript"></script>
<style>
	.comfir {
		border: none;
		background: #ff0000;
		color: #fff;
		text-align: center;
		cursor: pointer;
	}
</style>
<script>
	$().ready(function(){

		$("#inputForm").validate();
		$("#editForm").validate();



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
		{
		    layer.tips("请选择角色",'#sroleid');
            return;
		}
		$("#editForm").submit();
	}
	function editMemberChild(susername,sname,smobile,id){
		$("#edit").slideDown(500);
		$("#edit-id").val(id);
		$("#susername").val(susername);
		$("#edit-sname").val(sname);
		$("#edit-smobile").val(smobile);
	}

	function isDisable(isable,id){
		window.location.href="${ctx}/user/deleteChild.shtml?id="+id+"&isable="+parseInt(isable);
	}
</script>
</head>
<body style="height: 500px;">
<div class="tit">账号设置</div>
	<sys:message content="${message}"></sys:message>
		<div class="ui-dialog-content top30" style="width: 726px;">
			 <form:form id="inputForm" action="${ctx}/user/userinfo.shtml" method="post" modelAttribute="user" class="layui-form">
				 <div class="input_group input_group_lg bottom20 left120">
					 <label>姓名<font class="icon icon-bitian2 redfont must leftfu"></font>：</label>
					 <form:input type="text"  path="sname" class="form_control required" placeholder="请输入姓名" />
				 </div>
				 <div class="input_group input_group_lg bottom20 left120">
					 <label>手机号码<font class="icon icon-bitian2 redfont must leftfu"></font>：</label>
					 <form:input type="text"  readonly="true" path="smobile" maxlength="11"  class="form_control" placeholder="请输入手机号码" />
				 </div>
				 <div class="input_group input_group_lg bottom20 left120">
					 <label>QQ：</label>
					 <form:input type="text"  path="sqq"  class="form_control" placeholder="请输入QQ" />
				 </div>
				 <div class="input_group input_group_lg bottom20 left120">
					 <label>邮箱：</label>
					 <form:input type="text"  path="semail"  class="form_control email" placeholder="请输入邮箱" />
				 </div>
				 <div class="input_group input_group_lg bottom20 left120">
					 <label>备注：</label>
					 <form:input type="text"  path="sremark"  class="form_control" placeholder="请输入备注" />
				 </div>
	            <%--<div class="layui-form-item"">--%>
	            	<%--<label class="layui-form-label">角色<font class="icon icon-bitian2 redfont must leftfu"></font>：</label>--%>
					<%--<div class="layui-input-inline" id="sroleid">--%>
	            	<%--<c:forEach items="${actors}" var="actor">--%>
	            		<%--<span><input type="checkbox" data-sd="add" name="sroleids" value="${actor.id}" data-roletype="${actor.iroletype}"/><code>${actor.srolename}</code></span>--%>
	            	<%--</c:forEach>--%>
					<%--</div>--%>
	            <%--</div>--%>
	            <%--<div class="layui-form-item"">--%>
	            	<%--<label class="layui-form-label"></label>--%>
					<%--<span>角色为必选项,只有选中角色才能添加子账号</span>--%>
	            <%--</div>--%>
				 <div class="input_group input_group_lg bottom20 left120 top50">
					 <label></label>
					 <button  onclick="doSubmit()" type="button" class="form_control comfir" lay-submit="" lay-filter="demo1">立即提交</button>
				 </div>
	         </form:form>

			<script src="${ctxStatic}/layui-v2.4.2/layui/layui.js"></script>
			<script type="text/javascript">
                layui.use(['layer', 'form'], function(){
                    var layer = layui.layer
                        ,form = layui.form;
                });
			</script>
		</div>
</body>
</html>

