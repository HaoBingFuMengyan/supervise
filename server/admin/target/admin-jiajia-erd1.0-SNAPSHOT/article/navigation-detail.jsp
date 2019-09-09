<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title></title>
	<script type="text/javascript">
        $("docunment").ready(function(){
            var validateForm = $("#inputForm").validate({
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
<body>

<div class="wrapper wrapper-content animated fadeIn">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h3>栏目信息</h3>
				</div>
				<div class="ibox-content">

					<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/navigation/save.shtml"  method="post" class="form-horizontal form-group" >
						<form:hidden path="id"/>
						<input type="hidden" name="sparentid" value="${data.sparentid}"/>
						<div class="control-group">
							<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
								<tbody>

								<tr>
									<td class="active width-15"><label class="pull-right">栏目编号:<font color="red">*</font></label></td>
									<td ><input name="scode" value="${data.scode}"  maxlength="20" class="form-control required" /></td>
									<td class="active width-15"><label class="pull-right">栏目名称:<font color="red">*</font></label></td>
									<td ><input name="sname" value="${data.sname}"  maxlength="20" class="form-control required" /></td>
								</tr>

								<tr>
									<td class="active width-15"><label class="pull-right">排序:</label></td>
									<td><form:input path="isort"  maxlength="20" class="form-control"/></td>
									<td class="active width-15"><label class="pull-right">是否单页:</label></td>
									<td>
										<form:select path="bisdefault"  class="form-control required">
											<form:option value="0" label="否"/>
											<form:option value="1" label="是"/>
										</form:select>
									</td>
								</tr>

								<tr>
									<td class="active width-15"><label class="pull-right">栏目内容:</label></td>
									<td colspan="3"><form:textarea path="sremark"  rows="3" maxlength="200" class="form-control"/></td>
								</tr>
								</tbody>
							</table>
						</div>

					</form:form>



				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>