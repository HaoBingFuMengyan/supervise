<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/contract" %>


<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">合同编号：${marginContract.scontractsellerno}&nbsp;&nbsp;&nbsp;&nbsp;合同进度：<consts:DeliveryStatus val="${marginContract.ideliverystatus}" /></h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">采购商：</label>
                        <div class="layui-input-inline">
                            ${marginContract.sbuyermembername}
                        </div>
                    </div>
                    <%--<div class="layui-inline">--%>
                        <%--<label  class="layui-form-label">交货仓库： </label>--%>
                        <%--<div class="layui-input-inline">--%>
                            <%--${marginContract.swarehouse}--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<c:if test="${marginContract.imodeltype == 10}">--%>
                        <%--<div class="layui-inline">--%>
                            <%--<label  class="layui-form-label">项目编号： </label>--%>
                            <%--<div class="layui-input-inline">--%>
                                    <%--${marginContract.sorderno}--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</c:if>--%>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label  class="layui-form-label">货款支付状态： </label>
                        <div class="layui-input-inline">
                            <consts:PaymentStatus val="${marginContract.ipaymentstatus }"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">货物交收状态： </label>
                        <div class="layui-input-inline">
                            <consts:DeliveryStatus val="${marginContract.ideliverystatus}" />
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">开票状态： </label>
                        <div class="layui-input-inline">
                            <consts:IInvoiceStatus val="${marginContract.iinvoicestatus }"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">合同总额：</label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${marginContract.ftotalamount}"/></em>(元)
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">合同数量： </label>
                        <div class="layui-input-inline">
                            ${marginContract.ftotalweight}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">签订日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${marginContract.dcontractdate}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">买家已付金额：</label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${marginContract.fbuyerpaid}"/></em>(元)
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">实际交收数量： </label>
                        <div class="layui-input-inline">
                            <c:choose><c:when test="${marginContract.fdeliveryweight gt 0 }">${jj:weight(marginContract.fdeliveryweight)}</c:when><c:otherwise>0</c:otherwise> </c:choose>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">实际交收金额： </label>
                        <div class="layui-input-inline">
                            <em><c:choose><c:when test="${marginContract.fdeliveryweight gt 0 }"><mw:format label="money" value="${marginContract.fdeliveryfund}"/></c:when><c:otherwise>0.00</c:otherwise> </c:choose></em>(元)
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-block">
                        <label  class="layui-form-label">备注：</label>
                        <div class="layui-input-block">
                            ${marginContract.sremark}
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
        <th lay-data="{field:'scommodityname', minWidth:150}">物资名称</th>
        <th lay-data="{field:'sspec', minWidth:150}">规格</th>
        <th lay-data="{field:'sproducer', minWidth:120}">生产厂家</th>
        <th lay-data="{field:'fweight', width:100,totalRow:true,align:'right'}">数量</th>
        <th lay-data="{field:'fprice', width:100,align:'right'}">单价(元)</th>
        <th lay-data="{field:'famount', width:120,totalRow:true,align:'right'}">金额(元)</th>
        <th lay-data="{field:'foutweight', width:100,totalRow:true,align:'right'}">交收量</th>
        <th lay-data="{field:'foutprice', width:140,align:'right'}">交收单价金额(元)</th>
        <th lay-data="{field:'foutamount', width:140,totalRow:true,align:'right'}">交收金额金额(元)</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${marginContract.contractDetailList}" var="obj">
        <tr>
            <td>${obj.scommoditysystemcode}</td>
            <td>${obj.scommodityname}</td>
            <td>${obj.sspec}</td>
            <td>${obj.sproducer}</td>
            <td>${obj.fweight}&nbsp;${obj.sweightunit}</td>
            <td><mw:format label="money" value="${obj.fprice}"/></td>
            <td><mw:format label="money" value="${obj.fweight*obj.fprice}"/></td>
            <td>${jj:weight(obj.foutweight)}</td>
            <td><mw:format label="money" value="${obj.foutprice}"/></td>
            <td><mw:format label="money" value="${obj.foutamount}"/></td>
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
