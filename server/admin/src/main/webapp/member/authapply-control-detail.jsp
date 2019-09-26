<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>

    <title>基本信息</title>
    <meta name="decorator" charset="" content="jj">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
<body>
<table class="layui-table" lay-size="sm" lay-filter="detail">
    <thead>
    <tr>
        <th lay-data="{field:'isortno', width:150,totalRowText:'合计：'}">排序号</th>
        <th lay-data="{field:'sname', width:200}">实际控制人名称</th>
        <th lay-data="{field:'icardtype', width:180}">证件类型</th>
        <th lay-data="{field:'ssocialcreditno', width:240}">证件号码</th>
        <th lay-data="{field:'icomtype', width:180}">实际控制人类型</th>
        <th lay-data="{field:'icontroltype', width:150}">控制方式</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${list}" var="obj" varStatus="ind">
        <tr>
            <td>${obj.isortno}</td>
            <td>${obj.sname}</td>
            <td>
                <member:CardType op="label" val="${obj.icardtype}"/>
            </td>
            <td>${obj.ssocialcreditno}</td>
            <td>
                <member:ComType op="label" val="${obj.icomtype}"/>
            </td>
            <td>
                <member:ControlType op="label" val="${obj.icontroltype}"/>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<script type="text/javascript">
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
//转换静态表格
        table.init('detail', {
            //totalRow:true,
            limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        });
    });
</script>
</body>
</html>