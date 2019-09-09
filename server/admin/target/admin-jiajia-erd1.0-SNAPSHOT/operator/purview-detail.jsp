<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>权限码管理</title>
	<%@include file="/include/head.jsp" %>
	<!-- <meta name="decorator" content="default"/> -->
	<script type="text/javascript">
		//var validateForm;

		
		// $(document).ready(function() {
		// 	$("#spurname").focus();
		// 	validateForm = $("#inputForm").validate({
		// 		submitHandler: function(form){
		// 			loading('正在提交，请稍等...');
		// 			form.submit();
		// 		},
		// 		errorContainer: "#messageBox",
		// 		errorPlacement: function(error, element) {
		// 			$("#messageBox").text("输入有误，请先更正。");
		// 			if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
		// 				error.appendTo(element.parent().parent());
		// 			} else {
		// 				error.insertAfter(element);
		// 			}
		// 		}
		// 	});
		// });

        jj.validate();

		
	</script>
	
</head>
<body>
	<form:form id="inputForm" modelAttribute="data" action="save.json"  method="post" class="form-horizontal form-group">
		<form:hidden path="id"/>
		<div class="control-group">
			<label class="col-sm-3 control-label">上级菜单:</label>
			<div class="controls" style="width: 500px;">
				<sys:treeselect id="menu" name="sparentid" value="${data.sparentid}"
								labelName="sparentname"
								labelValue="${data.sparentname}"
								title="菜单" url="/jj/menu/treeData.shtml" extId="${data.id}"
								cssClass="form-control required"/>
			</div>

		</div>

		<div class="control-group">
			<label class="col-sm-3 control-label">权限名称:</label>
			<div class="controls">
				<form:input path="spurname" htmlEscape="false" maxlength="150" class="form-control  max-width-500 required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="col-sm-3 control-label">权限路径:</label>
			<div class="controls">
				<form:input path="surlpath" htmlEscape="false" maxlength="250" class="form-control  required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="col-sm-3 control-label">备注:</label>
			<div class="controls">
				<form:textarea path="sdescription" htmlEscape="false" rows="3" maxlength="200" class="form-control  max-width-250 "/>
			</div>
		</div>
		
		
	</form:form>
</body>
</html>