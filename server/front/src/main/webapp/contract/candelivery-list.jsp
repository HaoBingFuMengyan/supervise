<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>入库通知单</title>
    <style>
        .layui-table-body{
            min-height: auto;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            layui.use(['layer', 'form','element','table'], function(){
                var element = layui.element;
                var layer = layui.layer
                    ,form = layui.form;
                var table = layui.table;

                table.render({
                    elem: '#detail'
                    ,data:${data}
                    ,size:"sm"
                    ,cols: [[
                        {field:'scommodityname', title:'物资名称',width:'20%', sort: true}
                        ,{field:'sspec', width:'20%',title:'规格型号'}
                        ,{field:'sproducer', width:'15%',title:'生产厂商'}
                        ,{field:'iavailablepackage',width:'10%',align:'right',title: '可用数量', sort: true}
                        ,{type:'space',width:'15%',title:'开单量(可输入)',align:'right',edit:'text',style:'background-color:antiquewhite;', unresize: true}
                        //,{type:'space',width:'19%',title:'开单量(可输入)',align:'right',templet:'#foderweightTpl', unresize: true}
                    ]]
                });
                //监听单元格编辑
                table.on('edit(detail)', function(obj){

                    var value = obj.value //得到修改后的值
                        ,data = obj.data //得到所在行所有键值
                        ,field = obj.field; //得到字段
                    if (obj.value > (obj.data.fweight-forderweight)){
                        layer.msg('开单量不能超过可开单量。', {icon: 5});
                    }else{
                        jj.open({
                            title:'选择舱单',
                            content:'${ctx}/contract/candeliverylist.shtml?scontractdetailid='+obj.data.id
                        });
                        $("#formx").find("input[name='inputmap["+obj.data.id+"].foderweight']").remove();
                        $("#formx").prepend("<input type='hidden' name='inputmap["+obj.data.id+"].foderweight' data-max='"+obj.data.fcanorderweight+"' data-type='inputweight' value='"+obj.value+"'>");
                    }
                });
                jj.validate();
            });
        });
    </script>
</head>
<body>
<form action="${ctx}/contract/deliveryorderadd.shtml" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <table class="layui-table" id="detail" lay-filter="detail"></table>
</form>
<script type="text/html" id="foderweightTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="text" name="foderweight" class="layui-input layui-input-table" value="" placeholder="请输入开单量"/>
</script>
</body>
</html>
