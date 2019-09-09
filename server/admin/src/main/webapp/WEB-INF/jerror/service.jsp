<%@ page contentType="text/html;charset=UTF-8" isErrorPage="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Exception ex=(Exception)request.getAttribute("exception");
%>
{"success":false,"msg":"<%=ex.getMessage() %>"}