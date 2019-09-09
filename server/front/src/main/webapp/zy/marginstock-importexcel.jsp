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
    <title>导入现货资源</title>
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

        .red{
            color: #FF0000 !important;
        }
    </style>
    <script type="text/javascript">
        var excel;
        var PASSEXCEL = false;
        var NOTPASSEXCEL = false;
        $().ready(function () {

        });

        layui.use(['form', 'element', 'upload', 'table', 'layer'], function () {
            var form = layui.form, element = layui.element, upload = layui.upload;
            var table = layui.table;

            table.init('pass', {
                //totalRow:true,
                limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            });
            table.init('notPass', {
                //totalRow:true,
                limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            });

            upload.render({
                elem: '#importExcel'
                , url: '${ctx}/zy/marginstock/readexcel.json'
                , accept: 'file'
                , multiple: true
                , auto: true
                , field: "upfile"
                , data: {}
                ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    jj.loading(); //上传loading
                }
                , choose: function (obj) {
                    //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
                    obj.preview(function (index, file, result) {
                        excel = file;
//                        console.log(index); //得到文件索引
//                        console.log(file); //得到文件对象
//                        console.log(result); //得到文件base64编码，比如图片

                        //obj.resetFile(index, file, '123.jpg'); //重命名文件名，layui 2.3.0 开始新增
                        //这里还可以做一些 append 文件列表 DOM 的操作
                        //obj.upload(index, file); //对上传失败的单个文件重新上传，一般在某个事件中使用
                        //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
                    });
                }
                , done: function (res, index, upload) {
                    if (res.success) { //上传成功
                        passExcel();
                        notPassExcel();
                    } else {
                        layer.msg(res.msg);
                    }
                }
            });
            jj.validate();
        });


        function passExcel() {
            var formData = new FormData();
            formData.append("upfile", excel);
            $.ajax({
                url: "${ctx}/zy/marginstock/passexcel.shtml",
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    $("#formx").empty();
                    $("#formx").html(data);
                },
            });
        }

        function notPassExcel() {
            var formData = new FormData();
            formData.append("upfile", excel);
            $.ajax({
                url: "${ctx}/zy/marginstock/notpassexcel.shtml",
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    $("#notPass").empty();
                    $("#notPass").html(data);
                },
            });
            jj.closeAll('loading'); //关闭loading
        }

        function excel_save(){
//            alert("passExcel:"+PASSEXCEL+",notPassExcel:"+NOTPASSEXCEL);
            if (excel == null){
                jj.error('请先上传excel');
                return;
            }else{
                if (PASSEXCEL && NOTPASSEXCEL){
                    jj.loading();
                    var formData = new FormData();
                    formData.append("file", excel);
                    $.ajax({
                        url: "${ctx}/zy/marginstock/excel_save.shtml",
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (data) {
        //                    jj.closeAll('loading');
                            if(data.success){
                                jj.closeAll();
                                if (data.msg)
                                    jj.msg(data.msg);
                                else
                                    jj.msg('操作成功');
                            }else{
                                jj.closeAll('loading');
                                jj.msg(data.msg,5,3);
                            }
                        },
                        error:function (data) {
                            jj.closeAll('loading');
                            jj.error('系统错误，请联系管理员');
                        }
                    });
                }else{
                    jj.error('Excel格式不正确，请上传正确的Excel文件');
                    return;
                }
            }
        }

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
            <div id="projectInfo" class="layui-tab-item layui-show" style="overflow: scroll">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>商品参数 <a href="<cs:SysParaType imgurl="1" op="syspara"/>/model/挂牌资源导入模板.xls"
                                    class="layui-btn layui-btn-sm" style="margin-left: 20px;">样表模版下载</a>
                        <a id="importExcel" class="layui-btn layui-btn-sm" style="margin-left: 20px;"><i
                                class="layui-icon"></i>导入EXCEL</a></legend>
                </fieldset>
                <form action="${ctx}/zy/marginstock/excelsave.shtml" method="post" id="formx" class="layui-form">

                    <table class="layui-table" lay-size="sm" lay-filter="pass" style="width: 210%">
                        <thead>
                        <tr>
                            <th lay-data="{field:'index', minWidth:70}">序号</th>
                            <%--<th lay-data="{field:'igoodstype', width:100,totalRow:true,align:'right'}">货物类型</th>--%>
                            <th lay-data="{field:'scategory', minWidth:150}">品种名称</th>
                            <th lay-data="{field:'scommodityname', minWidth:150}">物资名称</th>
                            <th lay-data="{field:'sspec', minWidth:150}">规格型号</th>
                            <th lay-data="{field:'sproducer', minWidth:120}">生产厂家</th>
                            <%--<th lay-data="{field:'shostname', width:60}">所属主机</th>--%>
                            <%--<th lay-data="{field:'shostmodel', width:100,totalRow:true,align:'right'}">主机型号</th>--%>
                            <%--<th lay-data="{field:'shostbrand', width:120,align:'right'}">主机生产厂家</th>--%>
                            <th lay-data="{field:'ftaxprice', width:120,align:'right'}">含税单价（元）</th>
                            <th lay-data="{field:'dstockweight', width:100,totalRow:true,align:'right'}">库存数量</th>
                            <th lay-data="{field:'sstorelocation', width:100,totalRow:true,align:'right'}">储存地点</th>
                            <th lay-data="{field:'sownername', width:100,totalRow:true,align:'right'}">供应商</th>
                            <th lay-data="{field:'ideliverydays', width:60,totalRow:true,align:'right'}">供货周期（天）</th>
                            <%--<th lay-data="{field:'sremark', minWidth:150}">备注</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </form>
            </div>
        </div>

        <div class="layui-tab-content" style="height: 100%;">
            <div class="layui-tab-item layui-show" style="overflow: scroll">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>以下产品不符合导入规则（请详细阅读导入说明）</legend>
                </fieldset>
                <form action="#" id="notPass" class="layui-form">

                    <table class="layui-table" lay-size="sm" lay-filter="notPass" style="width: 210%">
                        <thead>
                        <tr>
                            <th lay-data="{field:'index', minWidth:70}">序号</th>
                            <%--<th lay-data="{field:'igoodstype', width:100,totalRow:true,align:'right'}">货物类型</th>--%>
                            <th lay-data="{field:'scategory', minWidth:150}">品种名称</th>
                            <th lay-data="{field:'scommodityname', minWidth:150}">物资名称</th>
                            <th lay-data="{field:'sspec', minWidth:150}">规格型号</th>
                            <th lay-data="{field:'sproducer', minWidth:120}">生产厂家</th>
                            <%--<th lay-data="{field:'shostname', width:60}">所属主机</th>--%>
                            <%--<th lay-data="{field:'shostmodel', width:100,totalRow:true,align:'right'}">主机型号</th>--%>
                            <%--<th lay-data="{field:'shostbrand', width:120,align:'right'}">主机生产厂家</th>--%>
                            <th lay-data="{field:'ftaxprice', width:120,align:'right'}">含税单价（元）</th>
                            <th lay-data="{field:'dstockweight', width:100,totalRow:true,align:'right'}">库存数量</th>
                            <th lay-data="{field:'sstorelocation', width:100,totalRow:true,align:'right'}">储存地点</th>
                            <th lay-data="{field:'sownername', width:100,totalRow:true,align:'right'}">供应商</th>
                            <th lay-data="{field:'ideliverydays', width:60,totalRow:true,align:'right'}">供货周期（天）</th>
                            <%--<th lay-data="{field:'sremark', minWidth:150}">备注</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </form>
            </div>
        </div>


    </div>

</div>

</body>
</html>