<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="decorator" content="jj"/>
    <title>修改计息日</title>

    <script type="text/javascript">
        layui.use(['layer', 'laydate','form','upload'], function(){
            var laydate = layui.laydate;

            jj.validate("#formx");
            //日期
            laydate.render({
                elem: '#dintereststart'
            });
        });
    </script>
</head>
<body>
<form class="layui-form" id="formx" action="${ctx}/projectstock/saveinterestdate.json" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${obj.id}"/>

    <div class="layui-form-item" style="margin-top: 20px;" >
        <label class="layui-form-label">计息日</label>
        <div class="layui-input-block">
            <input type="text" style="width: 403px;" id="dintereststart" name="dintereststart"
                   value='<mw:format label="date" value="${obj.dintereststart }" format="yyyy-MM-dd"/>' required lay-verify="required" placeholder="(必填项)"   class="layui-input" autocomplete="off"/>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入备注" class="layui-textarea" style="height: 248px;" name="sremark">${obj.sremark }</textarea>
        </div>
    </div>

</form>
</body>
</html>
