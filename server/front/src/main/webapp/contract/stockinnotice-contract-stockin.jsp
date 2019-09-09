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
        .layui-form-item .layui-input-inline {
            width: 180px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            layui.use(['layer', 'form','element','table','laydate'], function(){
                var element = layui.element;
                var layer = layui.layer
                    ,form = layui.form;
                var table = layui.table;
                var laydate=layui.laydate;
                laydate.render({
                    elem: '#ssendtime',
                    trigger: 'click'
                });

                table.render({
                    elem: '#detail'
                    ,data:${detail}
                    ,limit:10000
                    ,size:"sm"
                    ,initSort:{
                        field:"fcanorderweight",
                        type:"desc"
                    }
                    ,cols: [[
                        {field:'scommodityname', title:'物资名称',width:'20%', sort: true}
                        ,{field:'sspec', width:'20%',title:'规格型号'}
                        ,{field:'sproducer', width:'20%',title:'生产厂商'}
                        ,{field:'fcanorderweight',width:'20%',align:'right',title: '未交付数量', sort: true}
                        ,{type:'space',width:'19%',title:'本次入库数量(可输入)',align:'right',edit:'text',style:'background-color:antiquewhite;', unresize: true}
                        //,{type:'space',width:'19%',title:'开单量(可输入)',align:'right',templet:'#foderweightTpl', unresize: true}
                    ]]
                });
                //监听单元格编辑
                table.on('edit(detail)', function(obj){
                    var value = obj.value //得到修改后的值
                        ,data = obj.data //得到所在行所有键值
                        ,field = obj.field; //得到字段

                        $("#formx").find("input[name='inputmap["+obj.data.id+"].foderweight']").remove();
                        $("#formx").prepend("<input type='hidden' name='inputmap["+obj.data.id+"].foderweight' data-max='"+obj.data.fcanorderweight+"' data-type='inputweight' value='"+obj.value+"'>");
                });


                jj.validate("#formx",{
                    // check:function(){
                    //     var items=$("#formx").find('input[data-type=inputweight]');
                    //     if (items.length == 0)
                    //         return "请输入开单量";
                    //     var gt0=0;
                    //     for(var i=0;i<items.length;i++){
                    //         var item=$(items[i]);
                    //         var v=item.val()||0;
                    //         item.val(v);
                    //         if(parseInt(v)!=v)
                    //             return "第"+(i+1)+"行开单量格式不正确";
                    //         if (v > 0){
                    //             gt0++;
                    //         }
                    //         if(v>item.data('max'))
                    //             return "第"+(i+1)+"行不能超过可开单量";
                    //     }
                    //     if (gt0 == 0){
                    //         return "开单量至少有一条不能为零";
                    //     }
                    //
                    // }
                });
            });
        });
    </script>
</head>
<body>
<form action="${ctx}/stockinnotice/contract_stockin.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <input type="hidden" name="id" value=""/>
    <input type="hidden" name="scontractid" value="${contract.id}"/>
    <div class="layui-form-item">
        <div class="layui-inline" style="width:60%;">
            <label class="layui-form-label">供应商</label>
            <div class="layui-form-mid layui-word-aux">
                ${project.ssalename}
            </div>
        </div>
    </div>
    <div class="layui-form-item">
         <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">入库仓库</label>
            <div class="layui-form-mid layui-word-aux">
                ${warehouse.swarehousename}
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">仓库联系人</label>
            <div class="layui-form-mid layui-word-aux">
                ${warehouse.slinkman}
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">仓库联系电话</label>
            <div class="layui-form-mid layui-word-aux">
                ${warehouse.smobile}
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">送货人<em class="red">*</em></label>
            <div class="layui-input-inline">
                <input type="text" id="sdrivername" name="sdrivername" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-inline">
                <input type="text" id="sidcardno" name="sidcardno" value="" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">联系方式<em class="red">*</em></label>
            <div class="layui-input-inline">
                <input type="text" name="smobile" id="smobile" value="" placeholder="(必填项)" class="layui-input required"
                       autocomplete="off"/>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">送货时间<em class="red">*</em></label>
            <div class="layui-input-inline">
                <input type="text" id="ssendtime" name="ssendtime" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off" readonly/>
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">送货车型 </label>
            <div class="layui-input-inline">
                <input type="text" id="scartype" name="scartype" value="" placeholder="" class="layui-input" autocomplete="off" />
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">车牌号 </label>
            <div class="layui-input-inline">
                <input type="text" id="scarnum" name="scarnum" value="" placeholder="" class="layui-input" autocomplete="off" />
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline" style="width: 30%;">
            <label class="layui-form-label">送货单号</label>
            <div class="layui-input-inline">
                <input type="text" id="spaperoutno" name="spaperoutno" value="" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline" style="width: 60%;">
            <label class="layui-form-label">备注 </label>
            <div class="layui-input-block">
                <input type="text" id="sremark" name="sremark" value="" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
        </div>

    </div>

    <table class="layui-table" id="detail" lay-filter="detail"></table>
<script type="text/html" id="foderweightTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="text" name="foderweight" class="layui-input layui-input-table" value="" placeholder="请输入开单量"/>
</script>
</body>
</html>
