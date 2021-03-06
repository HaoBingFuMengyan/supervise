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
            $("#soutlink").click(function(){
            	if($("#soutlink").is(":checked"))
            		$("#bisoutlink").val(1);
            	else
            		$("#bisoutlink").val(0);
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
					<h3>布局详情</h3>
				</div>
				<div class="ibox-content">
					<sys:message content="${message}"/>

					<form id="inputForm"  action="${ctx}/dt/layoutdetail/save.shtml"  method="post" class="form-horizontal form-group" >
						<input type="hidden" name="id" value="${lyd.id}" />
						<input type="hidden" name="slayoutid" value="${lyd.slayoutid}" />
						<input type="hidden" id="bisoutlink" name="bisoutlink" value="${lyd.bisoutlink}" />
						<div class="control-group">
							<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
								<tbody>

								<tr>
									<td class="active width-15"><label class="pull-right">序号:<font color="red">*</font></label></td>
									<td><input name="sno" value="${lyd.sno}"  maxlength="20" class="form-control required"  /></td>
									<td class="active width-15"><label class="pull-right">名称:<font color="red">*</font></label></td>
									<td><input name="sdetailname" value="${lyd.sdetailname}"  maxlength="20" class="form-control required"  /></td>
									
								</tr>

								<tr>
									<td class="active width-15"><label class="pull-right">是否外站链接:</label></td>
									<td><input type="checkbox" id="soutlink" <c:if test='${lyd.bisoutlink eq 1 }'>checked="checked"</c:if>   /> </td>
									<td class="active width-15"><label class="pull-right">链接地址:</label></td>
									<td ><input name="surl" value="${lyd.surl }"  maxlength="500" class="form-control"/></td>
								</tr>
								<tr>
									<td class="active width-15"><label class="pull-right">描述:</label></td>
									<td colspan="3"><textarea rows="2" cols="3" maxlength="50" name="sremark" class="form-control" >${lyd.sremark }</textarea></td>
								</tr>
								</tbody>
							</table>
						</div>

					</form>



				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>