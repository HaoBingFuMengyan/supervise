<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>新增系统参数列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	var validateForm;
	$(document).ready(function() {
		focusmenu('系统参数');
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
		<h5>系统参数</h5>
	</div>
	<div class="ibox-content">
	<div class="row">
	<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/parameter/save.shtml" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>参数类型:</label></td>
		         <td><cs:SysParaType name="iparatype" op='select' val='${data.iparatype}' option="class='form-control required'"/></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>参数值:</label></td>
		         <td>
		         	<form:input path="sparametervalue" htmlEscape="false" class="form-control required"/>
		         </td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">参数说明:</label></td>
		         <td colspan="3">
		         <form:textarea path="sremark" htmlEscape="false" rows="3" maxlength="200" class="form-control "/>
		         </td>
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