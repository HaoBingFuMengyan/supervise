<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/fund" %>


<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">付款单号：${obj.spayno}</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">支付类型：</label>
                        <div class="layui-input-inline">
                            <consts:AcctcPayType op="label" val="${obj.iacctpaytype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">支付金额： </label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${obj.famount }" /></em>&nbsp;元
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">实际支付金额： </label>
                        <div class="layui-input-inline">
                            <em><mw:format label="money" value="${obj.fpayamount}" /></em>&nbsp;元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">付款方：</label>
                        <div class="layui-input-inline">
                            ${obj.ssendmeb.scnname }
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">收款方： </label>
                        <div class="layui-input-inline">
                            ${obj.sacceptmeb.scnname }
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">支付状态： </label>
                        <div class="layui-input-inline">
                            <consts:BillPayStatus val="${obj.ipaystatus }"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label  class="layui-form-label">业务类型： </label>
                        <div class="layui-input-inline">
                            <consts:BillPaySrcType val="${obj.ipaytype }"/>(${obj.sbillno})
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">备注：</label>
                        <div class="layui-input-inline">
                            ${obj.sremark }
                        </div>
                    </div>
                </div>
                <c:if test="${obj.ipaystatus==99 }">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label  class="layui-form-label">作废原因</label>
                            <div class="layui-input-block">
                                    ${obj.scancelremark }
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
