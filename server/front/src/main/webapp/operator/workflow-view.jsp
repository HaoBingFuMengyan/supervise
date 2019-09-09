<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>审批流详情</title>

    <style>

        .pass{
            background: #5FB878;
            width: 16px;
            height:16px;
            line-height: 16px;
            left:-3px;
        }
        .color{
            color: #666666;
            background: #fff;
        }
        .layui-anim-rotate{
            background: #fff;
        }
    </style>
</head>
<body>
    <c:if test="${param.em == 'workflow'}">
        <%@ include file="/contract/contract-workflow.jsp"%>
    </c:if>

    <c:choose>
        <c:when test="${data.ibiztype == 0}"><%--合同--%>
            <%@ include file="workflow-common-view.jsp"%>
        </c:when>
        <c:when test="${data.ibiztype == 2}"><%--支付单--%>
            <%@ include file="workflow-billpay-view.jsp"%>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>

    <c:if test="${not empty files}">
        <%@include file="/of/common-file-view.jsp"%>
    </c:if>

    <%@include file="/operator/workflow-progress-view.jsp"%>

</body>
</html>