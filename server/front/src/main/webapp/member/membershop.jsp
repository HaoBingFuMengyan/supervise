<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="基金协同监管系统沟通,基金协同监管系统沟通"/>
    <meta name="description" content="基金协同监管系统沟通(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <title>会员开通店铺</title>
    <style>
        .layui-form-item .layui-input-inline {
            width: 270px;
        }

        .layui-textarea {
            width: 89%;
        }

        .layui-input-sm {
            height: 30px;
        }

        .red {
            color: #FF0000;
            font-weight: 800;
        }
    </style>
    <script type="text/javascript">
        var index = 0;
        //日期
        layui.use(['layer', 'laydate', 'upload', 'form', 'element'], function () {
            var laydate = layui.laydate;
            layer = layui.layer;
            var layupload = layui.upload;

            //拖拽上传
            layupload.render({
                elem: '#fileUp'
                , url: '${ctx}/file/uploadfile.json'
                , accept: 'file'
                , multiple: true
                , auto: true
                , field: "upfile"
                , data: {path: '/memberShop'}
                , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    layer.load(1); //上传loading
                }
                , allDone: function (obj) {
                    layer.closeAll('loading'); //关闭loadin
                }
                , done: function (res, index, upload) {
                    if (res.state == "SUCCESS") { //上传成功
                        $("#fileUp").empty();
                        $("#fileUp").append('<input type="hidden" name="slogo" value="'+res.url+'" /><img width="250" height="100" class="shop-logo" src="'+res.url+'">');
                    } else {
                        layer.msg(res.original + "上传失败，失败原因：" + res.state);
                        this.error(index, upload);
                    }
                }
            });
        });


        jj.validate();
    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <div class="layui-tab layui-tab-card">
        <div class="layui-tab-content" style="height: 100%;">
            <div id="projectInfo" class="layui-tab-item layui-show">

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>店铺信息</legend>
                </fieldset>
                <form:form modelAttribute="data" class="layui-form" action="${ctx}/hy/membershopapply/open.shtml"
                           enctype="multipart/form-data"
                           method="post" id="formx" onkeydown="if(event.keyCode==13) return false;" autocomplete="on">

                    <input type="hidden" name="id" value="${data.id}" />
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">联系人<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <form:input type="text" path="slinkname" class="layui-input required"
                                            autocomplete="off"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">联系电话<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <form:input type="text" path="slinkmobile" class="layui-input required" maxlength="11"
                                            autocomplete="off"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" style="width:auto;">
                            <label class="layui-form-label">主营</label>
                            <div class="layui-input-inline" style="width:780px;">
                                <form:input type="text" path="sbusiness" class="layui-input" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <c:if test="${data.istatus == 21}">
                        <div class="layui-form-item">
                            <div class="layui-inline" style="width:auto;">
                                <label class="layui-form-label">审核意见</label>
                                <div class="layui-input-inline" style="width:780px;">
                                    <input type="text" value="${data.scheckmark}" readonly class="layui-input" autocomplete="off"/>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </form:form>
            </div>

        </div>

    </div>

</div>

</body>
</html>