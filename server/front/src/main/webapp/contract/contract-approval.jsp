<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/contract" %>

<script type="text/javascript">
    jj.validate("#formx");
</script>
<form action="${ctx}/contract/approval.json" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">
    <input type="hidden" name="id" value="${contract.id}">

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
                            <input type="text" id="sname" name="sname" autocomplete="off" placeholder="请输入名称" value="“基金协同监管系统沟通”煤炭生产综合服务平台<c:choose><c:when test="${contract.icontracttype == 0}">采购</c:when><c:otherwise>销售</c:otherwise></c:choose>合同" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            签约主体
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="ssignbody" name="ssignbody" autocomplete="off" placeholder="请输入主体" value="<c:choose><c:when test="${contract.icontracttype == 0}">${contract.ssellermembername}</c:when><c:otherwise>${contract.sbuyermembername}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            履约期限（月）
                        </label>
                        <div class="layui-input-block">
                            <input type="text" autocomplete="off" placeholder="请输入履约期限" value="${contract.project.icycle}" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            合同金额（元）
                        </label>
                        <div class="layui-input-block">
                            <input type="text" autocomplete="off" placeholder="请输入合同金额" value="<mw:format label="money" value="${contract.ftotalamount}"/>" readonly="readonly" class="layui-input" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">对方资信简介</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入资信简介" class="layui-textarea" id="screditbrief" name="screditbrief"></textarea>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">合同主要内容</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入合同主要内容" class="layui-textarea" id="sdesc" name="sdesc"></textarea>
                    </div>
                </div>

            </div>
        </div>
    </div>

</form>

