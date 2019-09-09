<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会员店铺基本信息</title>
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
                <form:form modelAttribute="obj" class="layui-form" action="${ctx}/hy/membershopapply/open.shtml"
                           enctype="multipart/form-data"
                           method="post" id="formx" onkeydown="if(event.keyCode==13) return false;" autocomplete="on">

                    <input type="hidden" name="id" value="${obj.id}" />
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
                            <div class="layui-input-inline" style="width:728px;">
                                <form:input type="text" path="sbusiness" class="layui-input" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <c:if test="${obj.istatus == 21}">
                        <div class="layui-form-item">
                            <div class="layui-inline" style="width:auto;">
                                <label class="layui-form-label">审核意见</label>
                                <div class="layui-input-inline" style="width:728px;">
                                    <input type="text" value="${obj.scheckmark}" readonly class="layui-input" autocomplete="off"/>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div class="layui-form-item layui-form-text" style="margin-top: 10px">
                        <button class="layui-btn layui-btn-fluid">开通店铺</button>
                    </div>
                </form:form>
            </div>

        </div>

    </div>

</div>

</body>
</html>