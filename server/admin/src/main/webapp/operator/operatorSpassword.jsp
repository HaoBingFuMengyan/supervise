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
		validateForm = $("#inputForm").validate({
			messages: {
				confirmNewPassword: {equalTo:"请输入与上面相同的值"}
			},
			submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
			},
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
		
	});
	</script>
</head>
<body class="hideScroll">
	<sys:message content="${message}"/>
	<form id="inputForm" action="${ctx}/sys/operator/updatepassword.shtml" method="post" class="form-horizontal">
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-20"><label class="pull-right"><font color="red">*</font>旧密码:</label></td>
				 <td><input id="oldPassword" name="oldspassword" type="password" autocomplete="off" maxlength="50" minlength="3" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td class="active width-20"><label class="pull-right"><font color="red">*</font>新密码:</label></td>
				 <td><input id="newPassword" name="newspassword" type="password" autocomplete="off" maxlength="50" minlength="3" class="form-control required"/></td>
		      </tr>
		      <tr>
		         <td class="active width-20"><label class="pull-right"><font color="red">*</font>确认新密码:</label></td>
		         <td><input id="confirmNewPassword" type="password" autocomplete="off"  class="form-control required" maxlength="50" minlength="3" equalTo="#newPassword"/></td>
		      </tr>
	      </tbody>
      </table>
	</form>
</body>
</html>