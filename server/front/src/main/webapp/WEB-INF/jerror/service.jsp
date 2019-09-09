<%@ page import="javax.frogsing.exception.ServiceException" %>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ServiceException ex=(ServiceException)request.getAttribute("exception");

%>
{"success":false,"msg":"<%=ex.getMessage().replaceAll("\"","") %>",code:"<%=ex.getCode()%>"}