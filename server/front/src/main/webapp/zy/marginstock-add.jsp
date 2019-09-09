<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <title>新增现货资源</title>
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

        .lightgray {
            background: #F5F5F5;
        }
        .bigautocomplete-layout{
            width: auto !important;
        }
    </style>
    <script type="text/javascript">
        $().ready(function () {
            $("#scommodityname").bigAutocomplete({
                url: "${ctx}/sp/commodity/searchcomodity.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#scommodityid").val(data.id);
                    $("#scommodityname").val(data.sname);
                    $("#sspec").val(data.sspec);
                    $("#sproducer").val(data.sproducer);
                    $("#sweightunit").val(data.unit);
                    $(".xunit").html("(单位：" + data.unit + ")");
                }
            });
        });

        layui.use('form', function () {
            var form = layui.form;

            jj.validate();

        });

    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">商品信息</li>
        </ul>
        <div class="layui-tab-content" style="height: 100%;">
            <div id="projectInfo" class="layui-tab-item layui-show">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>商品参数</legend>
                </fieldset>
                <form action="${ctx}/zy/marginstock/saveadd.shtml" method="post" id="formx" class="layui-form">
                    <input type="hidden" name="id" id="sid" value=""/>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">物资名称</label>
                            <div class="layui-input-inline">
                                <input type="hidden" id="scommodityid" name="scommodityid" value=""/>
                                <input type="hidden" id="sweightunit" name="sweightunit" value=""/>
                                <input type="text" id="scommodityname" name="scommodityname" value=""
                                       placeholder="(必选项)"
                                       class="layui-input required" autocomplete="off" />
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">规格型号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sspec" id="sspec" value="" placeholder=""
                                       class="layui-input lightgray" readonly
                                       autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">生产厂商</label>
                            <div class="layui-input-inline">
                                <input type="text" id="sproducer" name="sproducer" value="" placeholder=""
                                       class="layui-input lightgray" readonly
                                       autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">数量</label>
                            <div class="layui-input-inline">
                                <input type="text" id="fweight" name="fweight"
                                       value="<mw:format label="weight" value='' format='###.###'/>" placeholder="(必填项)"
                                       class="layui-input required onumber gt0" autocomplete="off"/>
                            </div>
                            <div style="display: block;    padding: 9px 0!important" class="layui-word-aux xunit">
                                (单位：)
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">所属设备 </label>
                            <div class="layui-input-inline">
                                <input type="text" id="shostname" name="shostname" value="" placeholder=""
                                       class="layui-input"
                                       autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">所属设备型号 </label>
                            <div class="layui-input-inline">
                                <input type="text" id="shostmodel" name="shostmodel" value="" placeholder=""
                                       class="layui-input" autocomplete="off"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">所属设备厂商 </label>
                            <div class="layui-input-inline">
                                <input type="text" id="shostbrand" name="shostbrand" value="" placeholder=""
                                       class="layui-input" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">供应商名称</label>
                            <div class="layui-input-inline">
                                <input type="text" id="sownername" name="sownername" value="" placeholder=""
                                       class="layui-input" autocomplete="off"/>
                            </div>
                        </div>
                    </div>
                    <%--<div class="layui-form-item">--%>
                    <%--<div class="layui-input-block">--%>
                    <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                </form>
            </div>
        </div>
    </div>

</div>

</body>
</html>