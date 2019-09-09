<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%><html>
<head>
	<title>编辑短信节点列表</title>
	<link href="${ctx}/common/css/fileinput.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	var validateForm;
	$(document).ready(function() {
		//$("#no").focus();
		validateForm = $("#inputForm").validate({
			submitHandler: function(form){
				loading('正在提交，请稍等...');
				form.submit();
			}
		});
	});
	</script>
	<style>
	  .forline{
		margin-bottom:20px;
		}
	   .dewidth{
	   		width:60px;
	   		text-align:right;
	   		margin-right:20px;
	   		height:30px;
	   		line-height:30px;
	   }
	</style>
</head>
<body class="hideScroll">
       <div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>短信通知</h5>
			</div>
			<sys:message content="${message}"/>
			<form id="inputForm" method="post" action="${ctx}/cx/infoconfigdetail/SMSnotification.shtml" >
			<div class="row" style="margin-top:50px;">
				 <div class="col-sm-2">
				 </div>
				 <div class="col-sm-8">
					<div class="forline">
						<label class="pull-left dewidth" style="height:45px;"><font color="red">*</font>手机号:</label>
						<input name="smobile" class="form-control required" type="text" style="width:80%;font-family: microsoft;font-size: 12px;" placeholder="可输多个手机号,手机号之间请用逗号分开" autocomplete="off"/>
					</div>
					<div class="forline">
			 			<label class="pull-left dewidth" style="height:212px;"><font color="red">*</font>内容:</label>
						<textarea name="content" class="form-control required" style="width:80%;height:210px;"></textarea>
					</div>
				</div>
			 </div>
			 <div class="form-group jiangeper"> 
				<button class="btn-info sure mybtn" type="submit"><i class="fa fa-check" ></i>&nbsp;提交</button>
           	    <button class="btn-info mybtn resure" type="reset" onclick="reset();"><i class="glyphicon glyphicon-repeat" ></i>&nbsp;重置</button>
		     </div>
			</form>
	   	</div>
	   </div>
</body>
</html>