<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>
	<script src="${ctx}/jj/jquery-1.11.1.min.js"  type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/jquery.validate.min.js?v=6" type="text/javascript"></script>

	<script src="${ctxStatic}/jquery-validation/1.14.0/localization/messages_zh.min.js?v=1" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/add.js?v=1" type="text/javascript"></script>


	<script src="${ctx}/jj/jj.js"  type="text/javascript"></script>
	<link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/jj/jj.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${ctx}/static/bigautocomplete/jquery.bigautocomplete.css" type="text/css" />
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
            $("#bisenabledid").click(function(){
            	if($("#bisenabledid").is(":checked"))
            		$("#bisenabled").val(1);
            	else
            		$("#bisenabled").val(0);
            });

            layui.use('upload', function(){
                //执行实例
                var uploadInst = layui.upload.render({
                    elem: '#imgfile' //绑定元素
                    ,url: '${ctx}/file/pubimg.json' //上传接口
                    ,accept:'images'
                    ,auto:true
                    ,field:'imgfile'
                    ,done: function(res){
                        if (res.state == "SUCCESS"){
                            $("#imgpic").attr("src",'<cs:SysParaType imgurl="1" op="syspara"/>'+res.url);
                            $("#sdetailimg").val(res.url);
                        }else{
                            showTip(res.state);
                        }
                    }
                    ,error: function(){
                        //请求异常回调
                        showTip("图片上传失败");
                    }
                });
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

					<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/layout/save.shtml"  method="post" class="form-horizontal form-group" >
						<form:hidden path="id"/>
						<input type="hidden" id="bisenabled" name="bisenabled" value="${data.bisenabled}" />
						<div class="control-group">
							<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
								<tbody>
									<tr>
										<td class="active width-15"><label class="pull-right">编号<font color="red">*</font>:</label></td>
										<td ><form:input path="scode"   maxlength="20" class="form-control required"  /></td>
										<td class="active width-15"><label class="pull-right">名称:<font color="red">*</font></label></td>
										<td><form:input path="sname"   maxlength="20" class="form-control required"  /></td>
									</tr>
									<tr>
										<td class="active width-15"><label class="pull-right">序号:</label></td>
										<td><form:input path="isort"   maxlength="20" class="form-control"/></td>

											<td class="active width-15"><label class="pull-right">是否启用:</label></td>
										<td><input type="checkbox" id="bisenabledid" <c:if test='${data.bisenabled eq 1 }'>checked="checked"</c:if>   /> </td>
									</tr>

									<tr>
									<td class="active width-15"><label class="pull-right">布局类型:</label></td>
									<td><layout:LayoutPosition name="iposition" op="select" defval="${data.iposition}"   val="${data.iposition}" option="class='form-control required'" ></layout:LayoutPosition> </td>
									<td class="active width-15"><label class="pull-right">关联类型:</label></td>
									<td ><layout:LayoutReleaseType name="ireleasetype" op="select" defval="${data.ireleasetype}" val="${data.ireleasetype}" option="class='form-control required'" ></layout:LayoutReleaseType></td>
								</tr>

									<tr>
										<td class="active width-15"><label class="pull-right">终端类型:</label></td>
										<td><layout:LayoutTerminalType name="iterminal" op="select"  val="${data.iterminal}" option="class='form-control required'" ></layout:LayoutTerminalType> </td>
										<td class="active width-15"><label class="pull-right">图片:</label></td>
										<td >
											<button type="button" class="layui-btn" id="imgfile">
												<i class="layui-icon">&#xe67c;</i>上传图片
											</button>
											<input id="sdetailimg" type="hidden" name="attr.simgurl" value="${data.attr.simgurl}"/>
											<img id="imgpic" alt="" src="<cs:SysParaType imgurl="1" op="syspara"/>/${data.attr.simgurl}" width="50" height="50"/>
										</td>
								</tr>
									<tr>
									<td class="active width-15"><label class="pull-right">描述:</label></td>
									<td colspan="3"><form:input path="sdes"  maxlength="20"  class="form-control"/></td>
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