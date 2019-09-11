<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>基金协同监管系统沟通</title>
    <meta name="decorator" content="jj"/>
    <script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
    <script src="${ctx}/js/sendmobile.js" type="text/javascript"></script>
    <style>
        .layui-input-inline{
            width:220px!important;
        }
        .layui-input-inline input{
            width:220px;
            line-height: 0;
        }
        .layui-inline{
            width:100%;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            jj.validate();

            $("#sendCode").sendCode({
                url: "${ctx}/sendmobilecode.json",
                nodecode: "addMemberChild",
                checkonly: true,//验证手机号是否唯一
                imgcheck: false,//图像验证码
                voice: false,//语音
                checkform: function () {
                    return true;
//                   return  $("#inputForm").valid();
                },
                refresh: function () {
                }
            });

        });

        function checkSmobile() {
            var smobile = $("#smobile").val();

            if (isNaN(smobile) || smobile == "" || smobile.length != 11)
                return false;
            else
                return true;
        }

        function doSubmit() {
//		if($("input[data-sd='add']:checked").length < 1)
//			return;
            $("#inputForm").submit();
        }

        function editDoSubmit() {
            if ($("input[data-sd='edit']:checked").length < 1)
                return;
            $("#editForm").submit();
        }
        function editMemberChild(susername, sname, smobile, id) {
            $("#edit").slideDown(500);
            $("#edit-id").val(id);
            $("#susername").val(susername);
            $("#edit-sname").val(sname);
            $("#edit-smobile").val(smobile);
        }

        function isDisable(isable, id) {
            window.location.href = "${ctx}/user/deleteChild.shtml?id=" + id + "&isable=" + parseInt(isable);
        }
    </script>
</head>
<body >
<sys:message content="${message}"></sys:message>

<form:form id="inputForm" action="${ctx}/user/addChild.json" method="post"  modelAttribute="user" class="layui-form">
    <div class="layui-form-item">

        <label class="layui-form-label">姓名：</label>
        <div class="layui-input-inline">
        <form:input type="text" path="sname" class="layui-input required" autocomplete="false"
                                                               placeholder="请输入姓名"/>
        </div>


    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码：</label>
        <div class="layui-input-inline">
        <input type="text" id="spassword1" name="spassword"  class="layui-input required" onfocus="this.type='password'"
               placeholder="请输入密码"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码：</label>
        <div class="layui-input-inline">
        <input id="spassword2" type="text" equalTo="#spassword1" onfocus="this.type='password'"
                                                            class="layui-input required" placeholder="请再次输入密码"/><font
            class=""></font>
        </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">邮箱：</label>
        <div class="layui-input-inline">
            <form:input type="text" path="semail" class="layui-input email " autocomplete="false"
                        placeholder=""/>
        </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">QQ：</label>
        <div class="layui-input-inline">
            <form:input type="text" path="sqq" class="layui-input qq" autocomplete="false"
                        placeholder=""/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号码：</label>
        <div class="layui-input-inline">
            <form:input type="text" path="smobile" maxlength="11"
                                                                 class="layui-input required "
                                                                 placeholder="请输入手机号码"/>
        </div>
        <div class="layui-word-aux">
        <a class="layui-btn layui-btn-normal"   id="sendCode">获取验证码</a><br/>
            <label class="layui-form-label"></label>
        </div>
    </div>

    <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">联系QQ：</label>--%>
        <%--<div class="layui-input-inline">--%>
            <%--<form:input type="text" path="sqq" maxlength="10"--%>
                                                                 <%--class="layui-input"--%>
                                                                 <%--placeholder="联系QQ"/><font--%>
            <%--class=""></font>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="layui-form-item ">
        <div class="layui-block">
        <label class="layui-form-label">验证码：</label>
        <div class="layui-input-inline" >
             <input type="text" name="scheckword" id="scheckword"  style="width:100px;display: inline;"
                    class="layui-input required" placeholder="输入验证码"/>
        </div>

        </div>

    </div>
    <div class="layui-form-item">

        <label class="layui-form-label">角色：</label>

        <div class="layui-input-block">
        <c:forEach items="${actors}" var="actor">
            <input type="checkbox" data-sd="add" name="sroleids" value="${actor.id}" lay-skin="primary"
                         data-roletype="${actor.iroletype}" title="${actor.srolename}" required/>
        </c:forEach>
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <span>角色为必选项,只有选中角色才能添加子账号</span>
    </div>

</form:form>
<script type="text/javascript">
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form;


    });
</script>
</div>
</body>
</html>

