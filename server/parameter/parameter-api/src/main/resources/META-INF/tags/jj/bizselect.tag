<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="parameter" uri="http://www.frogsing.com/tags/parameter" %>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<%@ attribute name="name" type="java.lang.String" required="false"%>
<%@ attribute name="value" type="java.lang.String" required="false"%>
<%@ attribute name="biz" type="java.lang.String" required="true"%>

<%@ attribute name="isrequired" type="java.lang.String" required="false"%>
<%@ attribute name="placeholder" type="java.lang.String" required="false"%>

<div class="layui-form-select">
    <div class="layui-select-title">
        <input type="text" id="${id}" name="${name}" value="${value}" class="layui-input <c:if test="${isrequired =='true'}"> required</c:if>" placeholder="${placeholder}"/>
        <i class="layui-edge"></i>
    </div>
</div>
<script>
    var data=  [
        <c:forEach var="s" items="${parameter:biz(biz)}" varStatus="x">

        {title:"${s}"},
        </c:forEach>
        {title:""}
    ];
    $("#${id}").bigAutocomplete(
        {
            data: data
            ,
            click: 'true',
            select: true
        });
</script>