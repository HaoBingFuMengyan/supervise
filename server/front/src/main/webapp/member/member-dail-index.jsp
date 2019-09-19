<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ taglib prefix="cs" uri="http://www.frogsing.com/tags/parameter" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>

    <title>基本信息</title>
    <meta name="decorator" charset="" content="jj">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${ctx}/of/css/centercss.css" rel="stylesheet" type="text/css"/>
    <style>
        .jg-list-con{
            width: 100%;
        }
    </style>
</head>
<body class="mbody">
<mw:msg/>
<fieldset class="layui-elem-field layui-field-title">
    <legend>监管互动</legend>
</fieldset>
<div class="jg-list-con">
    <c:forEach items="${data}" var="ms">
        <div class="jg-list">
            <div class="jg-list-head"><i
                    class="icon icon-xinxi1"></i>来自<label>${ms.ssendername}</label>对<span>${ms.sreceivename}</span>的问询
            </div>
            <div class="jg-list-body">
                <c:forEach items="${ms.messageDetails}" var="detail">
                    <div class="word">${detail.scontext}</div>
                </c:forEach>
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