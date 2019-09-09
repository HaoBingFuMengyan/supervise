<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/contract" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>发票修改</title>

    <script type="text/javascript">

        function calculateWeight(id, fprice, index) {

            var finvoiceweight = isNaN(new Number($("#" + id + "_finvoiceweight").val())) ? 0 : new Number($("#" + id + "_finvoiceweight").val());

            if (finvoiceweight > 0) {
                var finvoicemoney = getRoundValue(parseFloat(fprice) * parseFloat(finvoiceweight), 2);
                $("#" + id + "_finvoicemoney").val(finvoicemoney);

            } else
                $("#" + id + "_finvoicemoney").val('');


            editclass(id, index);
            editWeightAsMoney(id);
            calculateFpayamount();
        }

        function calculateMoney(id, fprice, index) {

            var finvoicemoney = isNaN(new Number($("#" + id + "_finvoicemoney").val())) ? 0 : new Number($("#" + id + "_finvoicemoney").val());

            if (finvoicemoney > 0) {
                var finvoiceweight = getRoundValue(parseFloat(finvoicemoney) / parseFloat(fprice), 4);
                $("#" + id + "_finvoiceweight").val(finvoiceweight);

            } else
                $("#" + id + "_finvoiceweight").val('');


            editclass(id, index);
            editWeightAsMoney(id);
            calculateFpayamount();
        }

        function editclass(id, index) {
            var finvoiceweight = isNaN(new Number($("#" + id + "_finvoiceweight").val())) ? 0 : new Number($("#" + id + "_finvoiceweight").val());
            var finvoicemoney = isNaN(new Number($("#" + id + "_finvoicemoney").val())) ? 0 : new Number($("#" + id + "_finvoicemoney").val());

            if (finvoiceweight != 0 && finvoicemoney != 0) {

                $("#" + id + "_id").attr("name", 'rd[' + index + '].id');
                $("#" + id + "_scommodityname").attr("name", 'rd[' + index + '].scommodityname');
                $("#" + id + "_sspec").attr("name", 'rd[' + index + '].sspec');
                $("#" + id + "_sproducer").attr("name", 'rd[' + index + '].sproducer');
                $("#" + id + "_fweight").attr("name", 'rd[' + index + '].fweight');
                $("#" + id + "_sweightunit").attr("name", 'rd[' + index + '].sweightunit');
                $("#" + id + "_fprice").attr("name", 'rd[' + index + '].fprice');

                $("#" + id + "_scontractdetailid").attr("name", 'scontractdetailid');
                $("#" + id + "_openweight").attr("name", 'openweight');
                $("#" + id + "_openmoney").attr("name", 'openmoney');

                $("#" + id + "_finvoiceweight").attr('name', 'rd[' + index + '].finvoiceweight');
                $("#" + id + "_finvoicemoney").attr('name', 'rd[' + index + '].finvoicemoney');
            } else {

                $("#" + id + "_id").removeAttr('name');
                $("#" + id + "_scommodityname").removeAttr('name');
                $("#" + id + "_sspec").removeAttr('name');
                $("#" + id + "_sproducer").removeAttr('name');
                $("#" + id + "_fweight").removeAttr('name');
                $("#" + id + "_sweightunit").removeAttr('name');
                $("#" + id + "_fprice").removeAttr('name');

                $("#" + id + "_scontractdetailid").removeAttr('name');
                $("#" + id + "_openweight").removeAttr('name');
                $("#" + id + "_openmoney").removeAttr('name');

                $("#" + id + "_finvoiceweight").removeAttr('name');
                $("#" + id + "_finvoicemoney").removeAttr('name');
            }
        }

        function editWeightAsMoney(id) {
            var finvoiceweight = isNaN(new Number($("#" + id + "_finvoiceweight").val())) ? '' : new Number($("#" + id + "_finvoiceweight").val());

            $("#" + id + "_openweight").val(finvoiceweight);

            var finvoicemoney = isNaN(new Number($("#" + id + "_finvoicemoney").val())) ? 0 : new Number($("#" + id + "_finvoicemoney").val());

            $("#" + id + "_openmoney").val(finvoicemoney);
        }
        //计算修改后的发票总额
        function calculateFpayamount() {

            var fpayamount = 0;//发票金额

            $.each($("#contractDetail").find("tr"), function (index, item) {
                var id = $(item).data('id');
                fpayamount = parseFloat(fpayamount) + parseFloat(isNaN(new Number($("#" + id + "_finvoicemoney").val())) ? 0 : new Number($("#" + id + "_finvoicemoney").val()));
//                var fprice = $("#" + id + "_fprice").val();//单价
//                var finvoiceweight = $("#" + id + "_finvoiceweight").val();//发票量
//
//                fpayamount = parseFloat(fpayamount) + getRoundValue(parseFloat(fprice) * parseFloat(finvoiceweight), 2);
            });

            $("#fpayamount").val(getRoundValue(fpayamount,2));
        }
    </script>
</head>
<body>

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">单据编号：${data.scode}&nbsp;<consts:BillStatus val="${data.ibillstatus}"
                                                                                 op="label"/></h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">开票方：</label>
                        <div class="layui-input-inline">
                            ${data.sellmember.scnname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">收票方： </label>
                        <div class="layui-input-inline">
                            ${data.buymember.scnname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label"><c:if test="${param.op == 'kp'}">开票</c:if><c:if test="${param.op == 'sp'}">收票</c:if>金额： </label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${data.finvoiceamount}"/></em>&nbsp;元
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">单据类型：</label>
                        <div class="layui-input-inline">
                            <consts:BillType val="${data.ibilltype}"/>(${data.sbillno})
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">发票类型： </label>
                        <div class="layui-input-inline">
                            <consts:ReceiptType val="${data.itype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label"><c:if test="${param.op == 'kp'}">开票</c:if><c:if test="${param.op == 'sp'}">收票</c:if>时间： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${data.dinvoicedate}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-block">
                        <label class="layui-form-label">备注：</label>
                        <div class="layui-input-block">
                            ${data.sremark }
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form method="post" action="${ctx}/ht/receiptInfo/modifyreceipt.shtml">
    <input type="hidden" name="id" value="${id}">
    <input type="hidden" name="itype" value="${param.itype}">
    <input type="hidden" id="fpayamount" name="fpayamount" value="${data.finvoiceamount}">

    <table class="layui-table" lay-size="sm" lay-filter="detail">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>物资名称</th>
            <th>规格</th>
            <th>生产厂家</th>
            <th>数量</th>
            <th>单价(元)</th>
            <th>金额(元)</th>
            <th>合同量</th>
            <th>已<c:if test="${param.op == 'kp'}">开</c:if><c:if test="${param.op == 'sp'}">收</c:if>量</th>
            <th>已<c:if test="${param.op == 'kp'}">开</c:if><c:if test="${param.op == 'sp'}">收</c:if>金额(元)</th>
        </tr>
        </thead>
        <tbody id="contractDetail">

        <c:forEach items="${detail}" var="obj" varStatus="objI">
            <tr data-id="${obj.id}">
                <input type="hidden" id="${obj.id}_id" name="rd[${objI.index}].id" value="${obj.id}"/>
                <input type="hidden" id="${obj.id}_scommodityname" name="rd[${objI.index}].scommodityname"
                       value="${obj.contractdetail.scommodityname}"/>
                <input type="hidden" id="${obj.id}_sspec" name="rd[${objI.index}].sspec"
                       value="${obj.contractdetail.sspec}"/>
                <input type="hidden" id="${obj.id}_sproducer" name="rd[${objI.index}].sproducer"
                       value="${obj.contractdetail.sproducer}"/>
                <input type="hidden" id="${obj.id}_fweight" name="rd[${objI.index}].fweight"
                       value="${obj.contractdetail.fweight}"/>
                <input type="hidden" id="${obj.id}_sweightunit" name="rd[${objI.index}].sweightunit"
                       value="${obj.contractdetail.sweightunit}"/>
                <input type="hidden" id="${obj.id}_fprice" name="rd[${objI.index}].fprice"
                       value="${obj.contractdetail.fprice}"/>

                <input type="hidden" id="${obj.id}_scontractdetailid" name="scontractdetailid"
                       value="${obj.contractdetail.id}">
                <input type="hidden" id="${obj.id}_openweight" name="openweight"
                       value="${obj.finvoiceweight==null?0:obj.finvoiceweight}">
                <input type="hidden" id="${obj.id}_openmoney" name="openmoney"
                       value="${obj.finvoicemoney}">
                <td>${obj.contractdetail.scommodityname}</td>
                <td>${obj.contractdetail.sspec}</td>
                <td>${obj.contractdetail.sproducer}</td>
                <td>${obj.contractdetail.fweight}&nbsp;${obj.contractdetail.sweightunit}</td>
                <td><mw:format label="money" value="${obj.contractdetail.fprice}"/></td>
                <td><mw:format label="money" value="${obj.contractdetail.fweight*obj.contractdetail.fprice}"/></td>
                <td>${obj.contractdetail.fweight}</td>
                <td>
                        <%--${obj.finvoiceweight==null?0:obj.finvoiceweight}--%>
                    <input type="text"
                           onchange="calculateWeight('${obj.id}','${obj.contractdetail.fprice}','${objI.index}')"
                           id="${obj.id}_finvoiceweight" name="rd[${objI.index}].finvoiceweight"
                           value="${obj.finvoiceweight==null?0:obj.finvoiceweight}" class="layui-input required"
                           style='background: antiquewhite'/>
                </td>
                <td>
                        <%--<mw:format label="money" value="${(obj.finvoiceweight==null?0:obj.finvoiceweight)*obj.contractdetail.fprice}"/>--%>
                    <input type="text"
                           onchange="calculateMoney('${obj.id}','${obj.contractdetail.fprice}','${objI.index}')"
                           id="${obj.id}_finvoicemoney" name="rd[${objI.index}].finvoicemoney"
                           value="${jj:money(obj.finvoicemoney)}"
                           class="layui-input required" style='background: antiquewhite'/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

<%@include file="/of/common-file-view.jsp" %>


</body>
</html>
