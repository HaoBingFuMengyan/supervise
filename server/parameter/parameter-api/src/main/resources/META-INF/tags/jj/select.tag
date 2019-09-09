<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="value" type="java.lang.Integer" required="false"%>
<%@ attribute name="items" type="java.util.Map" required="true"%>
<%@ attribute name="isrequired" type="java.lang.String" required="false"%>
<%@ attribute name="placeholder" type="java.lang.String" required="false"%>
<%@ attribute name="exlude" type="java.lang.String" required="false"%>

<c:set var="id" value="${empty id?name:id}"/>

<div class="layui-form-select">
    <div class="layui-select-title">
        <input type="text" id="${id}"   class="layui-input <c:if test="${isrequired =='true'}"> required</c:if>" placeholder="${placeholder}"/>
        <input type="hidden" name="${name}" id="hd_${id}"  value="${value}"/>
        <i class="layui-edge"></i>
    </div>
</div>
<script>

    $(document).ready(function(){

        var __data=  [
            <c:forEach var="s" items="${items}" varStatus="x">
            <c:if test="${empty exlude || (exlude != s.value && exlude != s.key )}" >
              {title:"${s.value}",id:'${s.key}'},
            </c:if>
            </c:forEach>
            {title:""}
        ];

        $('hd_${id}').val(__data['${value}']);
        $("#${id}").bigAutocomplete(
            {
                data: __data,
                click: 'true',
                select: true,
                callback: function (data) {
                    $('#${id}').val(data.title);
                    $('#hd_${id}').val(data.id);
                }
            });
    });

</script>