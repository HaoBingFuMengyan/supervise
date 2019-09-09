<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <title>店铺产品分类</title>
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
        .down{
            cursor: pointer;
        }
        .onlyRead{
            background: #f8f8f8;
        }
        .operatorwidth{
            width:652px !important;
        }
    </style>
    <script type="text/javascript">
        var index = 0;
        var indetureIds = [],stockIds = [];
        //日期
        layui.use(['layer', 'laydate', 'upload', 'form', 'element'], function () {
            var laydate = layui.laydate;
            layer = layui.layer;
            var layupload = layui.upload;
        });

        $(document).ready(function () {
            getRelaresource();
        });

        jj.validate();

        //关联仓单
        function relaIndenture() {
            top.layer.open({
                type: 2,
                area: ['550px', '550px'],
                title:"关联仓单",
                content: "${ctx}/zy/saleresource/indentureselect.shtml?ids="+indetureIds,
                btn: ['确定', '关闭']
                ,yes: function(index, layero){ //或者使用btn1
                    var iframeWin = layero.find('iframe')[0];
                    var $=iframeWin.contentWindow.$;
                    var doc=$(iframeWin.contentWindow.document);
                    iframeWin.contentWindow.treeSelect();
//                    console.log(JSON.stringify(iframeWin.contentWindow.ids));
                    indetureIds = iframeWin.contentWindow.ids;
                    var indentureName = iframeWin.contentWindow.names;

                    if (indetureIds.length != 0){
                        document.getElementById('indentureName').value=indentureName;
                        document.getElementById('indentureIds').innerHTML='';
                        document.getElementById('indentureIds').innerHTML='<input type="hidden" name="indetureids" value="'+indetureIds+'"/><input type="hidden" name="indeturenames" value="'+indentureName+'"/>';
                        top.layer.close(index);
                    }

                }

            });
        }
        //关联资源
        function relaStock() {
            top.layer.open({
                type: 2,
                area: ['550px', '550px'],
                title:"关联资源",
                content: "${ctx}/zy/marginsaleresource/stockselect.shtml?ids="+stockIds,
                btn: ['确定', '关闭']
                ,yes: function(index, layero){ //或者使用btn1
                    var iframeWin = layero.find('iframe')[0];
                    var $=iframeWin.contentWindow.$;
                    var doc=$(iframeWin.contentWindow.document);
                    iframeWin.contentWindow.treeSelect();
//                    console.log(JSON.stringify(iframeWin.contentWindow.ids));
                    stockIds = iframeWin.contentWindow.ids;
                    var stockName = iframeWin.contentWindow.names;

                    if (stockIds.length != 0){
                        document.getElementById('stockName').value=stockName;
                        document.getElementById('stockIds').innerHTML='';
                        document.getElementById('stockIds').innerHTML='<input type="hidden" name="stockids" value="'+stockIds+'"/><input type="hidden" name="stocknames" value="'+stockName+'"/>';
                        top.layer.close(index);
                    }

                }

            });
        }

        function getRelaresource(){
            var id = '${shopproduct.id}';
            $.ajax({
                type: 'POST',
                url: '${ctx}/hy/shopproduct/relaresource.json',
                dataType: "json", //返回的结果为json
                data:{id:id},
                success: function(data) {
                    $.each(data.obj,function (index,value) {
                        console.log(value.sname);
                    })
                },
                error: function(data) {
                    jj.error("系统错误，请联系管理员");
                }
            })
        }
    </script>
</head>
<body>
<sys:message content="${message}"/>
<div class="mbody">
    <div class="layui-tab layui-tab-card">
        <div class="layui-tab-content" style="height: 100%;">
            <div id="projectInfo" class="layui-tab-item layui-show">

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>产品参数</legend>
                </fieldset>
                <c:choose>
                    <c:when test="${type == 'add'}">
                        <form modelAttribute="data" class="layui-form" action="${ctx}/hy/shopproduct/save.shtml"
                              enctype="multipart/form-data"
                              method="post" id="formx" onkeydown="if(event.keyCode==13) return false;" autocomplete="on">

                            <input type="hidden" name="parentid" value="${data.sparentid}" />
                            <input type="hidden" name="sparentid" value="${data.id}" />
                            <input type="hidden" name="smemberid" value="${smemberid}" />
                            <input type="hidden" name="smembershopid" value="${smembershopid}" />

                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">名称<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="sname" class="operatorwidth layui-input required"
                                               autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">备注：</label>
                                <div class="layui-input-block">
                                    <textarea placeholder="请输入备注" class="layui-textarea" name="sremark"></textarea>
                                </div>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form modelAttribute="data" class="layui-form" action="${ctx}/hy/shopproduct/editsave.shtml"
                              enctype="multipart/form-data"
                              method="post" id="formx" onkeydown="if(event.keyCode==13) return false;" autocomplete="on">


                            <input type="hidden" name="id" value="${data.id}" />
                            <c:choose>
                                <c:when test="${sparentProduct == null}">
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label">名称<em class="red">*</em></label>
                                            <div class="layui-input-inline">
                                                <input type="text" name="sname" class="operatorwidth layui-input required" value="${data.sname}"
                                                       autocomplete="off"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label">上级分类</label>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" readonly="readonly" value="${sparentProduct.sname}"
                                                       autocomplete="off"/>
                                            </div>
                                        </div>
                                        <div class="layui-inline">
                                            <label class="layui-form-label">名称<em class="red">*</em></label>
                                            <div class="layui-input-inline">
                                                <input type="text" name="sname" class="layui-input required" value="${data.sname}"
                                                       autocomplete="off"/>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-form-label">备注：</label>
                                <div class="layui-input-block">
                                    <textarea placeholder="请输入备注" class="layui-textarea" name="sremark"></textarea>
                                </div>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>

    </div>

</div>

</body>
</html>