<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://www.frogsing.com/tags/shiro" %>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="event" type="java.lang.String" required="true"%>
<%@ attribute name="icon" type="java.lang.String" required="false"%>
<%@ attribute name="title" type="java.lang.String" required="false"%>
<%@ attribute name="purview" type="java.lang.String" required="false"%>
<%@ attribute name="css" type="java.lang.String" required="false" %>


<c:if test="${empty icon}">
    <c:if test="${fn:startsWith(event,'add')}">
        <c:set var="icon" value="fa fa-plus" />
    </c:if>
    <c:if test="${fn:startsWith(event,'edit')}">
        <c:set var="icon" value="fa fa-file-text-o" />
    </c:if>
    <c:if test="${fn:startsWith(event,'del')}">
        <c:set var="icon" value="fa fa-trash-o" />
    </c:if>
    <c:if test="${fn:startsWith(event,'refresh')}">
        <c:set var="icon" value="glyphicon glyphicon-repeat" />
    </c:if>
    <c:if test="${fn:startsWith(event,'reload')}">
        <c:set var="icon" value="fa fa-search" />
    </c:if>
    <c:if test="${fn:startsWith(event,'reset')}">
        <c:set var="icon" value="fa fa-refresh" />
    </c:if>
    <c:if test="${fn:startsWith(event,'export')}">
        <c:set var="icon" value="fa fa-exchange" />
    </c:if>
    <c:if test="${fn:startsWith(event,'exportAll')}">
        <c:set var="icon" value="fa fa-download" />
    </c:if>
</c:if>
<c:if test="${empty css}">
    <c:set var="css" value="layui-btn  layui-btn-sm" />
</c:if>

<c:if test="${empty purview}">
    <button lay-event="${event}" data-type="${event}" class="${css} " data-toggle="tooltip" data-placement="left" title="${title==null?name:title}"><c:if test="${not empty icon}"><i class="${icon}"></i></c:if>${name}</button>
</c:if>
<c:if test="${not empty purview}">
    <shiro:hasAnyPermission name="${purview}">
        <button lay-event="${event}" data-type="${event}" class="${css} " data-toggle="tooltip" data-placement="left" title="${title==null?name:title}"><c:if test="${not empty icon}"><i class="${icon}"></i></c:if>${name}</button>
    </shiro:hasAnyPermission>
</c:if>
