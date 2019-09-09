<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
    <meta name="decorator" content="default"/>
    <title>煤亮子-商品详情</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style>
        .layui-layer{
            top:40%!important;
        }
    </style>

    <script type="text/javascript">
        window.onload = function () {(
            setInterval(function () {
                var second = parseInt($("#second").text());
                if (second == 0){
                    if (${type == 'fxhzy'})
                        window.location.href="${ctx}/margincontract/buylist.shtml";
                    else
                        window.location.href="${ctx}/contract/gplist.shtml";
                    return;
                }
                $("#second").text(parseInt(second - 1));
            },1000)
        )};

    </script>
</head>
<body>
<div class="mei-view">
    <div class="mycon">
        <div class="tips-con">
            <img src="${ctx}/images/tips-ok.png" />
            <p>提交订单成功，<i id="second">5</i>s后跳转订单合同页面...</p>
            <c:choose>
                <c:when test="${type == 'fxhzy'}">
                    <a href="${ctx}/margincontract/buylist.shtml">立即跳转</a>
                </c:when>
                <c:otherwise>
                    <a href="${ctx}/contract/gplist.shtml">立即跳转</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>
