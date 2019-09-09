<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>编辑短信节点列表</title>
	<style>
	   .check{
	   width:17px;
	   height:17px;
	   border-radius:0px!important;
	   }
	</style>
	<script type="text/javascript">
	var validateForm;
	$(document).ready(function() {
		//$("#no").focus();
		validateForm = $("#inputForm").validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			}
		});
		
		$("input[type=checkbox]").click(function (){
			$(this).attr('checked','checked').siblings().removeAttr("checked");
		});
	});
	
	</script>
</head>
<body class="hideScroll">
		<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/infoconfig/save.shtml" method="post" class="form-horizontal">
		<form:hidden path="id" />
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>编号:</label></td>
		         <td><form:input path="ssendno" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>名称:</label></td>
		         <td><form:input path="sname" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15" ><label class="pull-right" style="width:90px;">是否系统节点:</label></td>
		         <td>
		         	<label style="font-family: microsoft YaHei;margin-left: 2px;">是</label>
		         	<input type="checkbox" class="check"  name="bissysbranch" value="1" ${data.bissysbranch == 1 ? 'checked' : ''} />
		         	<label style="font-family: microsoft YaHei;margin-left: 2px;">否</label>
		         	<input type="checkbox" class="check"  name="bissysbranch" value="0" ${data.bissysbranch == 0 ? 'checked' : ''} />
		         </td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">备注:</label></td>
		         <td>
		         <form:textarea path="sremark" htmlEscape="false" rows="3" maxlength="200" class="form-control "/>
		         </td>
		      </tr>
		   </tbody>
		</table>
	</form:form>
</body>
</html>