<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/contract" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>合同详情--修改价格</title>
    <style>
        .layui-table-body {
            min-height: auto;
        }

        .layui-form-item .layui-input-inline {
            width: 180px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            layui.use(['layer', 'form', 'element', 'table', 'laydate'], function () {
                var element = layui.element;
                var layer = layui.layer
                    , form = layui.form;
                var table = layui.table;
                var laydate = layui.laydate;

                var tableIndex = table.render({
                    elem: '#detail'
                    , data:${detail}
                    , limit: 10000
                    , size: "sm"
                    , initSort: {
                        field: "",
                        type: "desc"
                    },
                    id:'testReload'
                    , cols: [[
                        {field: 'scommoditysystemcode', title: '物资编码', width: '15%', sort: true}
                        , {field: 'scommodityname', title: '物资名称', width: '15%', sort: true}
                        , {field: 'sspec', width: '15%', title: '规格'}
                        , {field: 'sproducer', width: '15%', title: '生产厂家'}
                        , {field: 'fweight', width: '15%', title: '数量'}
                        , {
                            field: 'fprice',
                            width: '15%',
                            title: '单价(元)',
                            align: 'center',
                            edit: 'text',
                            style: 'background-color:antiquewhite;',
                            unresize: true
                        }
                        , {field: 'famount', width: '15%', title: '金额(元)',templet:function (obj) {
                            return obj.fweight * obj.fprice;
                        }}
                    ]]
                });
                //监听单元格编辑
                table.on('edit(detail)', function (obj) {
                    var value = obj.value //得到修改后的值
                        , data = obj.data //得到所在行所有键值
                        , field = obj.field; //得到字段

                    $("#formx").find("input[name='inputmap[" + obj.data.id + "].fprice']").remove();
                    $("#formx").prepend("<input type='hidden' name='inputmap[" + obj.data.id + "].fprice' data-type='inputprice' value='" + obj.value + "'>");
                    //table重载
                    var oldData =  table.cache["detail"];//elem
                    table.reload('testReload',{//id:'testReload'
                        data : oldData
                    });
                    //table新增加一行 案例
//                    $("#addTable").click(function(){
//                        var oldData =  table.cache["baseInfo"];
//                        var data1={"colName":"ID2","colNo":0,"collator":"","comments":"","dbId":1,"defVal":"","deleted":"","dispersion":0,"domainId":0,"histogram":"","isHide":"","isSerial":"F","isVirtual":"","maxVal":"","minVal":"","notNull":"T","repetRate":0,"scale":-1,"serialId":0,"tableId":1048586,"timestampT":" ","typeName":"INTEGER","varying":"F","vcolNo":0,"vertNo":0};
//                        oldData.push(data1);
//                        table.reload('baseInfo',{
//                            data : oldData
//                        });
//                    });
                    var ftotalamount = 0.00;
                    $("tbody tr td[data-field='famount'] div").each(function (i) {

                        ftotalamount = getRoundValue(ftotalamount + parseFloat($(this).text()),2);

                    });
                    $("#ftotalamount").text(fmt(ftotalamount, '#,#00.00'));

                });

                jj.validate("#formx", {
                    check: function () {
                        var items = $("#formx").find('input[data-type=inputprice]');
                        var gt0 = 0;
                        for (var i = 0; i < items.length; i++) {
                            var item = $(items[i]);
                            var v = item.val() || 0;
                            item.val(v);
                            if (parseFloat(v) != v){
                                return "第" + (i + 1) + "行价格格式不正确";
                            }
                            if (v > 0) {
                                gt0++;
                            }
                        }

                        if (items.length == 0 && gt0 == 0) {
                            return "至少要修改一条记录的价格";
                        }else if (items.length != 0 && gt0 == 0){
                            return "价格至少有一条不能为零";
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<form action="${ctx}/contract/seller_modifyfprice.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <input type="hidden" name="id" value="${contract.id}"/>
    <div class="layui-collapse top10">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">
                合同编号：${contract.scontractsellerno}&nbsp;&nbsp;&nbsp;&nbsp;合同进度：<consts:DeliveryStatus
                    val="${contract.ideliverystatus}"/></h2>
            <div class="layui-colla-content layui-show">
                <div class="layui-info">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">采购商：</label>
                            <div class="layui-input-inline">
                                ${contract.sbuyermembername}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">交货仓库： </label>
                            <div class="layui-input-inline">
                                ${contract.swarehouse}
                            </div>
                        </div>
                        <c:if test="${contract.imodeltype == 10}">
                            <div class="layui-inline">
                                <label class="layui-form-label">项目编号： </label>
                                <div class="layui-input-inline">
                                        ${contract.sorderno}
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">货款支付状态： </label>
                            <div class="layui-input-inline">
                                <consts:PaymentStatus val="${contract.ipaymentstatus }"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">货物交收状态： </label>
                            <div class="layui-input-inline">
                                <consts:DeliveryStatus val="${contract.ideliverystatus}"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">开票状态： </label>
                            <div class="layui-input-inline">
                                <consts:IInvoiceStatus val="${contract.iinvoicestatus }"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">合同总额：</label>
                            <div class="layui-input-inline">
                                <em id="ftotalamount"><mw:format label="money" value="${contract.ftotalamount}"/></em>(元)
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">合同数量： </label>
                            <div class="layui-input-inline">
                                ${jj:weight(contract.ftotalweight)}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">签订日期： </label>
                            <div class="layui-input-inline">
                                <mw:format label="date" value="${contract.dcontractdate}"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">买家已付金额：</label>
                            <div class="layui-input-inline">
                                <em><mw:format label="money" value="${contract.fbuyerpaid}"/></em>(元)
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">实际交收数量： </label>
                            <div class="layui-input-inline">
                                <c:choose><c:when
                                        test="${contract.fdeliveryweight gt 0 }">${jj:weight(contract.fdeliveryweight)}</c:when><c:otherwise>0</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">实际交收金额： </label>
                            <div class="layui-input-inline">
                                <em><c:choose><c:when test="${contract.fdeliveryweight gt 0 }"><mw:format label="money"
                                                                                                          value="${contract.fdeliveryfund}"/></c:when><c:otherwise>0.00</c:otherwise>
                                </c:choose></em>(元)
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">备注：</label>
                            <div class="layui-input-block">
                                ${contract.sremark}
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <table class="layui-table" id="detail" lay-filter="detail"></table>
</form>
</body>
</html>
