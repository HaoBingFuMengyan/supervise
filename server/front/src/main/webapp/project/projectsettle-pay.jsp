<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="project" uri="http://www.frogsing.com/tags/project" %>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="iframe"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>生成付款单</title>
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/of/css/common.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <link href="${ctxStatic}/jj/jj.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<sys:message content="${message}"/>
<jsp:include page="projectsettle-commondetail.jsp"/>

<form action="${ctx}/projectsettle/projectsettlepay.shtml" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend class="normal">付款单明细</legend>
        <div class="mform">
            <input type="hidden" id="nullid">
            <input type="hidden" name="id" id="id" value="${projectSettle.id }"/>
            <input type="hidden" name="freceivable" id="freceivable" value="${projectSettle.freceivable }"/>
            <p class="legend"></p>
            <fieldset>
                <div>
                    <label>需支付金额</label>
                    ${projectSettle.freceivable}元
                </div>
                <div>
                    <label>付款金额</label>
                    <input type="text" id="fpayamountinput" autocomplete="off" name="fpayamount" readonly="readonly" value="${projectSettle.freceivable}" aria-required="true" aria-invalid="true" class="error readonly">
                </div>
                <%--<div>--%>
                    <%--<label>交易密码</label>--%>
                    <%--<input type="password" id="stradepassword" name="stradepassword" autocomplete="off" aria-invalid="false" class="valid">--%>
                <%--</div>--%>
                <div>
                    <label>备注</label>
                    <textarea rows="5" cols="30" id="sremark" name="sremark"></textarea>
                </div>

            </fieldset>

        </div>
    </fieldset>
</form>
</body>
</html>
