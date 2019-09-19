
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
    <c:forEach items="${data}" var="ms">
        <div class="jg-list">
            <div class="jg-list-head"><i class="icon icon-xinxi1"></i>来自<label>金融办</label>对<span>测试有限公司</span>的问询
                <p>未回复</p>
            </div>
            <div class="jg-list-body">
                <div class="word">贵司连续2年未提交工商年报，请注意！</div>
                <div class="reword clearfix">
                    <textarea placeholder="请回复信息..."></textarea>
                    <button class="layui-btn layui-btn-sm layui-btn-normal">确认回复</button>
                </div>

            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
