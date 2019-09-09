<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="wm" uri="http://www.frogsing.com/tags/frogsing" %>
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
        var ftotalWeight = 0;//总可开单量
        $(document).ready(function(){
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
                        {field:'scodegood', title:'物资编码',sort: true}
                        ,{field:'scommodityname', title:'物资名称', sort: true}
                        ,{field:'sspec', title:'规格型号'}
                        ,{field:'sproducer',title:'生产厂商'}
                        ,{ width:'10%',title:'价格', templet:function(d){
                                return data.map[d.ext.sitemid].fprice;
                            }}
                        ,{field:'favailableweight',align:'right',title: '剩余', sort: true,templet:function(d){
                            var foderweight=0;
                            if(data.deliverydetailmap!=undefined){
                                foderweight = data.deliverydetailmap[d.ext.sitemid].foderweight;
                            }
                            return d.favailableweight+foderweight;
                        }}
                        ,{field:'favailableweight',align:'right',title: '合同量',  templet:function(d){
                                return data.map[d.ext.sitemid].fweight;
                            }}
                        ,{align:'right',title: '已开单量', templet:function(d){
                                var foderweight=0;
                                if(data.deliverydetailmap!=undefined){
                                    foderweight = data.deliverydetailmap[d.ext.sitemid].foderweight;
                                }
                                return data.map[d.ext.sitemid].forderweight-foderweight;
                            }}
                        ,{field:'fcanorderweight',align:'right',title: '可开单量', sort: true,templet:function(d){
                                var foderweight=0;
                                if(data.deliverydetailmap!=undefined){
                                    foderweight = data.deliverydetailmap[d.ext.sitemid].foderweight;
                                }
                                if(data.map[d.ext.sitemid].fcanorderweight > d.favailableweight ){
                                    ftotalWeight = parseFloat(ftotalWeight) + parseFloat(d.favailableweight) + parseFloat(foderweight);
                                    return d.favailableweight+foderweight;
                                }
                                ftotalWeight = parseFloat(ftotalWeight) + parseFloat(data.map[d.ext.sitemid].fcanorderweight) + parseFloat(foderweight);
                                return data.map[d.ext.sitemid].fcanorderweight+foderweight;
                            }}
                        ,{type:'space',width:'15%',title:'开单量(可输入)',align:'right',edit:'button',style:'background-color:antiquewhite;', unresize: true,templet:function(d){
                            var foderweight=0;
                            if(data.deliverydetailmap!=undefined){
                                foderweight = data.deliverydetailmap[d.ext.sitemid].foderweight;
                            }
                            if(foderweight>0){
                                return foderweight;
                            }else{
                                return "";
                            }
                        }}
                        //,{type:'space',width:'19%',title:'开单量(可输入)',align:'right',templet:'#foderweightTpl', unresize: true}
                    ]]
                });
                //监听单元格编辑
                table.on('edit(detail)', function(obj){

                    var value = obj.value //得到修改后的值
                        ,d = obj.data //得到所在行所有键值
                        ,field = obj.field; //得到字段

                    $("#formx").find("input[name='"+n(d.id,'foderweight')+"']").remove();
                    $("#formx").find("input[name='"+n(d.id,'scontractdetailid')+"']").remove();

                    $("#formx").prepend("<input type='hidden' name='"+
                        n(d.id,"foderweight")+
                        "' data-max2='"+d.favailableweight+
                        "' " +"data-price='"+data.map[d.ext.sitemid].fprice+"' "+
                        "data-max='"+data.map[d.ext.sitemid].fcanorderweight+"' data-type='inputweight' value='"+obj.value+"'>");
                    $("#formx").prepend("<input " +
                        "type='hidden' name='"+
                        n(d.id,"scontractdetailid")+ "' value='"+data.map[d.ext.sitemid].id+"'>");

                    var items=$("#formx").find('input[data-type=inputweight]');
                    var all=0;
                    items.each(function(){
                        var a=getRoundValue(parseFloat($(this).val()) * parseFloat($(this).data("price")),2);
                        all=all+a;
                    });
                    $('#goodmoney').html(all.toFixed(2));
                    $('#tihuoMoney').html(all.toFixed(2));

                });
                jj.validate("#formx",{
                    check:function(){
                        var tihuoMoney = 0;
                        var fbuyerpaidMoney = parseFloat('${contract.fbuyerpaid}');//已还金额
                        var flag = true;
                        if ('${project.itype}' == '10'){
                            tihuoMoney = getRoundValue(parseFloat($("#tihuoMoney").text()) + parseFloat('${cumMoney}'),2);
                        }else if ('${project.itype}' == '20'){
                            tihuoMoney = getRoundValue(parseFloat($("#tihuoMoney").text()) + parseFloat('${cumMoney}'),2);
                            if ('${project.bislimit}' == '0')
                                flag = false;

                            var ftotalOrderweight = 0;//总开单量
                            $.each($("#formx").find("input[data-type='inputweight']"),function (index,item) {
                                ftotalOrderweight = parseFloat(ftotalOrderweight) + parseFloat($(item).val());
                            });
                            if (parseFloat(ftotalWeight) == parseFloat(ftotalOrderweight)){//如果相等就是最后一笔开提货单
                                fbuyerpaidMoney = parseFloat(fbuyerpaidMoney);
                            }else
                                fbuyerpaidMoney = getRoundValue(parseFloat(fbuyerpaidMoney) - parseFloat('${project.fadvanceamount}'),2);

                        }
                        if (flag)
                            if (parseFloat(tihuoMoney) > parseFloat(fbuyerpaidMoney))
                                return "提货金额+累计提货金额不能大于已还金额";

                        // var items=$("#formx").find('input[data-type=inputweight]');
                        // for(var i=0;i<items.length;i++){
                        //     var item=$(items[i]);
                        //     var v=item.val()||0;
                        //     item.val(v);
                        //     if( parseInt(v)!=v)
                        //         return "第"+(i+1)+"行开单量格式不正确";
                        //     if(v>item.data('max'))
                        //         return "第"+(i+1)+"不能超过可开单量";
                        //     if(v>item.data('max2'))
                        //         return "第"+(i+1)+"不能超过仓单剩余量";
                        //
                        // }

                    }
                });
            });

        });
        function  n(id,key){
            return "inputmap["+id+"]."+key;
        }

//        window.onload = function () {
//            var cumOrderMoney = 0;//累计提货金额
//            for ( var i = 0; i <data.list.length; i++){
//                var obj = data.list[i];
//                var fprice = data.map[obj.ext.sitemid].fprice;//价格
//                var foderweight=0;
//                if(data.deliverydetailmap!=undefined){
//                    foderweight = data.deliverydetailmap[obj.ext.sitemid].foderweight;
//                }
//                var fopenweight = data.map[obj.ext.sitemid].forderweight-foderweight;//已开单量
//
//                cumOrderMoney = cumOrderMoney + parseFloat(fprice * fopenweight);
//            }
////            $('#cumMoney').html(cumOrderMoney.toFixed(2));
//        }
    </script>
</head>
<body>
<form action="${ctx}/contract/deliveryorderadd.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <input type="hidden" name="id" value="${deliveryOrder.id}"/>
    <input type="hidden" name="scontractid" value="${contract.id}"/>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="text-align: center;color: #f10214;">提货金额：<span id="tihuoMoney">0.00</span>，累计提货金额：<span id="cumMoney">${mw:money(cumMoney)}</span>，已还金额：<span>${mw:money(contract.fbuyerpaid)}</span><c:if test="${project.itype == 20}">，<span>预付款金额：${mw:money(project.fadvanceamount)}</span> </c:if></legend>
    </fieldset>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">提货客户:</label>
            <div class="layui-form-mid layui-word-aux">
                ${contract.sbuyermembername}
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">提货人: </label>
            <div class="layui-input-inline">
                <input type="text" name="sdrivername" id="sdrivername" value="${deliveryOrder.sdrivername}"  placeholder="必填项" class="layui-input required"
                       autocomplete="off"/>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">车牌号:</label>
            <div class="layui-input-inline">
                <input type="text" id="scarno" name="scarno" value="${deliveryOrder.scarno}" class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号码: </label>
            <div class="layui-input-inline">
                <input type="text" name="scardno" id="scardno" value="${deliveryOrder.scardno}" class="layui-input"
                       autocomplete="off"/>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">提货日期:</label>
            <div class="layui-input-inline">
                <input type="text" id="dvaliddate" name="dvaliddate" value="<wm:format label="date" value="${deliveryOrder.dvaliddate}"/>" placeholder="必填项" class="layui-input required" autocomplete="off" readonly/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系手机: </label>
            <div class="layui-input-inline">
                <input type="text" name="smobile" id="smobile" value="${deliveryOrder.smobile}" placeholder="必填项" class="layui-input required"
                       autocomplete="off"/>
            </div>
        </div>
    </div>

    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">备注: </label>
            <div class="layui-input-inline">
                <input type="text" id="sremark" name="sremark" value="${deliveryOrder.sremark}" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">货值:</label>

            <div class="layui-form-mid layui-word-aux" id="goodmoney" >0</div> <div class="layui-form-mid layui-word-aux" >元</div>

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
