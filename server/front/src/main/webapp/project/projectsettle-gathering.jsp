<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="project" uri="http://www.frogsing.com/tags/project" %>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>生成收款单</title>
</head>
<body>
<sys:message content="${message}"/>
<jsp:include page="projectsettle-commondetail.jsp"/>

<form action="${ctx}/projectsettle/projectsettlegathering.shtml" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">
            <input type="hidden" id="fpayamountinput" name="fpayamount" value="${projectSettle.freceivable}">
            <input type="hidden" id="nullid">
            <input type="hidden" name="id" id="id" value="${projectSettle.id }"/>
            <input type="hidden" name="freceivable" id="freceivable" value="${projectSettle.freceivable }"/>
            <p class="legend"></p>
</form>
</body>
</html>
