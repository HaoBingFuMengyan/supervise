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
    <title>开票详情</title>
</head>
<body>

<div class="layui-collapse top10">
    <c:choose>
        <c:when test="${param.isCancle == 'true'}">
        <form method="post" action="${ctx}/ht/receiptInfo/canclereceipt.shtml">
        </c:when>
        <c:otherwise>
        <form method="post" action="${ctx}/ht/receiptInfo/shurereceipt.shtml">
            <input type="hidden" name="itype" value="${param.itype}"/>
        </c:otherwise>
    </c:choose>
        <input type="hidden" name="id" value="${id}"/>
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
                            <label class="layui-form-label"><c:if test="${param.op == 'kp'}">开票</c:if><c:if test="${param.op == 'sp'}">收票</c:if>日期： </label>
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
    </form>
</div>

<table class="layui-table" lay-size="sm" lay-filter="detail">
    <thead>
    <tr>
        <th lay-data="{field:'scommodityname', minWidth:150}">物资名称</th>
        <th lay-data="{field:'sspec', minWidth:150}">规格</th>
        <th lay-data="{field:'sproducer', minWidth:120}">生产厂家</th>
        <th lay-data="{field:'fweight', width:100,totalRow:true,align:'right'}">数量</th>
        <th lay-data="{field:'fprice', width:100,align:'right'}">单价(元)</th>
        <th lay-data="{field:'famount', width:120,totalRow:true,align:'right'}">金额(元)</th>
        <th lay-data="{field:'fweight', width:100,totalRow:true,align:'right'}">合同量</th>
        <th lay-data="{field:'finvoiceweight', width:140,align:'right'}">已<c:if test="${param.op == 'kp'}">开</c:if><c:if test="${param.op == 'sp'}">收</c:if>量</th>
        <th lay-data="{field:'finvoicemoney', width:140,align:'right'}">已<c:if test="${param.op == 'kp'}">开</c:if><c:if test="${param.op == 'sp'}">收</c:if>金额(元)</th>
    </tr>
    </thead>
    <tbody id="contractDetail">

    <c:forEach items="${detail}" var="obj">
        <tr>
            <td>${obj.contractdetail.scommodityname}</td>
            <td>${obj.contractdetail.sspec}</td>
            <td>${obj.contractdetail.sproducer}</td>
            <td>${jj:weight(obj.contractdetail.fweight)}&nbsp;${obj.contractdetail.sweightunit}</td>
            <td><mw:format label="money" value="${obj.contractdetail.fprice}"/></td>
            <td><mw:format label="money" value="${obj.contractdetail.fweight*obj.contractdetail.fprice}"/></td>
            <td>${obj.contractdetail.fweight}</td>
            <td>${obj.finvoiceweight==null?0:obj.finvoiceweight}</td>
            <td><mw:format label="money" value="${(obj.finvoiceweight==null?0:obj.finvoiceweight)*obj.contractdetail.fprice}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script type="text/javascript">
    layui.use(['table','layer'],function(){
        var table = layui.table;

//转换静态表格
        table.init('detail', {
            //totalRow:true,
            limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        });
    });
</script>

<%@include file="/of/common-file-view.jsp" %>


</body>
</html>
