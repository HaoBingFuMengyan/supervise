<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>煤亮子</title>
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

<form:form id="inputForm" action="${ctx}/user/editChild.json" method="post"  modelAttribute="user" class="layui-form">
	<form:hidden path="id"/>
	<div class="layui-form-item">
        <div class="layui-inline">
		<label class="layui-form-label">姓名：</label>
		<div class="layui-input-inline">
			<form:input type="text" path="sname" class="layui-input required" autocomplete="false"
						placeholder="请输入姓名"/>
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


	</div>
    <shiro:hasAnyPermission name="user:disable	">
    <div class="layui-form-item">
        <label class="layui-form-label">是否禁用</label>
        <div class="layui-input-block">
            <input type="radio" name="bisvalid" value="1" title="否" checked=""/>
            <input type="radio" name="bisvalid" value="0" title="是"/>
        </div>
    </div>
    </shiro:hasAnyPermission>
	<%--<div class="layui-form-item">--%>
		<%--<label class="layui-form-label">手机号码：</label>--%>
		<%--<div class="layui-input-inline">--%>
			<%--<form:input type="text" path="smobile" maxlength="11" readonly="true"--%>
						<%--class="layui-input required "--%>
						<%--placeholder="请输入手机号码"/>--%>
		<%--</div>--%>
	<%--</div>--%>
  <shiro:hasAnyPermission name="user:edit">
      <c:if test="${user.bisadmin ==0}">
          <div class="layui-form-item">

              <label class="layui-form-label">角色：</label>

              <div class="layui-input-block">
                  <c:forEach items="${actors}" var="actor">
                      <input type="checkbox" data-sd="add" name="sroleids" value="${actor.id}"  lay-skin="primary"
                             data-roletype="${actor.iroletype}" title="${actor.srolename}"
                             <c:forEach var="t" items="${user.sroleids}"><c:if test="${t eq actor.id}">checked="true"</c:if></c:forEach>
                      />
                  </c:forEach>
              </div>

          </div>
          <div class="layui-form-item">
              <label class="layui-form-label"></label>
              <span>角色为必选项,只有选中角色才能添加子账号</span>
          </div>
      </c:if>
  </shiro:hasAnyPermission>

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

