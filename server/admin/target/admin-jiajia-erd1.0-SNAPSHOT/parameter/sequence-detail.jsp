<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>单据编号列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	var validateForm;
	$(document).ready(function() {
		focusmenu('单据编号');
		//$("#no").focus();
		validateForm = $("#inputForm").validate({
			rules:{
				//scode:{remote:"${ctx}/sys/sequence/checkScode.shtml?oldScode="+encodeURIComponent('${data.scode}')}//设置了远程验证，在初始化时必须预先调用一次。
			},
			messages:{
				scode:{remote:"代码已经存在"}
			},
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			}
		});
	});
	</script>
</head>
<body class="fixed-sidebar  gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>单据编号列表</h5>
	</div>
	<div class="ibox-content">
	<sys:message content="${message}"/>
	<div class="row">
		<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/sequence/save.shtml" method="post" class="form-horizontal">
		<c:if test="${param_copy == null || param_copy == ''}">
			<form:hidden path="id" />
		</c:if>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>名称</label></td>
		         <td><form:input path="sobjectname" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>代码:</label></td>
		         <td><form:input path="scode" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>格式：</label></td>
		         <td><form:input path="sfromat" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>起始编号:</label></td>
		         <td><input type="number" name="istartno" id="istartno" value="${data.istartno}" class="form-control required" min="1" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>增长阶梯：</label></td>
		         <td><input type="number" name="iincrement" id="iincrement" value="${data.iincrement}" class="form-control required" min="1" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>当前序号:</label></td>
		         <td><input type="number" name="icurrentno" id="icurrentno" value="${data.icurrentno}" class="form-control required" min="1" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">前缀：</label></td>
		         <td><form:input path="sprefix" htmlEscape="false" maxlength="50" class="form-control"/></td>
		         <td class="active width-15"><label class="pull-right">后缀:</label></td>
		         <td><form:input path="ssuffix" htmlEscape="false" maxlength="50" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">是否循环：</label></td>
		         <td>
		         	<select name="biscycle" class="form-control">
		         		<option value="1" ${data.biscycle == 1 ? 'selected' : ''}>是</option>
		         		<option value="0" ${data.biscycle == 0 ? 'selected' : ''}>否</option>
		         	</select>
		         </td>
		         <td class="active width-15"><label class="pull-right">是否清零：</label></td>
		         <td>
		         	<select name="bisreset" class="form-control">
		         		<option value="1" ${data.bisreset == 1 ? 'selected' : ''}>是</option>
		         		<option value="0" ${data.bisreset == 0 ? 'selected' : ''}>否</option>
		         	</select>
		         </td>
		      </tr>
		       <tr>
		         <td class="active width-15"><label class="pull-right">备注：</label></td>
		         <td colspan="3">
		         	<form:textarea path="sremark" htmlEscape="false" maxlength="200" rows="3" class="form-control"/>
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