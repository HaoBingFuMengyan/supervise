<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="url" type="java.lang.String" required="true"%>
<%@ attribute name="title" type="java.lang.String" required="true"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>
<%@ attribute name="height" type="java.lang.String" required="false"%>
<%@ attribute name="target" type="java.lang.String" required="false"%>
<%@ attribute name="label" type="java.lang.String" required="false"%>
<%@ attribute name="max" type="java.lang.String" required="false"  %>
<c:if test="${empty max}" >
    <c:set var="max" value="true" />
</c:if>
<c:if test="${empty target}" >
    <c:set var="target" value="''" />
</c:if>
<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="add()" title="添加"><i class="fa fa-plus"></i> ${label==null?'添加':label}</button>
<%-- 使用方法： 1.将本tag写在查询的form之前；2.传入table的id和controller的url --%>
<script type="text/javascript">
	function add(){
	    if(${max}){
            openHref("${url}",false,${target});
        }else{
            openlog("新增"+'${title}',"${url}","${width==null?'800px':width}", "${height==null?'500px':height}",${target});

        }
	}
</script>