<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta name="decorator" content="iframe"/>

<head>
	<script src="${ctxStatic}/layer-v3.1.0/layer/layer.js"></script>
	<script type="text/javascript">

        //  top.$.jBox.closeTip();
//        if(parent.beforeRefresh)
//            parent.beforeRefresh();
//        if(parent.sortOrRefresh)
//            parent.sortOrRefresh();
//        else

        top.layer.msg("${message.title}",{icon:1},function(){
            //<c:if test="${reload}">
            parent.location.reload();
            //</c:if>
            //<c:if test="${not reload}">
            parent.layer.closeAll();
            //</c:if>
		});
        //top.$.jBox.tip("${message.title}", 'info',{opacity:0.3})

	</script>
</head>
<body>

</body>
</html>