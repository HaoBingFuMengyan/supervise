<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>单据编号列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	var validateForm;
	$(document).ready(function() {
		focusmenu('系统文件管理');
		//$("#no").focus();
		validateForm = $("#inputForm").validate({
			rules:{
				//scode:{remote:"${ctx}/sys/sysfile/checkScode.shtml?oldScode="+encodeURIComponent('${data.scode}')}//设置了远程验证，在初始化时必须预先调用一次。
			},
			messages:{
				scode:{remote:"代码已经存在"}
			},
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			}
		});
	});
	</script>
</head>
<body class="fixed-sidebar  gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>系统文件详情</h5>
	</div>
	<div class="ibox-content">
	<sys:message content="${message}"/>
	<div class="row">
		<form:form id="inputForm" modelAttribute="data" action="${ctx}/dt/sysfile/dosave.shtml" method="post" enctype="multipart/form-data" class="form-horizontal">
		<form:hidden path="id" />
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>编号</label></td>
		         <td><form:input path="scode" readonly="true"  maxlength="50" class="form-control "/></td>
		         <td class="active width-15"><label class="pull-right"><font color="red">*</font>文件类型:</label></td>
		         <td>
		         	<form:select path="isysfiletype"  class="form-control required">
						<form:option value="0" label="授权书"/>
						<form:option value="1" label="店铺logo"/>
						<form:option value="2" label="店铺banner"/>
					</form:select>
		         </td>
		      </tr>
		     <tr>
		     	<td class="active width-15"><label class="pull-right">更新时间</label> </td>
		     	<td><mw:format label="datetime" value="${data.dmoddate }"></mw:format></td>
		     	<td class="active width-15"><label class="pull-right">上传文件</label> </td>
		     	<td><input type="file" name="sfile" value="" /> </td>
		     </tr>
		     <tr>
		     	<td class="active width-15"><label class="pull-right">备注</label> </td>
		     	<td colspan="3"><form:textarea path="sreamrk" style="width:90%;"  /></td>
		     	
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