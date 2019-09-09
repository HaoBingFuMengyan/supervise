<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="decorator" content="jj"/>
    <title>资源挂牌</title>


    <script type="text/javascript">
        layui.use(['layer', 'form', 'upload'], function () {
            var form = layui.form;
            jj.validate("#searchForm");

            //监听指定开关
            form.on('switch(switchTest)', function (data) {
                if (this.checked) {
                    $("#fprice").removeClass('required');
                    $("#fprice").prop("readonly", "readonly");
                    $("#fprice").prop("style", "background-color:#eee");
                    $("#fprice").val('0.00');
                } else {
                    $("#fprice").addClass('required');
                    $("#fprice").removeAttr("readonly");
                    $("#fprice").removeAttr("style");
                    $("#fprice").val('');
                }
            });
        });
    </script>
</head>
<body>
<form class="layui-form" id="searchForm" action="${ctx}/zy/stock/indentureguapai.json" method="post"
      enctype="multipart/form-data">
    <c:forEach items="${ids}" var="obj">
        <input type="hidden" name="ids" value="${obj}"/>
    </c:forEach>

    <div class="layui-form-item">
        <label class="layui-form-label">是否面议</label>
        <div class="layui-input-block">
            <input type="checkbox" lay-skin="switch" lay-text="ON|OFF" lay-filter="switchTest">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">销售定价(元/件) </label>
        <div class="layui-input-block">
            <input type="text" id="fprice" name="fprice" autocomplete="off" class="layui-input required money"
                   placeholder="请输入销售单价"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">交货周期</label>
        <div class="layui-input-block">
            <select name="ideliverydays">
                <option value="0">现货</option>
                <option value="7">一周内</option>
                <option value="14">两周内</option>
                <option value="30">一个月内</option>
                <option value="60">两个月内</option>
                <option value="90">三个月内</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">展示图片 </label>
        <div class="layui-input-block layui-upload">
            <div class="layui-upload-list">
                <c:forEach items="${list}" var="indenture">
                    <img alt="" src="${indenture}" class="layui-upload-img"/>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">商品介绍</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入备注" class="layui-textarea" id="sremark" name="sremark"></textarea>
        </div>
    </div>

</form>
</body>
</html>
