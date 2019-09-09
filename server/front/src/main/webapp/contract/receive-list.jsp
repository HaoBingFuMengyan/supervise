<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>收票详情</title>
</head>
<body>
<div class="layui-colla-item">
    <table class="layui-table" lay-size="sm" lay-filter="detail">
        <thead>
        <tr>
            <th lay-data="{field:'scode', width:150}">单据编号</th>
            <th lay-data="{field:'sbillno', minWidth:150}">合同编号</th>
            <th lay-data="{field:'ssellmemberid', minWidth:150}">开票方</th>
            <th lay-data="{field:'itype', minWidth:120}">开票类型</th>
            <th lay-data="{field:'ibilltype', width:100,align:'right'}">单据类型</th>
            <th lay-data="{field:'ibillstatus', width:100,align:'right'}">状态</th>
            <th lay-data="{field:'finvoiceamount', width:120,align:'right'}">开票金额(元)</th>
            <th lay-data="{field:'dinvoicedate', width:130,align:'right'}">开票时间</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${data}" var="obj">
            <tr>
                <td>${obj.scode}</td>
                <td>${obj.sbillno}</td>
                <td>${obj.sellmember.scnname}</td>
                <td><contract:ReceiptType val="${obj.itype}" op="label"/></td>
                <td><contract:BillType val="${obj.ibilltype}" op="label"/></td>
                <td><contract:BillStatus val="${obj.ibillstatus}" op="label"/></td>
                <td><mw:format label="money" value="${obj.finvoiceamount}"/></td>
                <td><mw:format label="date" value="${obj.dinvoicedate}"/></td>
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
