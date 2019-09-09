<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<script type="text/javascript" charset="utf-8" src="${ctx}/static/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${ctx}/static/ueditor/ueditor.all.js"> </script>
	<script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>
	<script src="${ctx}/jj/jquery-1.11.1.min.js"  type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/jquery.validate.min.js?v=6" type="text/javascript"></script>

	<script src="${ctxStatic}/jquery-validation/1.14.0/localization/messages_zh.min.js?v=1" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.14.0/add.js?v=1" type="text/javascript"></script>


	<script src="${ctx}/jj/jj.js"  type="text/javascript"></script>
	<link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/jj/jj.css" type="text/css" rel="stylesheet" />
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

					<form:form id="inputForm"  action="${ctx}/dt/layoutdetail/commoditysave.shtml"  method="post" class="form-horizontal form-group" >
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
									<td class="active width-15"><label class="pull-right">品种:</label></td>
									<td><sys:treeselect id="srelasecode" name="srelaseid" value="${lyd.srelaseid}"
																	labelName="srelasename"
																	labelValue="${lyd.srelasename}"
																	title="商品分类" url="/dt/commodity/treeData.shtml"
																	cssClass="form-control required"/></td>
									<td class="active width-15"><label class="pull-right">显示条数:</label></td>
									<td><input name="ilimit" value="${lyd.ilimit}"  maxlength="20" class="form-control numeric"  /></td>
								</tr>
								<tr>
									<td class="active width-15"><label class="pull-right">图片:<font color="red">*</font></label></td>
									<td >
										<button type="button" class="layui-btn" id="imgfile">
											<i class="layui-icon">&#xe67c;</i>上传图片
										</button>
										<input id="sdetailimg" type="hidden" name="sdetailimg" value="${lyd.sdetailimg}"/>
										<img id="imgpic" alt="" src="<cs:SysParaType imgurl="1" op="syspara"/>/${lyd.sdetailimg}" width="50" height="50"/>
									</td>
									<td class="active width-15"><label class="pull-right">图片宽高:</label></td>
									<td><input name="iimgwidth" value="${lyd.iimgwidth}" class="form-control max-width-100" />&nbsp;*&nbsp;<input name="iimgheight" value="${lyd.iimgheight}" class="form-control max-width-100" /></td>
								</tr>


								<%--<tr>
									<td class="active width-15"><label class="pull-right">链接地址:</label></td>
									<td ><input name="surl" value="${lyd.surl }"  maxlength="20" class="form-control"/></td>

									<td><label>是否外站链接:<input type="checkbox" id="soutlink" <c:if test='${lyd.bisoutlink eq 1 }'>checked="checked"</c:if>   /> </label></td>
								</tr>--%>
								<tr>
									<td class="active width-15"><label class="pull-right">描述:</label></td>
									<td colspan="3"><textarea rows="2" maxlength="50" name="sremark" class="form-control" >${lyd.sremark}</textarea></td>
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