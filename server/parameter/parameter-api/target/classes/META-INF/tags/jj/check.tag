<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="value" type="java.lang.Integer" required="false"%>
<%@ attribute name="title" type="java.lang.String" required="false"%>
<input type="checkbox" value="" name="${name}" value="${value}" lay-skin="primary" title="${title}" ${value==1?"checked":""}>
