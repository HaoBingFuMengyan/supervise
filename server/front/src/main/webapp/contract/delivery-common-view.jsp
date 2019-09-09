<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">提货单编号：${deliveryorder.sorderno}&nbsp;&nbsp;&nbsp;&nbsp;项目编号：${deliveryorder.project.scode}
            &nbsp;&nbsp;&nbsp;&nbsp;合同编号：${deliveryorder.contract.scontractsellerno}</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">提货仓库：</label>
                        <div class="layui-input-inline">
                            ${deliveryorder.warehouse.swarehousename}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">提货会员：</label>
                        <div class="layui-input-inline">
                            ${deliveryorder.buyer.scnname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">状态： </label>
                        <div class="layui-input-inline">
                            <contract:OutOrderStatus op="label" val="${deliveryorder.istatus}" />
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label  class="layui-form-label">开单日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${deliveryorder.dorderdate}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">是否审核： </label>
                        <div class="layui-input-inline">
                            <consts:BoolType op="label" val="${deliveryorder.bischecked}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">联系电话： </label>
                        <div class="layui-input-inline">
                            ${deliveryorder.smobile}
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">提货人：</label>
                        <div class="layui-input-inline">
                            ${deliveryorder.sdrivername}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">提货证件号： </label>
                        <div class="layui-input-inline">
                            ${deliveryorder.scardno}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">车牌号： </label>
                        <div class="layui-input-inline">
                            ${deliveryorder.scarno}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">是否出库完成：</label>
                        <div class="layui-input-inline">
                            <consts:BoolType op="label" val="${deliveryorder.bisfinish}"/>
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">出库日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${deliveryorder.dwarehouseoutdate}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">提货日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${deliveryorder.dvaliddate}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-block">
                        <label  class="layui-form-label">备注：</label>
                        <div class="layui-input-block" >
                            ${deliveryorder.sremark}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<table class="layui-table" lay-size="sm" lay-filter="detail">
    <thead>
    <tr>
        <th lay-data="{field:'scommoditycode', width:150,totalRowText:'合计：'}">物资编码</th>
        <th lay-data="{field:'scommodityname'}">品名</th>
        <th lay-data="{field:'sspec'}">规格</th>
        <th lay-data="{field:'sproducer'}">厂家</th>
        <th lay-data="{field:'foderweight', width:120,totalRow:true,align:'right'}">开单量</th>
        <th lay-data="{field:'finweight', width:120,totalRow:true,align:'right'}">出库量</th>
        <th lay-data="{field:'bisfinish', width:120}">是否出库完成</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${deliveryorder.details}" var="obj">
        <tr class="headerrow">
            <td>${obj.indenture.scodegood}</td>
            <td>${obj.indenture.scommodityname}</td>
            <td>${obj.indenture.sspec}</td>
            <td>${obj.indenture.sproducer}</td>
            <td>${obj.foderweight}</td>
            <td>${obj.foutweight}</td>
            <td><consts:BoolType op="label" val="${deliveryorder.bisfinish}"/></td>
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

