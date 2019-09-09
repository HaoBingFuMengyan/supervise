<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>
<%@ taglib prefix="ds" uri="http://www.frogsing.com/tags/dispatch" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
	<title>查看定时任务</title>
	<meta name="decorator" content="default"/>
</head>
<body class="fixed-sidebar  gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
	<h5>查看定时任务</h5>
	<div class="ibox-content">
	<div class="row">
		<form:form id="inputForm" modelAttribute="data" action="" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right">定时任务名称:</label></td>
		         <td><input name="sname" value="${data.sname}" class="form-control"/> </td>
		         <td class="active width-15"><label class="pull-right">任务类型:</label></td>
		         <td><input name="itasktype" value="<ds:TaskType val='${data.itasktype}' />" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">计划运行时间:</label></td>
		         <td><input name="dplanexectime" value="<fmt:formatDate value='${data.dplanexectime}' pattern='yyyy-MM-dd HH:mm:ss' />" class="form-control"/> </td>
		         <td class="active width-15"><label class="pull-right">实际运行时间:</label></td>
		         <td><input name="dexectime" value="<fmt:formatDate value='${data.dexectime}' pattern='yyyy-MM-dd HH:mm:ss' />" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">是否完成:</label></td>
		         <td><input name="bisover" value="<consts:BoolType val='${data.bisover}' />" class="form-control"/> </td>
		         <td class="active width-15"><label class="pull-right">是否成功:</label></td>
		         <td><input name="bissuccess" value="<consts:BoolType val='${data.bissuccess}' />" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">是否删除:</label></td>
		         <td><input name="bisdelete" value="<consts:BoolType val='${data.bisdelete}' />" class="form-control"/> </td>
		         <td class="active width-15"><label class="pull-right">是否终止:</label></td>
		         <td><input name="bisfailstop" value="<consts:BoolType val='${data.bisfailstop}' />" class="form-control"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">类名:</label></td>
		         <td colspan="3"><input name="sclsname" value="${data.sclsname}" class="form-control"/> </td>
		      </tr>
		      <tr>
		      	<td class="active width-15"><label class="pull-right">参数:</label></td>
		      	<td colspan="3"><textarea rows="3" name="sparameter" class="form-control">${data.sparameter}</textarea></td>
		      </tr>
		      <tr>
		      	<td class="active width-15"><label class="pull-right">说明:</label></td>
		      	<td colspan="3"><textarea rows="5" name="sparameter" class="form-control">${data.sremark}</textarea></td>
		      </tr>
		   </tbody>
		</table>
		</form:form>
		</div>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>