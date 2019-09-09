<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="fund" uri="http://www.frogsing.com/tags/fund" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款详情</title>
</head>
<body>
<div class="layui-colla-item">
    <table class="layui-table" lay-size="sm" lay-filter="detail">
        <thead>
        <tr>
            <th lay-data="{field:'spayno', width:150}">付款单号</th>
            <th lay-data="{field:'ipaytype', minWidth:150}">单据类型</th>
            <th lay-data="{field:'sbillno', minWidth:150}">业务编号</th>
            <th lay-data="{field:'sacceptmeb', minWidth:120}">收款方</th>
            <th lay-data="{field:'famount', width:100,align:'right'}">金额(元)</th>
            <th lay-data="{field:'fpayamount', width:100,align:'right'}">实际支付金额(元)</th>
            <th lay-data="{field:'iacctpaytype', width:100,align:'right'}">支付方式</th>
            <th lay-data="{field:'ipaystatus', width:120,align:'right'}">状态</th>
            <th lay-data="{field:'dpaytime', width:130,align:'right'}">付款时间</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${data}" var="obj">
            <tr>
                <td>${obj.spayno}</td>
                <td><fund:BillPaySrcType val="${obj.ipaytype}" op="label"/> </td>
                <td>${obj.sbillno}</td>
                <td>${obj.sacceptmeb.scnname}</td>
                <td><mw:format label="money" value="${obj.famount}"/></td>
                <td><mw:format label="money" value="${obj.fpayamount}"/></td>
                <td><fund:AcctcPayType val="${obj.iacctpaytype}" op="label"/> </td>
                <td><fund:BillPayStatus val="${obj.ipaystatus}" op="label"/> </td>
                <td><mw:format label="date" value="${obj.dpaytime}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<script type="text/javascript">
    layui.use(['table', 'layer', 'element'], function () {
        var table = layui.table;
        var element = layui.element;
        var layer = layui.layer;

//转换静态表格
        table.init('detail', {
            //totalRow:true,
            limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        });
    });
</script>
</body>
</html>
