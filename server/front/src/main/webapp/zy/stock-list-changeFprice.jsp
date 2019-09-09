<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="decorator" content="iframe"/>
    <title>资源调价</title>

    <script src="${ctxStatic}/layui-v2.4.2/layui/layui.js"></script>
    <script type="text/javascript">
        layui.use(['layer', 'form','element'], function(){
            var element = layui.element;
            var layer = layui.layer
                ,form = layui.form;
        });
        function isCheck(thisObj) {
            var str = $(thisObj).val().trim();
            var reg= /^(-)?[1-9][0-9]*$/;
            var flag = reg.test(str);
            if (str == null || str == ""){
                $("#error").find("font").text("不能为空")
                $("#error").removeAttr("style","display");
                return;
            }
            if (flag == false) {
                $("#error").find("font").text("只能输入正数和负数");
                $("#error").removeAttr("style", "display");
            }else{
                $("#error").find("font").text("");
                $("#error").css("display","none");
            }

        }
    </script>
</head>
<body>
    <sys:message content="${message}"/>

    <div class="layui-tab">
        <form id="searchForm" action="${ctx}/zy/stock/changeprice.shtml" method="post">
            <c:forEach items="${ids}" var="obj">
                <input type="hidden" name="ids" value="${obj}"/>
            </c:forEach>
            <div class="layui-form-item" align="center" style="margin-top: 60px">
                <div class="layui-inline">
                    <label class="layui-form-label"><font color="red">*</font>调价幅度：</label>
                    <div class="layui-input-inline">
                        <input type="text" id="fprice" name="fprice" autocomplete="off"  class="layui-input" onkeyup="isCheck(this)" />
                    </div>
                    <label style="vertical-align:-webkit-baseline-middle;">元/件</label>
                </div>
                <div class="layui-inline">
                    <p id="error" style="display: none"><font color="red"></font></p>
                </div>

                <div class="layui-inline">
                    <p><font color="red">注意:如要降价，请输入负数，如：-10，表示降价10元/件</font></p>
                </div>
            </div>
        </form>
    </div>
</body>
</html>