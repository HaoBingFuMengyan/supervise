<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mw" uri="http://www.frogsing.com/tags/frogsing" %>
<%--
  Created by IntelliJ IDEA.
  User: fanyijie
  Date: 2017/11/8
  Time: 下午3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="decorator" content="iframe"/>

    <title>Title</title>
</head>
<body>
<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="150">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>操作人</th>
        <th>事件</th>
        <th>时间</th>
    </tr>

    </thead>

    <tbody>
    <c:forEach  var="obj" items="${list.content}">
        <tr>
            <td>${obj.saddoperator}</td>
            <td>${obj.soperateremark}</td>
            <td><mw:format label="datetime" value="${obj.dadddate}" /></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
</html>
