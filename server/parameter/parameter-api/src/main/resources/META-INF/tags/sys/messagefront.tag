<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="content" type="com.frogsing.heart.web.Msg" required="true" description="消息对象"%>
<script type="text/javascript">
$(document).ready(function(){
    $("#messageBox").click(function () {
        $("#messageBox").slideUp("slow");
    })
});

</script>
<c:if test="${not empty content}">
	<div id="messageBox" class="alert alert-${content.metype}">
		<button data-dismiss="alert" class="close">×</button>${content.title}
	</div>
</c:if>