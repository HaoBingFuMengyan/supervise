<%--
  Created by IntelliJ IDEA.
  User: fanyijie
  Date: 2017/9/25
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ taglib prefix="parameter" uri="http://www.frogsing.com/tags/parameter" %>


<html>
<head>
<title>煤亮子</title>
<link href="${ctx}/of/css/open.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${ctxStatic}/common/jquery.searchableSelect.css" />
<style type="text/css">
.searchable-select{
	min-width:117px;
	float:left;
}
.input_group dl dd{
	display:inline-block;
	float:left;
}
</style>
<script src="${ctxStatic}/common/jquery.searchableSelect.js"></script> 
<script type="text/javascript">
var cou_flag=true;
var pro_flag=true;
var cit_flag=true;
$(document).ready(function() {
    var imagectx = '<parameter:SysParaType imgurl="1" op="syspara"/>';
	$("#inputForm").validate();
    //<c:if test="${not empty imageMap}">
    $("#xbyyzz_file_img").attr('src',
        imagectx + '${imageMap}');
    //</c:if>
    
});

</script>
</head>
<body>
	
	<sys:message content="${message}"/>
	<form id="inputForm" modelAttribute="data" action="${ctx}/hy/member/companyinfo.shtml"  method="post" enctype="multipart/form-data">
		<input type="hidden"  name="id" value="${data.id}"/>
		<input type="hidden" id="scountry" name="scountry" value="${data.scountry}" />
		<input type="hidden" id="sprovince" name="sprovince" value="${data.sprovince}" />
		<input type="hidden" id="scity" name="scity" value="${data.scity}" />
		<input type="hidden"  id="sbusinessno" value="${businessno}"/>
		<input type="hidden"  name="sbusinessno" value="${data.sbusinessno}"/>
		<div class="sqcon top30" style="width: 690px;">
			<%--<p>公司信息</p>--%>
			<div class="input_group bottom20">
				<label>公司名称：</label><input readonly name="scnname" value="${data.scnname}" class="form_control required" placeholder="请输入营业执照上的公司名称" /><font class="icon icon-bitian2 redfont must leftfu"></font>
			</div>
			<div class="input_group bottom20">
				<label>统一社会代码：</label><input readonly name="ssocialcreditno" value="${data.ssocialcreditno}" minlength="5" maxlength="30" class="form_control required" placeholder="请输入统一社会信用代码" /><font class="icon icon-bitian2 redfont must leftfu"></font>
			</div>
			<div class="input_group bottom20">
				<label>联系人：</label><input readonly name="slinkman" value="${data.slinkman}" class="form_control required" placeholder="请输入公司联系人" /><font class="icon icon-bitian2 redfont must leftfu"></font>
			</div>
			<div class="input_group bottom20">
				<label style="float:left;margin-top:5px;">公司所在地：</label>
				<dl style="float:left;">
					<dd></dd>
					<input type="text" readonly style="width:110px;"  class="form_control" value="${data.scountry }" />
					<input type="text" readonly style="width:110px;"  class="form_control" value="${data.sprovince }" />
					<input type="text" readonly style="width:110px;"  class="form_control" value="${data.scity }" />
					<input type="text" readonly style="width:110px;"  class="form_control" value="${data.sregion }" />
				</dl>
				<font style="padding-left:9px;float:left;margin-top:9px;" class="icon icon-bitian2 redfont must leftfu"></font>


			</div>
			<div class="input_group bottom20">
				<label>公司详细地址：</label><input readonly name="sbusaddress" value="${data.sbusaddress}" class="form_control required" placeholder="请输入公司的详细地址" /><font class="icon icon-bitian2 redfont must leftfu"></font>
			</div>
			<div class="input_group bottom20">
				<label>公司类型：</label> <input readonly class="form_control required" value="${data.sbusinessmode}" />
			</div>
			<div class="input_group bottom20">
				<label>营业执照： </label>
				<img id="xbyyzz_file_img" src="" width="120" height="120" style="vertical-align: top;"/>
				<a href="${ctx}/download.html?path=${imageMap}&filename=sbusinessno" class="demo bluefont">下载文件</a>
				<div id="zhangyin" class="box_yz" style="position:absolute;top:15px;left: 89px;width: 193px;height: 125px;">
					<img style="width: 100%" src="${ctx}/images/zhangyin.png"/>
				</div>

			</div>
			<div class="input_group bottom20">
				<label>其他描述：</label><textarea readonly name="scompanydesc" class="mid_text"  placeholder="">${data.scompanydesc}</textarea>
			</div>
		</div>
		<div class="sqcon noborder nopd">
            <div class="input_group input_group_lg bottom20">
            	<label class="nomar"></label>
            	<%--<input type="button" onclick="$('#inputForm').submit()" class="form_control comfir" value="保存" />--%>
				<input type="button" onclick="javascript:history.back(-1);" class="form_control comfir" value="返回" />
            </div>
        </div>
	</form>
	
</body>
</html>
