<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.frogsing.heart.log.Lg" %>
<%
	Throwable ex = null;
	ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");

	Lg.act(ex.getMessage(),ex);
%>{"success":false,"code:":500,"msg":"500"}
