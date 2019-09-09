<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ include file="/include/head.jsp"%>
<html>
<head>
	<title>省份列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	var validateForm;
	$(document).ready(function() {
		focusmenu('省份');
		//$("#no").focus();
		validateForm = $("#inputForm").validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			}
		});
		
		
	});
	</script>
</head>
<body class="fixed-sidebar  gray-bg">
	<sys:message content="${message}"/>
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>省份列表</h5>
	</div>
	<div class="ibox-content">
	<div class="row">
		<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/province/save.shtml" method="post" class="form-horizontal">
		<form:hidden path="id" />
		<input type="hidden" name="scountryid" value="${param_scountryid}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>省份名:</label></td>
		         <td><form:input path="sname" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td class="active width-15"><label class="pull-right">显示顺序:</label></td>
		         <td><input type="number" name="isort" id="isort" value="${data.isort}" class="form-control" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">简拼名</label></td>
		         <td><form:input path="sjpname" htmlEscape="false" maxlength="50" readonly="true" class="form-control"/></td>
		         <td class="active width-15"><label class="pull-right">全拼命:</label></td>
		         <td><form:input path="spyname" htmlEscape="false" maxlength="50" readonly="true" class="form-control"/></td>
		      </tr>
		   </tbody>
		</table>
		</form:form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>