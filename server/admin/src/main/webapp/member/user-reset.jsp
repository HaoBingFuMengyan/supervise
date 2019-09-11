<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        $("docunment").ready(function () {
            var validateForm = $("#inputForm").validate({
                submitHandler: function (form) {

                    if (true) {
                        loading('正在提交，请稍等...');
                        form.submit();
                    }
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

<div class="wrapper wrapper-content animated fadeIn">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h3>会员账号密码重置</h3>
                </div>
                <div class="ibox-content">
                    <sys:message content="${message}"/>

                    <form:form id="inputForm" modelAttribute="data" action="${ctx}/hy/user/reset.shtml" method="post"
                               enctype="multipart/form-data" class="form-horizontal form-group">
                        <form:hidden path="id"/>
                        <div class="control-group">
                            <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                                <tbody>


                                <tr>
                                    <td class="active width-15"><label class="pull-right">密码:<font color="red">*</font></label>
                                    </td>
                                    <td><input type="password" name="spassword" id="spassword" maxlength="18"
                                               class="form-control required"/></td>
                                    <td class="active width-15"><label class="pull-right">确认密码:<font
                                            color="red">*</font></label></td>
                                    <td>
                                        <input type="password" name="spassword1" equalTo="#spassword" maxlength="18"
                                               class="form-control required"/>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                    </form:form>


                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>