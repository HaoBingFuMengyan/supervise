<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="decorator" content="jj"/>
    <title>修改单价</title>


    <script type="text/javascript">
        layui.use(['layer', 'form', 'upload'], function () {
            var form = layui.form;
            jj.validate("#searchForm");


            //监听指定开关
            form.on('switch(switchTest)', function (data) {
                if (this.checked) {
                    $("#type").val(1);
                    $("#gain").text('涨幅(%)');
                    $("#state").text('上调请输入百分比，例：10；下调请输入百分比，例：-10');
                } else {
                    $("#type").val(0);
                    $("#gain").text('涨幅');
                    $("#state").text('上调请输入正数，例：10；下调请输入负数，例：-10');
                }
            });

        });
    </script>
    <style>
        .nv{
            padding:7px 15px;
        }
        textarea::-webkit-input-placeholder{
            padding-left: 10px;
        }
    </style>
</head>
<body>
<form class="layui-form" id="searchForm" action="${ctx}/zy/marginstock/modify-fprice.json" method="post"
      enctype="multipart/form-data">
    <c:forEach items="${ids}" var="id">
        <input type="hidden" name="ids" value="${id}">
    </c:forEach>

    <input type="hidden" id="type" name="type" value="0">
    <div class="layui-form-item">
        <label class="layui-form-label">百分比调价</label>
        <div class="layui-input-block">
            <input type="checkbox" lay-skin="switch" lay-text="ON|OFF" lay-filter="switchTest">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" id="gain">涨幅</label>
        <div class="layui-input-block">
            <input type="text" id="fprice" name="fprice" autocomplete="off" class="layui-input required"
                   placeholder="请输入涨跌幅"/>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入备注" class="layui-textarea" id="sremark" name="sremark" style="width: 100%;"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-form-text top10">
        <label class="layui-form-label red">声明</label>
        <div class="layui-input-block red nv" id="state">
            上调请输入正数，例：10；下调请输入负数，例：-10
        </div>
    </div>

</form>
</body>
</html>
