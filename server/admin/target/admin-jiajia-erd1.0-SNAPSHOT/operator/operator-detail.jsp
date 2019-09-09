<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ include file="/include/head.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
        var validateForm;
        $(document).ready(function() {
            //$("#no").focus();
            jj.validate('form',{
                rules: {
                    susername: {remote: "${ctx}/operator/checkLoginName?oldLoginName=" + encodeURIComponent('${data.susername}')}//设置了远程验证，在初始化时必须预先调用一次。
                }});

        });
	</script>
</head>
<body >
<sys:message content="${message}"/>
<form:form id="inputForm" modelAttribute="data" action="${ctx}/jj/operator/save.shtml" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>

		<tr>
			<td class="active col-md-2"><label class="pull-right"><font color="red">*</font>登录名:</label></td>
			<td class="col-md-4"><input id="oldLoginName" name="oldLoginName" type="hidden" value="${data.susername}">
				<form:input path="susername" htmlEscape="false" maxlength="50" class="form-control required"/></td>
			<td class="active col-md-2"><label class="pull-right"><font color="red">*</font>真实姓名:</label></td>
			<td class="col-md-4">
				<form:input path="srealname" htmlEscape="false" maxlength="50" class="form-control required userName"/></td>
		</tr>
		<tr>
			<td class="active col-md-2"><label class="pull-right"><c:if test="${empty data.id}"><font color="red">*</font></c:if>密码:</label></td>
			<td class="col-md-4"><input id="newPassword" name="spassword" type="password" value="" maxlength="50" minlength="3" class="form-control ${empty data.id?'required':''}"/>
				<c:if test="${not empty data.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if></td>
			<td class="active col-md-2"><label class="pull-right"><c:if test="${empty data.id}"><font color="red">*</font></c:if>确认密码:</label></td>
			<td class="col-md-4"><input id="confirmNewPassword" name="confirmNewPassword" type="password"  class="form-control ${empty data.id?'required':''}" value="" maxlength="50" minlength="3" equalTo="#newPassword"/></td>
		</tr>
		<tr>
			<td class="active col-md-2"><label class="pull-right">手机:</label></td>
			<td class="col-md-4"><form:input path="smobile" htmlEscape="false" maxlength="100" class="form-control mobile "/></td>
			<td class="active col-md-2"><label class="pull-right">QQ:</label></td>
			<td class="col-md-4"><form:input path="sqq" htmlEscape="false" maxlength="10" class="form-control"/></td>
		</tr>
		<tr>
			<td class="active col-md-2"><label class="pull-right">电话:</label></td>
			<td class="col-md-4"><form:input path="sphone" htmlEscape="false" maxlength="100" class="form-control"/></td>
			<td class="active col-md-2"><label class="pull-right">邮箱:</label></td>
			<td class="col-md-4"><form:input path="semail" htmlEscape="false" maxlength="100" class="form-control email "/></td>
		</tr>
		<tr>

			<td class="active col-md-2"><label class="pull-right">是否禁用:</label></td>
			<td class="col-md-4">
				<select id="bisfreeze" name="bisfreeze" class="form-control valid" aria-invalid="false">
					<option value="0" <c:if test="${data.bisfreeze==0}">selected="selected"</c:if>>否</option>
					<option value="1" <c:if test="${data.bisfreeze==1}">selected="selected"</c:if>>是</option>
				</select>
			</td>
			<td class="active col-md-2"><label class="pull-right">是否客服:</label></td>
			<td class="col-md-4">
				<select id="bisservice" name="bisservice" class="form-control valid" aria-invalid="false">
					<option value="0" <c:if test="${data.bisservice==0}">selected="selected"</c:if>>否</option>
					<option value="1" <c:if test="${data.bisservice==1}">selected="selected"</c:if>>是</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="active col-md-2"><label class="pull-right">部门:</label></td>
			<form:input path="sdepartmentid" type="hidden" value="${sdepartmentid}"></form:input>
			<td colspan="3"><form:input path="" htmlEscape="false" maxlength="100" readonly="true" placeholder="请在左边树选择部门" class="form-control " value="${department.sname}"/></td>

		</tr>
		<tr id="rolename">
			<td class="active col-md-2"><label class="pull-right"><font color="red">*</font>用户角色:</label></td>
			<td colspan="3">
				<form:checkboxes path="role" items="${roleList}" itemLabel="srolename" itemValue="id" htmlEscape="false" cssClass="i-checks"/>
				<label id="roleList-error" style="color:red;"></label>
			</td>
		</tr>
		</tbody>
	</table>
</form:form>
</body>
</html>