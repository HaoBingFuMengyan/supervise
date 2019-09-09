<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/ueditor/ueditor.all.js"> </script>
	<script type="text/javascript">
        $("docunment").ready(function(){
            var validateForm = $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    $("#scontentid").val(ue1.getContent());
                    //$("#stitleimageid").val(ue2.getContent());
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
            var ue1=UE.getEditor('editor',{UEDITOR_HOME_URL:'${ctx}/static/ueditor/',lang:'zh-cn',serverUrl:'${ctx}/file/upload.json'});

           // var ue2=UE.getEditor('stitleimage',{UEDITOR_HOME_URL:'${ctx}/static/ueditor/',lang:'zh-cn',serverUrl:'${ctx}/file/upload.json',toolbars:[['fullscreen','source','|', 'undo', 'redo', '|','simpleupload','help']]});

        });


	</script>
</head>
<body>

<div class="wrapper wrapper-content animated fadeIn">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h3>详情</h3>
				</div>
				<div class="ibox-content">
					<sys:message content="${message}"/>

					<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/article/dosave.shtml"  method="post" enctype="multipart/form-data" class="form-horizontal form-group" >
						<form:hidden path="id"/>
						<input type="hidden" name="snavigationid" value="${data.snavigationid}"/>
						<!--<input type="hidden" name="stitleimage" id="stitleimageid" value=""/>-->
						<input type="hidden" name="scontent" id="scontentid" value=""/>
						<div class="control-group">
							<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
								<tbody>

								<tr>
									<td class="active width-15"><label class="pull-right">标题:<font color="red">*</font></label></td>
									<td><input name="stitle" value="${data.stitle}"  maxlength="50" class="form-control required" /></td>
									<td class="active width-15"><label class="pull-right">标题缩略图:<font color="red">*</font></label></td>
									<!--<td rowspan="5" style="width:35%;"><textarea style="height:150px;width:100%;" id="stitleimage" >
									<img alt="" src="${data.stitleimage}" />
									</textarea>--><td>
									<input type="file" name="upfile" value="" /></td>
									
								</tr>
								<tr>
									<td class="active width-15"><label class="pull-right">摘要:</label></td>
									<td><form:input path="sabstract"  maxlength="200" class="form-control"/></td>
									<td class="active width-15"><label class="pull-right">来源:</label></td>
									<td><input name="sresourcename" value="${data.sresourcename}"  maxlength="20" class="form-control" /></td>
								</tr>
								<tr>
									<td class="active width-15"><label class="pull-right">来源地址:</label></td>
									<td><input name="sresourceurl" value="${data.sresourceurl}"  maxlength="20" class="form-control" /></td>
									<td class="active width-15"><label class="pull-right">描述:</label></td>
									<td><form:input path="sdes"  maxlength="20" class="form-control"/></td>

								</tr>
								<tr>
									<td class="active width-15"><label class="pull-right">提示:</label></td>
									<td><form:input path="salt"  maxlength="20" class="form-control"/></td>
									<td class="active width-15"><label class="pull-right">关键字:</label></td>
									<td><form:input path="st"  maxlength="20" class="form-control"/></td>
								</tr>
								<tr>
									<td class="active width-15"><label class="pull-right">标签:</label></td>
									<td><form:input path="stag"  maxlength="20" class="form-control"/></td>
								</tr>
									<td class="active width-15"><label class="pull-right">内容:</label></td>
									<td colspan="3"><textarea id="editor" style="width:1024px;height:500px;">${data.ac.bcontent}</textarea></td>
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