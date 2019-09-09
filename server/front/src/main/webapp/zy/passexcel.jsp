<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>

<script type="text/javascript">
    PASSEXCEL = ${PASSEXCEL};
</script>

<table class="layui-table" lay-size="sm" lay-filter="pass" style="width: 210%">
    <thead>
    <tr>
        <th lay-data="{field:'index', minWidth:70}">序号</th>
        <%--<th lay-data="{field:'igoodstype', width:100,totalRow:true,align:'right'}">货物类型</th>--%>
        <th lay-data="{field:'scategory', minWidth:150}">品种名称</th>
        <th lay-data="{field:'scommodityname', minWidth:150}">物资名称</th>
        <th lay-data="{field:'sspec', minWidth:150}">规格型号</th>
        <th lay-data="{field:'sproducer', minWidth:120}">生产厂家</th>
        <%--<th lay-data="{field:'shostname', width:60}">所属主机</th>--%>
        <%--<th lay-data="{field:'shostmodel', width:100,totalRow:true,align:'right'}">主机型号</th>--%>
        <%--<th lay-data="{field:'shostbrand', width:120,align:'right'}">主机生产厂家</th>--%>
        <th lay-data="{field:'ftaxprice', width:120,align:'right'}">含税单价（元）</th>
        <th lay-data="{field:'dstockweight', width:100,totalRow:true,align:'right'}">库存数量</th>
        <th lay-data="{field:'sstorelocation', width:100,totalRow:true,align:'right'}">储存地点</th>
        <th lay-data="{field:'sownername', width:100,totalRow:true,align:'right'}">供应商</th>
        <th lay-data="{field:'ideliverydays', width:60,totalRow:true,align:'right'}">供货周期（天）</th>
        <%--<th lay-data="{field:'sremark', minWidth:150}">备注</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="obj" varStatus="Index">
        <tr>
            <td>${Index.index + 1}</td>
            <%--<td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].igoodstype" value="${obj.igoodstype}"/><resource:GoodsType val="${obj.igoodstype}"/> </td>--%>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].scategory" value="${obj.scategory}"/>${obj.scategory}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].scommodityname" value="${obj.scommodityname}"/>${obj.scommodityname}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sspec" value="${obj.sspec}"/>${obj.sspec}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sproducer" value="${obj.sproducer}"/>${obj.sproducer}</td>
            <%--<td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].shostname" value="${obj.shostname}"/>${obj.shostname}</td>--%>
            <%--<td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].shostmodel" value="${obj.shostmodel}"/>${obj.shostmodel}</td>--%>
            <%--<td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].shostbrand" value="${obj.shostbrand}"/>${obj.shostbrand}</td>--%>
            <td>
                <input type="hidden" name="acceptMap['accept${Index.index + 1}'].ftaxprice" value="${obj.ftaxprice}"/>
                <input type="hidden" name="acceptMap['accept${Index.index + 1}'].fprotocolprice" value="${obj.fprotocolprice}"/>
                ${mw:money(obj.ftaxprice)}
            </td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].fstockweight" value="${obj.fstockweight}"/>${obj.fstockweight}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sstorelocation" value="${obj.sstorelocation}"/>${obj.sstorelocation}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sownername" value="${obj.sownername}"/>${obj.sownername}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].ideliverydays" value="${obj.ideliverydays}"/>${obj.ideliverydays}</td>
            <%--<td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sremark" value="${obj.sremark}"/>${obj.sremark}</td>--%>
            <input type="hidden" name="acceptMap['accept${Index.index + 1}'].scommodityid" value="${obj.scommodityid}"/>
        </tr>
    </c:forEach>
    </tbody>
</table>
<c:if test="${message.title != null && message.title != ''}">
    <div class="layui-table-body layui-table-main">
        <div class="layui-none red">${message.title}</div>
    </div>
</c:if>
