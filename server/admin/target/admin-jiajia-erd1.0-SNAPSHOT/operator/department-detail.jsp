<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ include file="/include/head.jsp"%>
<html>
<head>
    <title></title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        var validateForm;
        function doSubmit() {//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if (validateForm.form()) {
                $("#inputForm").submit();
                return true;
            }

            return false;
        }
        $(document).ready(function () {
            focusmenu('部门管理');
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
        /*
         function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
         if(validateForm.form()){
         $.post("${ctx}/sys/menu/save",$('#inputForm').serialize(), function(data) {
         if(data.success){
         $.jBox.tip("菜单增加成功！", 'info');
         }else
         $.jBox.tip(data.msg, 'error');
         });
         }
         return false;
         }

         $(document).ready(function() {
         $("#sname").focus();
         validateForm = $("#inputForm").validate({
         errorContainer: "#messageBox",
         errorPlacement: function(error, element) {
         $("#messageBox").text("输入有误，请先更正。");
         if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
         error.appendTo(element.parent().parent());
         } else {
         error.insertAfter(element);
         }
         }
         });
         });*/

    </script>
</head>
<body class="  gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#">选项1</a>
                </li>
                <li><a href="#">选项2</a>
                </li>
            </ul>
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
        <div class="ibox-content">
            <div class="row">
                <form:form id="inputForm" modelAttribute="data" action="${ctx}/jj/department/save.shtml" method="post"
                           class="form-horizontal">
                    <form:hidden path="id"/>
                    <%-- <form:hidden path="sparentid" value="${data.sparentid}"/>--%>
                    <form:hidden path="bisleaf" value="${data.bisleaf}"/>
                    <form:hidden path="bisroot" value="${data.bisroot}"/>
                    <%-- <form:hidden path="isort" value="${data.isort}"/> --%>
                    <sys:message content="${message}"/>
                    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                        <tbody>
                        <tr>
                            <td class="width-15 active"><label class="pull-right">上级部门</label></td>
                            <td class="width-35"><sys:treeselect id="department" name="sparentid" value="${data.sparentid}"
                                                                 labelName="parent.sname"
                                                                 labelValue="${department.parent.sname}"
                                                                 title="部门" url="/dt/department/treeData.shtml" extId="${data.id}"
                                                                 cssClass="form-control"/></td>
                            <td class="width-15 active"><label class="pull-right"><font color="red">*</font> 名称:</label>
                            </td>
                            <td class="width-35"><form:input path="sname" htmlEscape="false" maxlength="50"
                                                             class="required form-control "/></td>
                        </tr>
                            <%-- <tr>
                                <td class="width-15 active"><label class="pull-right">图标:</label></td>
                                <td class="width-35"><sys:iconselect id="icon" name="simagepath"
                                                                     value="${data.simagepath}"/></td>
                                <td class="width-15 active"><label class="pull-right">菜单链接:</label></td>
                                <td class="width-35"><form:input path="smenupath" htmlEscape="false" maxlength="2000"
                                                                 class="form-control "/>
                                    <span class="help-inline">点击菜单跳转的页面</span></td>
                                <!-- <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>排序:</label></td>
                     <td  class="width-35" ><form:input path="isort" htmlEscape="false" maxlength="50" class="required digits form-control "/>
                        <span class="help-inline">排列顺序，升序。</span></td> -->
                            </tr> --%>

                        <tr>
                            <td class="width-15 active"><label class="pull-right">描述:</label></td>
                            <td class="width-35"><form:textarea path="sremark" htmlEscape="false" rows="3"
                                                                maxlength="200" class="form-control "/></td>
                                <%-- <td class="width-15 active"><label class="pull-right">排序:</label></td>
                                <td class="width-35"><input name="isort" type="number" value="${data.isort}"
                                                            class="form-control" autocomplete="off"/></td> --%>
                        </tr>
                        </tbody>
                    </table>
                </form:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>