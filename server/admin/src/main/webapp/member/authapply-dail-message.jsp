
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <title>监管问询</title>
    <meta name="decorator" charset="" content="jj">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/common/css/style.css" type="text/css" />
</head>
<body>
<div class="jg-list-con">
    <div class="jg-list">
        <div class="jg-list-head"><i class="icon icon-xinxi1"></i>对<span>${param.scnname}</span>发起问询
        </div>
        <div class="jg-list-body" style="padding-bottom: 60px">
            <div class="reword clearfix">
                <textarea placeholder="请输入..."></textarea>
                <button class="layui-btn layui-btn-sm layui-btn-normal">确认</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
