<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ include file="/include/head.jsp"%>
<html>
<head>
	<title>城市列表</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" href="${ctxStatic}/common/jquery.searchableSelect.css" />
	<script src="${ctxStatic}/common/jquery.searchableSelect.js"></script> 
	<script type="text/javascript">
	$(function(){
		$('select').searchableSelect();
	});
	var validateForm;
	$(document).ready(function() {
		focusmenu('城市');
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
		<h5>城市列表</h5>
	</div>
	<div class="ibox-content">
	<div class="row">
		<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/city/save.shtml" method="post" class="form-horizontal">
		<form:hidden path="id" />
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>国家:</label></td>
		         <td>
		         	<select name="scountryid" class="form-horizontal">
		         		<option value=""></option>
		         		<c:forEach items="${countryList}" var="country">
		         			<option value="${country.id}" ${country.sname == '中国' ? 'selected' : ''}>${country.sname}</option>
		         		</c:forEach> 
		         	</select>
		         </td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>省份:</label></td>
		         <td>
		         	<select name="sprovinceid" class="form-horizontal">
		         		<option value=""></option>
		         		<c:forEach items="${provinceList}" var="province">
		         			<option value="${province.id}" ${province.id == data.sprovinceid ? 'selected' : ''}>${province.sname}</option>
		         		</c:forEach> 
		         	</select>
		         </td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>城市名</label></td>
		         <td><form:input path="sname" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>区号:</label></td>
		         <td><form:input path="sareacode" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>是否省会</label></td>
		         <td>
		         	<select name="bisprovincecity" class="form-control required">
		         		<option value="1" ${data.bisprovincecity == 1 ? 'selected' : ''}>是</option>
		         		<option value="0" ${data.bisprovincecity == 0 ? 'selected' : ''}>否</option>
		         	</select>
		         </td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>是否常用</label></td>
		         <td>
		         	<select name="biscommon" class="form-control required">
		         		<option value="1" ${data.biscommon == 1 ? 'selected' : ''}>是</option>
		         		<option value="0" ${data.biscommon == 0 ? 'selected' : ''}>否</option>
		         	</select>
		         </td>
		      </tr>
		       <tr>
		         <td class="active width-15"><label class="pull-right">显示顺序</label></td>
		         <td><input type="number" name="isort" id="isort" value="${data.isort}" class="form-control" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" /> </td>
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