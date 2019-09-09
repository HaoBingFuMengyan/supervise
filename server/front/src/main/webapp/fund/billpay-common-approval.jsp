<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>

<script type="text/javascript">
    jj.validate("#formx");
</script>
<form action="${ctx}/fund/billpay/approval.json" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">
    <input type="hidden" name="id" value="${obj.id}">

    <div class="layui-collapse top10">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">
                审批流
            </h2>
            <div class="layui-colla-content layui-show">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            名称
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="sname" name="sname" autocomplete="off" placeholder="请输入名称" value="“煤亮子”煤炭生产综合服务平台<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">采购</c:when><c:otherwise>销售</c:otherwise></c:choose>合同" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            领款单位全称
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="ssignbody" name="ssignbody" autocomplete="off" placeholder="请输入主体" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.scnname}</c:when><c:otherwise>${obj.ssendmeb.scnname}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            金额（元）
                        </label>
                        <div class="layui-input-block">
                            <input type="text" autocomplete="off" placeholder="请输入金额" value="<mw:format label="money" value="${obj.famount}"/>" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            收款人全称
                        </label>
                        <div class="layui-input-block">
                            <input type="text" autocomplete="off" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.scnname}</c:when><c:otherwise>${obj.ssendmeb.scnname}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            开户行
                        </label>
                        <div class="layui-input-block">
                            <input type="text" autocomplete="off" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.sopenname}</c:when><c:otherwise>${obj.ssendmeb.sopenname}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            账号
                        </label>
                        <div class="layui-input-block">
                            <input type="text" autocomplete="off" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.sopenaccount}</c:when><c:otherwise>${obj.ssendmeb.sopenaccount}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">支付事由</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入资信简介" class="layui-textarea" id="screditbrief" name="screditbrief"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>

</form>

