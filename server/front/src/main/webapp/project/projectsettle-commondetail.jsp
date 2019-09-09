<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/project" %>
<%@ taglib prefix="wm" uri="http://www.frogsing.com/tags/frogsing" %>

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">结算单编号：${projectSettle.scode}&nbsp;&nbsp;&nbsp;&nbsp;项目编号：${projectSettle.project.scode}</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">收款方：</label>
                        <div class="layui-input-inline">
                            ${projectSettle.acceptmber.scnname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">付款方： </label>
                        <div class="layui-input-inline">
                            ${projectSettle.paymber.scnname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">状态： </label>
                        <div class="layui-input-inline">
                            <project:ProjectSettleStatus op="label" val="${projectSettle.istatus}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">结算金额：</label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${projectSettle.famount}"/></em>&nbsp;元
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">优惠金额： </label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${projectSettle.fdiscount}"/></em>&nbsp;元
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">实收金额：</label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${projectSettle.freceivable}"/></em>元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label  class="layui-form-label">申请时间： </label>
                        <div class="layui-input-inline">
                            <mw:format label="datetime" value="${projectSettle.ddate}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">结算日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${projectSettle.dsettledate}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">支付时间： </label>
                        <div class="layui-input-inline">
                            <mw:format label="datetime" value="${projectSettle.dpaydate}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-block">
                        <label  class="layui-form-label">备注：</label>
                        <div class="layui-input-block">
                            ${projectSettle.sremark}
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
        <th lay-data="{field:'isubject', width:100,totalRowText:'合计：'}">科目</th>
        <th lay-data="{field:'dend', width:180}">结算周期</th>
        <th lay-data="{field:'fsettleamount', width:120,totalRow:true,align:'right'}">结算金额(元)</th>
        <th lay-data="{field:'fdiscount', width:120,totalRow:true,align:'right'}">优惠金额(元)</th>
        <th lay-data="{field:'freceivable', width:120,totalRow:true,align:'right'}">应收金额(元)</th>
        <th lay-data="{field:'sremark'}">说明</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${projectSettle.projectSettleDetails}" var="obj">
        <tr>
            <td><consts:ProjectSettleSubject val="${obj.isubject}"/></td>
            <td>
                <%--<c:if test="${obj.isubject==10||obj.isubject==30||obj.isubject==40}">--%>
                    <wm:format label="date" value="${obj.dstart}"/>至<wm:format label="date" value="${obj.dend}"/>
                <%--</c:if>--%>
            </td>
            <td><wm:format label="money" value="${obj.fsettleamount}"/></td>
            <td><wm:format label="money" value="${obj.fdiscount}"/></td>
            <td><wm:format label="money" value="${obj.freceivable}"/></td>
            <td>${obj.sremark}</td>
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



