<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="infoconfigdetail" uri="http://www.frogsing.com/tags/message" %>
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
		<sys:message content="${message}"/>
		<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/infoconfigdetail/save.shtml" method="post" class="form-horizontal">
		<form:hidden path="id" />
		<input type="hidden" name="sconfigid" id="sconfigid" value="${param_sconfigid}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
				 <td class="active width-15"><label class="pull-right"><font color="red">*</font>类型:</label></td>
   				 <td><infoconfigdetail:InfoType op="select" option="class='form-control required' style='width:120px;'" name="iinfotype" id="iinfotype" defname="" val="${data.iinfotype}"/></td>
   				 <td class="active width-15" ><label class="pull-right" style=""><font color="red">*</font>是否发送:</label></td>
		        <td>
		        	<label style="font-family: microsoft YaHei;margin-left: 2px;">是</label>
		        	<input type="checkbox" class="check"  name="bissend" id="bissend1" value="1" ${data.bissend == 1 ? 'checked' : ''}/>
		        	<label style="font-family: microsoft YaHei;margin-left: 2px;">否</label>
		        	<input type="checkbox" class="check"  name="bissend" id="bissend0" value="0" ${data.bissend == 0 ? 'checked' : ''}/>
		        </td>
			</tr>
			<tr>
				 <td class="active width-15"><label class="pull-right"><font color="red">*</font>标题:</label></td>
   				 <td><input id="stitlepath" name="stitlepath" class="form-control input-sm required" value="${data.stitlepath}"/></td>
   				 <td class="active width-15"><label class="pull-right"><font color="red">*</font>排序号:</label></td>
   				 <td><input type="number" min="1" id="isort" name="isort" class="form-control input-sm required" value="${data.isort}"/></td>
			</tr>
			<tr>
				<td class="active width-15"><label class="pull-right">模板:</label></td>
   				<td colspan="3"><textarea class="form-control" id="stemplatepath" name="stemplatepath" style="width:100%;" rows="3" maxlength="200">${data.stemplatepath}</textarea></td>
			</tr>
		   </tbody>
		</table>
	</form:form>
</body>
</html>