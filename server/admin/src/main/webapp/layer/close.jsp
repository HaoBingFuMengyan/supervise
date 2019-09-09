<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript">
        //  top.$.jBox.closeTip();


        if(parent.jjer)
            parent.jjer.jj.msg_reload("${message.title}");
        else
        if(parent.jj){
            parent.jj.msg_reload("${message.title}");
        }
        else{

            if(parent.beforeRefresh)
                parent.beforeRefresh();
            if(parent.sortOrRefresh)
                parent.sortOrRefresh();
            //top.$.jBox.tip("${message.title}", 'info',{opacity:0.3})
            top.layer.msg("${message.title}",{icon:1,time:2000},function () {

            });
//            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
//            parent.layer.close(index); //再执行关闭
        }

	</script>
</head>
</html>