<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ include file="/include/head.jsp" %>
<html>
<head>
    <title>常用指令</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#no").focus();
            validateForm = $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });

        });
    </script>
</head>
<body>
<sys:message content="${message}"/>
<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/quicklycommand/save.shtml" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>

        <tr>
            <td class="active col-md-2"><label class="pull-right">指令简称:</label></td>
            <td class="col-md-4">
                <input name="sshorname" value="${data.sshorname}" maxlength="50" class="form-control"/></td>
        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">指令内容:</label></td>
            <td class="width-35"><input name="scontent" value="${data.scontent}" maxlength="50" class="form-control"/></td>

        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">排序:</label></td>
            <td class="width-35"><input name="isort" value="${data.isort}" maxlength="50" class="form-control"/></td>

        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">是否启用:</label></td>
            <td class="width-35">
                <select name="ienable" class="form-control">
                    <option value="1" ${data.ienable == 1 ? 'selected' : ''}>启用</option>
                    <option value="0" ${data.ienable == 0 ? 'selected' : ''}>禁用</option>
                </select>
            </td>

        </tr>

        <tr>
            <td class="width-15 active"><label class="pull-right">备注:</label></td>
            <td class="width-35"><input name="sremark" value="${data.sremark}" maxlength="50" class="form-control"/></td>

        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>