<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/include/treeview.jsp" %>
	<script type="text/javascript">
	 	var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  loading('正在提交，请稍等...');
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function(){
			focusmenu('角色管理');
			$("#srolename").focus();
			
			validateForm= $("#inputForm").validate({
				rules: {
					name: {remote: "${ctx}/sys/role/checkName?oldName=" + encodeURIComponent("${role.srolename}")}//设置了远程验证，在初始化时必须预先调用一次。
				},
				messages: {
					name: {remote: "角色名已存在"}
				},
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
		});

	</script>
</head>
<body class="">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-content">
	<div class="row">
	<form:form id="inputForm" modelAttribute="role" action="${ctx}/sys/role/save"  method="post" class="form-horizontal form-group">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
		</div>
		<div class="control-group">
			<label class="col-sm-3 control-label"><font color="red">*</font>角色名称:</label>
			<div class="controls">
				<form:input path="srolename" htmlEscape="false" maxlength="50"  class="form-control  max-width-250 required" />
			</div>
		</div>
		
		<div class="control-group">
			<label class="col-sm-3 control-label">角色说明:</label>
			<div class="controls">
				<form:textarea path="sremark" htmlEscape="false" rows="3" maxlength="200" class="form-control  max-width-250 "/>
			</div>
		</div>
	</form:form>
		</div>
	</div>
	<%-- <div class="layui-layer-btn">
		<c:if test="${empty param.view}">
			<a class="layui-layer-btn0" onclick="doSubmit()">保存</a>
		</c:if>
		<a class="layui-layer-btn1" href="${ctx}/sys/role/list.shtml">返回</a>
	</div> --%>
	</div>
	</div>
	
</body>
</html>