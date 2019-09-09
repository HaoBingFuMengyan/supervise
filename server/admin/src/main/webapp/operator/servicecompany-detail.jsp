<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ include file="/include/head.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(document).ready(function() {
		//$("#no").focus();
		validateForm = $("#inputForm").validate({
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
<body >
	<sys:message content="${message}"/>
	<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/servicecompany/save.shtml" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		   
		      <tr>
		         <td class="active col-md-2"><label class="pull-right">客服:</label></td>
		         <td class="col-md-4"><input id="sserviceid" name="sserviceid" type="hidden" value="${data.sserviceid}">
		         	<input name="sname" readonly="true" value="${data.operator.susername}"  maxlength="50" class="form-control"/></td>
		      </tr>
		      
		      <tr>
		         <td class="width-15 active"><label class="pull-right">企业:</label></td>
                            <td class="width-35"><sys:treeselect id="menu" name="smemberid" value="${data.smemberid}"
                                                                 labelName="parent.sname"
                                                                 labelValue="${data.member.scnname}"
                                                                 title="菜单" url="/treeData.shtml" extId="${data.id}"
                                                                 cssClass="form-control required"/></td>
		         </td>
		      </tr>
		      </tbody>
		      </table>
	</form:form>
</body>
</html>