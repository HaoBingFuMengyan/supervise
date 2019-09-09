<html>
<head>
	<title>新增周期任务</title>
	<script type="text/javascript">
	var validateForm;
	$(document).ready(function() {
		validateForm = $("#inputForm").validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			}
		});
		laydate({
            elem: '#dplanexectime', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            event: 'focus', //响应事件。如果没有传入event，则按照默认的click
            format: 'YYYY-MM-DD hh:mm:ss',
            istime: true
        });
		
		$("#itasktype").change(function (){
			if($(this).val() == 1000)
				$("#sclsname").attr('class','form-control required');
			else
				$("#sclsname").attr('class','form-control');
		});
	});
	</script>
</head>
<body class="hideScroll">
		<sys:message content="${message}"/>
		<div class="ibox-title">
			<h3>定时任务管理</h3>
		</div>
		<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/periodjob/save.shtml" method="post" class="form-horizontal" >
		<form:hidden path="id"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>定时任务编号:</label></td>
		         <td><form:input path="sjobno" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>定时任务名称:</label></td>
		         <td><form:input path="sname" htmlEscape="false" maxlength="50" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>任务类型:</label></td>
		         <td><ds:PeriodTaskType op="select" name="itasktype" id="itasktype" val="${data.itasktype}" option="class='required form-control'"/></td>
		      	 <td class="active width-15"><label class="pull-right">类名:</label></td>
		         <td>
		         	<form:input path="sclsname" placeholder="如:com.frogsing.task.TaskSendMemberMsg(包名+类名)" htmlEscape="false" maxlength="100"  class="form-control"/>
		         	<label id="sclsname-error" class="error" for="sclsname">&nbsp;&nbsp;如果任务类型选择类运行器，类名为必填</label>
		         </td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>周期类型:</label></td>
		         <td><ds:PeriodType op="select" name="iperiodtype" id="iperiodtype" val="${data.iperiodtype}" option="class='form-control required'"/></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>周期:</label></td>
		         <td><input type="number" id="iperiod" name="iperiod" value="${data.iperiod}" min="1" class="form-control required" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/></td>
		      </tr>
		      <tr>
		      	<td class="active width-15"><label class="pull-right"><font color="red">*</font>计划运行时间:</label></td>
		         <td class="width-35">
					<input id="dplanexectime" name="dplanexectime" type="text" maxlength="20" class="laydate-icon form-control layer-date required"
						value="<fmt:formatDate value="${data.dplanexectime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
				</td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>是否禁用:</label></td>
		         <td>
		         	<select class="form-control required" name="bisforbidden">
						<option value="1" ${data.bisforbidden == 1 ? 'selected' : ''}>是</option>
						<option value="0" ${data.bisforbidden == 0 ? 'selected' : ''}>否</option>
		         	</select> 
		         </td>
		      </tr>
		      <tr>
		      	 <td class="active width-15"><label class="pull-right"><font color="red">*</font>是否删除:</label></td>
		         <td>
		         	<select class="form-control required" name="bisdelete">
						<option value="1" ${data.bisdelete == 1 ? 'selected' : ''}>是</option>
						<option value="0" ${data.bisdelete == 0 ? 'selected' : ''}>否</option>
		         	</select> 
		         </td> 
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>是否失败终止:</label></td>
		         <td>
		         	<select class="form-control required" name="bisfailstop">
						<option value="1" ${data.bisfailstop == 1 ? 'selected' : ''}>是</option>
						<option value="0" ${data.bisfailstop == 0 ? 'selected' : ''}>否</option>
		         	</select> 
		         </td>
		      </tr>
		      <tr>
		         <td class="active width-15"><label class="pull-right">描述:</label></td>
		         <td colspan="3">
		         <form:textarea path="sremark" htmlEscape="false" rows="3" maxlength="200" class="form-control "/>
		         </td>
		      </tr>
		   </tbody>
		</table>
	</form:form>
</body>
</html>