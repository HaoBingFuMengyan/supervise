<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ attribute name="obj" type="com.frogsing.member.po.PayAccount" required="true" %>

<c:set var="title" value="修改"/>
<a data-id="${obj.id}" class="sure  bluefont edit_confirm">${title}</a>
