<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="value" type="java.lang.Integer" required="false"%>
<%@ attribute name="items" type="java.util.Map" required="true"%>
<c:forEach items="${items}" var="t">
    <input type="radio" name="${name}" value="${t.key}" title="${t.value}" <c:if test="${value eq t.key}">checked</c:if>>
</c:forEach>