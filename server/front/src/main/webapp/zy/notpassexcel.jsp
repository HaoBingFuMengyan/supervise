<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<%@ include file="/include/taglib.jsp" %>
<script type="text/javascript">
    NOTPASSEXCEL = ${NOTPASSEXCEL};
</script>

<table class="layui-table" lay-size="sm" lay-filter="notPass" style="width: 210%">
    <thead>
    <tr>
        <th lay-data="{field:'index', minWidth:70}">序号</th>
        <th lay-data="{field:'message', minWidth:150}">错误消息</th>
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
            <td class="red">${obj.serrormsg}</td>
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
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].dstockweight" value="${obj.fstockweight}"/>${obj.fstockweight}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sstorelocation" value="${obj.sstorelocation}"/>${obj.sstorelocation}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sownername" value="${obj.sownername}"/>${obj.sownername}</td>
            <td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].ideliverydays" value="${obj.ideliverydays}"/>${obj.ideliverydays}</td>
            <%--<td><input type="hidden" name="acceptMap['accept${Index.index + 1}'].sremark" value="${obj.sremark}"/>${obj.sremark}</td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
<c:if test="${error == 'error'}">
    <div class="layui-table-body layui-table-main">
        <div class="layui-none red">请仔细检查Excel含税代理单价（元）、货物类型、货品类型、库存数量和供货周期（天）是否为数字</div>
    </div>
</c:if>

