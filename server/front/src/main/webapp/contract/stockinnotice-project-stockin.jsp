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
        .foderweightFtl{
            height: 19px;
            line-height: 19px;
            width: 210px;
            border: none;
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            var tableIns,info=${detail};
            layui.use(['layer', 'form','laydate','element','table'], function(){
                var element = layui.element;
                var layer = layui.layer
                    ,form = layui.form;
                var table = layui.table;
                var laydate = layui.laydate;
                layer = layui.layer;
                //日期
                laydate.render({
                    elem: '#ssendtime'
                });


                tableIns = table.render({
                    elem: '#detail'
                    ,limit:10000
                    ,data:info
                    ,size:"sm"
                    ,initSort:{
                        field:"fcanstockinweight",
                        type:"desc"
                    }
                    ,cols: [[
                        {type:'checkbox'}
                        ,{field:'scommodityname', title:'物资名称',width:'20%', sort: true}
                        ,{field:'sspec', width:'20%',title:'规格型号'}
                        ,{field:'sproducer', width:'20%',title:'生产厂商'}
                        ,{field:'fcanstockinweight',width:'20%',align:'right',title: '未交付数量', sort: true}
//                        ,{field:'finwegith',width:'19%',title:'本次入库数量(可输入)',align:'right',edit:'text',style:'background-color:antiquewhite;', unresize: true}
                        ,{type:'space',width:'19%',title:'本次入库数量(可输入)',align:'right',style:'background-color:antiquewhite;',templet:'#foderweightFtl'}
                    ]]
                });
                //监听单元格编辑
                table.on('edit(detail)', function(obj){
                    var value = obj.value //得到修改后的值
                        ,data = obj.data //得到所在行所有键值
                        ,field = obj.field; //得到字段

//                        $("#formx").find("input[name='inputmap["+obj.data.id+"].fcanstockinweight']").remove();
                        $("#formx").find("input[name='inputmap["+obj.data.id+"].foderweight']").remove();
                        if (obj.value != 0 && obj.value != '' && obj.value != null)
                            $("#formx").prepend("<input type='hidden' name='inputmap["+obj.data.id+"].foderweight' data-max='"+obj.data.fcanstockinweight+"' data-type='inputweight' value='"+obj.value+"'>");
                });

                //监听复选框事件
                table.on('checkbox(detail)', function(obj){

//                    console.log(obj.checked); //当前是否选中状态
//                    console.log(obj.data); //选中行的相关数据
//                    console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
                    var checkStatus = table.checkStatus('detail')
                        ,data = checkStatus.data;

                    if (obj.type == 'all'){
                        if (obj.checked){
                            for (var i = 0;i<data.length;i++){
                                $("#formx").find("input[name='inputmap["+data[i].id+"].foderweight']").remove();

                                if (data[i].fcanstockinweight > 0){
                                    $("#formx").prepend("<input type='hidden' name='inputmap["+data[i].id+"].foderweight' data-max='"+data[i].fcanstockinweight+"' data-type='inputweight' value='"+data[i].fcanstockinweight+"'>");

                                    $("#"+data[i].id).val(data[i].fcanstockinweight);
                                }
                            }
                        }else{
                            $("#formx").find("input[data-type='inputweight']").remove();
                            tableIns.reload({
                                data:info
                            });
                        }
                    }else{
                        if (obj.checked){
                            $("#formx").find("input[name='inputmap["+obj.data.id+"].foderweight']").remove();

                            if (obj.data.fcanstockinweight > 0) {
                                $("#formx").prepend("<input type='hidden' name='inputmap[" + obj.data.id + "].foderweight' data-max='" + obj.data.fcanstockinweight + "' data-type='inputweight' value='" + obj.data.fcanstockinweight + "'>");

                                $("#" + obj.data.id).val(obj.data.fcanstockinweight);
                            }
                        }else{
                            $("#formx").find("input[name='inputmap["+obj.data.id+"].foderweight']").remove();

                            $("#"+obj.data.id).val('');
                        }
                    }

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
                    //         if( parseInt(v)!=v )
                    //             return "开单量格式不正确";
                    //         if (v > 0){
                    //             gt0++;
                    //         }
                    //         if(v>item.data('max'))
                    //             return "开单量不能超过可开单量";
                    //     }
                    //     if (gt0 == 0){
                    //         return "开单量至少有一条不能为零";
                    //     }
                    //
                    // }
                });
            });
        });

        //本次入库数量可输入
        function cellEdit(is) {
            var value = $(is).val() //得到修改后的值
                ,id = $(is).attr('id') //当前行id
                ,fcanstockinweight = $(is).data('max'); // 当前未交付量

            $("#formx").find("input[name='inputmap["+id+"].foderweight']").remove();

            if (isNaN(value)){
                jj.error('请输入正确的格式');
                return;
            }

            if (value != 0 && value != '' && value != null)
                $("#formx").prepend("<input type='hidden' name='inputmap["+id+"].foderweight' data-max='"+fcanstockinweight+"' data-type='inputweight' value='"+value+"'>");
        }
    </script>
</head>
<body>
<form action="${ctx}/stockinnotice/project_stockin.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <input type="hidden" name="id" value=""/>
    <input type="hidden" name="itype" value="20"/>
    <input type="hidden" name="sprojectid" value="${project.id}"/>

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
                ${project.swarehousename}
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
            <label class="layui-form-label">送货人</label>
            <div class="layui-input-inline">
                <input type="text" id="sdrivername" name="sdrivername" value="" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-inline">
                <input type="text" id="sidcardno" name="sidcardno" value="" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">联系方式 </label>
            <div class="layui-input-inline">
                <input type="text" name="smobile" id="smobile" value="" placeholder="" class="layui-input"
                       autocomplete="off"/>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline" style="width:30%;">
            <label class="layui-form-label">送货时间 </label>
            <div class="layui-input-inline">
                <input type="text" id="ssendtime" name="ssendtime" value="" placeholder="" class="layui-input" autocomplete="off" readonly/>
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
</form>
<script type="text/html" id="foderweightTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="text" name="foderweight" class="layui-input layui-input-table" value="" placeholder="请输入开单量"/>
</script>


<script type="text/html" id="foderweightFtl">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <input id="{{d.id}}" data-max="{{d.fcanstockinweight}}" type="text" onchange="cellEdit(this)" class="foderweightFtl" />
    </div>
</script>

</body>
</html>
