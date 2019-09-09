<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款单详情</title>

</head>
<body>
<%--<c:if test="${param.em == 'approval'}">--%>
    <%--<%@include file="/fund/billpay-common-approval.jsp"%>--%>
<%--</c:if>--%>
<%--<c:if test="${param.em == 'workflow'}">--%>
    <%--<%@ include file="/contract/contract-workflow.jsp"%>--%>
<%--</c:if>--%>
<%@include file="/fund/billpay-common-view.jsp"%>
<%@include file="/of/common-file-view.jsp"%>
</body>
</html>
