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
        var data=${data};
        $(function(){
            layui.use(['layer', 'form','element','table','laydate'], function(){
                var element = layui.element;
                var layer = layui.layer
                    ,form = layui.form;
                var table = layui.table;

                var laydate=layui.laydate;
                laydate.render({
                    elem: '#dvaliddate',
                    trigger: 'click'
                });
                table.render({
                    limit:10000,
                    elem: '#detail'
                    ,data:data.list
                    ,size:"sm"
                    ,cols: [[
                        {field:'scodegood', title:'物资编码',width:'15%', sort: true}
                        ,{field:'scommodityname', title:'物资名称',width:'15%', sort: true}
                        ,{field:'sspec', width:'15%',title:'规格型号'}
                        ,{field:'sproducer', width:'10%',title:'生产厂商'}
                        ,{field:'favailableweight',width:'10%',align:'right',title: '剩余', sort: true}
                        ,{width:'10%',align:'right',title: '冻结量', templet:function(d){
                               return d.flockweight;
                        }}
                        ,{field:'fcanorderweight',align:'right',title: '可开单量', sort: true,templet:function(d){
                                var item=data.map[d.ext.sitemid];
                                var max=(item.finwegith-item.fbuyweight);
                                return d.favailableweight>max?max:d.favailableweight;
                            }}
                        ,{type:'space',width:'15%',title:'开单量(可输入)',align:'right',edit:'button',style:'background-color:antiquewhite;', unresize: true}
                        //,{type:'space',width:'19%',title:'开单量(可输入)',align:'right',templet:'#foderweightTpl', unresize: true}
                    ]]
                });
                //监听单元格编辑
                table.on('edit(detail)', function(obj){

                    var value = obj.value //得到修改后的值
                        ,d = obj.data //得到所在行所有键值
                        ,field = obj.field; //得到字段

                        var item=data.map[d.ext.sitemid];
                        $("#formx").find("input[name='"+n(d.id,'foderweight')+"']").remove();

                        $("#formx").prepend("<input type='hidden' name='"+
                                n(d.id,"foderweight")+
                                "' data-max2='"+(item.finwegith-item.fbuyweight)+
                            "' data-max='"+d.favailableweight+"' data-type='inputweight' value='"+obj.value+"'>");


                });
                jj.validate("#formx",{
                    // check:function(){
                    //     var items=$("#formx").find('input[data-type=inputweight]');
                    //     for(var i=0;i<items.length;i++){
                    //         var item=$(items[i]);
                    //         var v=item.val()||0;
                    //         item.val(v);
                    //         if(parseInt(v)!=v)
                    //             return "第"+(i+1)+"行开单量格式不正确";
                    //         if(v>item.data('max'))
                    //             return "第"+(i+1)+"行不能超过可开单量";
                    //         if(v>item.data('max2'))
                    //             return "第"+(i+1)+"行不能超过可开单量";
                    //
                    //     }
                    //
                    // }
                });
            });
        });
        function  n(id,key){
            return "inputmap["+id+"]."+key;
        }
    </script>
</head>
<body>
<form action="${ctx}/project/deliveryindentureadd.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <input type="hidden" name="id" value=""/>
    <input type="hidden" name="sprojectid" value="${project.id}"/>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">提货客户：</label>
            <div class="layui-form-mid layui-word-aux">
                ${project.ssalename}
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">提货人： </label>
            <div class="layui-input-inline">
                <input type="text" name="sdrivername" id="sdrivername" value=""  placeholder="必填项" class="layui-input required"
                       autocomplete="off"/>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">车牌号：</label>
            <div class="layui-input-inline">
                <input type="text" id="scarno" name="scarno" value="" class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号码： </label>
            <div class="layui-input-inline">
                <input type="text" name="scardno" id="scardno" value="" class="layui-input"
                       autocomplete="off"/>
            </div>
        </div>
    </div>

    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">提货日期:</label>
            <div class="layui-input-inline">
                <input type="text" id="dvaliddate" name="dvaliddate" value="" placeholder="必填项" class="layui-input required" autocomplete="off" readonly/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系手机： </label>
            <div class="layui-input-inline">
                <input type="text" id="smobile" name="smobile" value="" placeholder="必填项" class="layui-input" autocomplete="off"/>
            </div>
        </div>

    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">备注： </label>
            <div class="layui-input-inline">
                <input type="text" id="sremark" name="sremark" value="" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
        </div>
    </div>

    <table class="layui-table" id="detail" lay-filter="detail"></table>
</form>
<script type="text/html" id="foderweightTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="text" name="foderweight" class="layui-input layui-input-table" value="" placeholder="请输入开单量"/>
</script>
</body>
</html>
