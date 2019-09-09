<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="project" uri="http://www.frogsing.com/tags/project" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="fund" uri="http://www.frogsing.com/tags/fund" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>
<!DOCTYPE>
<html>
<head>
</head>
<body>
<%--index==1 还款计划--%>
<c:if test="${index == 1}">
    <table class="layui-table" id="pledges" lay-size="sm">
        <colgroup>
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
        </colgroup>
        <thead>
        <tr>
            <th>期数</th>
            <th>应还日期</th>
            <th>应还本金</th>
            <th>应还利息</th>
            <th>累计应还本金</th>
            <th>罚息</th>
            <th>已还利息</th>
            <th>累计已还本金</th>
            <%--<th>剩余本金</th>--%>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${list}" var="sin" varStatus="ind">
            <tr data-flag="${sin.id}" id="${sin.id}_data">
                <td>${sin.ino}</td>
                <td><mw:format label="date" value="${sin.dplandate}"/></td>
                <td><mw:format label="money" value="${sin.fplanback}"/></td>
                <td><mw:format label="money" value="${sin.fplaninterest}"/></td>
                <td><mw:format label="money" value="${sin.freceivabletotal}"/></td>
                <td><mw:format label="money" value="${sin.fdefaultinterest}"/></td>
                <td><mw:format label="money" value="${sin.frealinterest}"/></td>
                <td><mw:format label="money" value="${sin.frefundtotal}"/></td>
                <%--<td><mw:format label="money" value="${sin.fless}"/></td>--%>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
<%--index==4 结算单--%>
<c:if test="${index == 4}">
        <table class="layui-table" id="pledges" lay-size="sm">
            <colgroup>
                <col width="10%">
                <col width="20%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
                <col width="20%">
                <col width="10%">
            </colgroup>
            <thead>
            <tr>
                <th>编号</th>
                <th>支付会员</th>
                <th>结算总额(元)</th>
                <th>优惠金额(元)</th>
                <th>应收金额(元)</th>
                <th>状态</th>
                <th>结算日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${list}" var="sin" varStatus="ind">
                <tr data-flag="${sin.id}" id="${sin.id}_data">
                    <td>${sin.scode}</td>
                    <td>${sin.paymber.scnname}</td>
                    <td>
                        <mw:format label="money" value="${sin.famount}"/>
                    </td>
                    <td>
                        <mw:format label="money" value="${sin.fdiscount}"/>
                    </td>
                    <td>
                        <mw:format label="money" value="${sin.freceivable}"/>
                    </td>
                    <td>
                        <project:ProjectSettleStatus op="label" val="${sin.istatus}"/>
                    </td>
                    <td>
                        <mw:format label="datetime" value="${sin.ddate}"/>
                    </td>
                    <td>
                        <div class="layui-btn-group">
                            <a onclick="project_View('结算单详情','${ctx}/projectsettle/detail_${sin.id}.shtml')" title="查看" style="color: #3366cc;cursor: pointer;">查看</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
</c:if>
<%--index==5 提货单--%>
<c:if test="${index == 5}">
    <table class="layui-table" id="pledges" lay-size="sm">
        <colgroup>
            <col width="10%">
            <col width="15%">
            <col width="15%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
        </colgroup>
        <thead>
        <tr>
            <th>提货单编号</th>
            <th>买方会员</th>
            <th>卖方会员</th>
            <th>状态</th>
            <th>是否审核</th>
            <th>提货人</th>
            <th>开单日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${list}" var="sin" varStatus="ind">
            <tr data-flag="${sin.id}" id="${sin.id}_data">
                <td>${sin.sorderno}</td>
                <td>
                    ${sin.buyer.scnname}
                </td>
                <td>

                </td>
                <td>
                    <contract:OutOrderStatus op="label" val="${sin.istatus}"/>
                </td>
                <td>
                    <consts:BoolType op="label" val="${sin.bischecked}"/>
                </td>
                <td>
                    ${sin.sdrivername}
                </td>
                <td>
                    <mw:format label="datetime" value="${sin.dorderdate}"/>
                </td>
                <td>
                    <div class="layui-btn-group">
                        <a onclick="project_View('提货单详情','${ctx}/deliveryorderandind/sell-view-${sin.id}.shtml')" title="查看" style="color: #3366cc;cursor: pointer;">查看</a>
                    </div>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
<%--index==6 入库通知单--%>
<c:if test="${index == 6}">
    <table class="layui-table" id="pledges" lay-size="sm">
        <colgroup>
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="20%">
            <col width="15%">
            <col width="10%">
            <col width="10%">
        </colgroup>
        <thead>
        <tr>
            <th>入库通知单编号</th>
            <th>状态</th>
            <th>合同编号</th>
            <th>货主</th>
            <th>通知仓库</th>
            <th>日期</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${list}" var="sin" varStatus="ind">
            <tr data-flag="${sin.id}" id="${sin.id}_data">
                <td>${sin.sorderno}</td>
                <td>
                    <contract:StockInStatus op="label" val="${sin.istatus}"/>
                </td>
                <td>

                </td>
                <td>
                    ${sin.member.scnname}
                </td>
                <td>
                    ${sin.warehouse.swarehousename}
                </td>
                <td>
                    <mw:format label="datetime" value="${sin.dorderdate}"/>
                </td>
                <td>
                    <div class="layui-btn-group">
                        <a onclick="" title="查看" style="color: #3366cc;cursor: pointer;">查看</a>
                    </div>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>
<%--index==7收付款单--%>
<c:if test="${index == 7}">
    <table class="layui-table" id="pledges" lay-size="sm">
        <colgroup>
            <col width="10%">
            <col width="10%">
            <col width="15%">
            <col width="15%">
            <col width="10%">
            <col width="15%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
        </colgroup>
        <thead>
        <tr>
            <th>单据类型</th>
            <th>编号</th>
            <th>付款方</th>
            <th>收款方</th>
            <th>金额(元)</th>
            <th>支付方式</th>
            <th>时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${list}" var="sin" varStatus="ind">
            <tr data-flag="${sin.id}" id="${sin.id}_data">
                <td>
                    <fund:BillPaySrcType op="label" val="${sin.ipaytype}"/>
                </td>
                <td>
                    ${sin.sbillno}
                </td>
                <td>
                    ${sin.ssendmeb.scnname}
                </td>
                <td>
                    ${sin.sacceptmeb.scnname}
                </td>
                <td>
                    <mw:format label="money" value="${sinfamount}"/>
                </td>
                <td>
                    <fund:AcctcPayType op="label" val="${sin.iacctpaytype}"/>
                </td>
                <td>
                    <mw:format label="datetime" value="${sin.ddate}"/>
                </td>
                <td>
                    <fund:BillPayStatus op="label" val="${sin.ipaystatus}"/>
                </td>
                <td>
                    <div class="layui-btn-group">
                        <fund:PayStartPoint receive="${sin.isendpoint}">
                            <a onclick="project_View('收款单详情','${ctx}/fund/billpay/saleBillPayView_${sin.id}.shtml')"
                               title="查看" style="color: #3366cc;cursor: pointer;">查看</a>
                        </fund:PayStartPoint>
                        <fund:PayStartPoint pay="${sin.isendpoint}">
                            <a onclick="project_View('付款单详情','${ctx}/fund/billpay/buyBillPayView_${sin.id}.shtml')"
                               title="查看" style="color: #3366cc;cursor: pointer;">查看</a>
                        </fund:PayStartPoint>
                    </div>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</c:if>

</body>
</html>
