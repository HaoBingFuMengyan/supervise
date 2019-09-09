<%--
  Created by IntelliJ IDEA.
  User: fanyijie
  Date: 2017/9/25
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>煤亮子</title>
	<link href="${ctx}/member/css/open.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${ctxStatic}/common/jquery.searchableSelect.css" />
	<link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>
	<style type="text/css">
		.searchable-select{
			min-width:117px;
			float:left;
		}
		.input_group dl dd{
			display:inline-block;
			float:left;
		}
		.input_group label{
			width: 110px !important;
		}
		.input-file{
			display: inline-block;
			position: relative;
			overflow: hidden;
			text-align: center;
			width: auto;
			background-color: #2c7;
			border: solid 1px #ddd;
			border-radius: 4px;
			padding: 5px 10px;
			font-size: 12px;
			font-weight: normal;
			line-height: 18px;
			color:#fff;
			text-decoration: none;
		}
		.input-file input[type="file"] {
			position: absolute;
			top: 0;
			right: 0;
			font-size: 14px;
			background-color: #fff;
			transform: translate(-300px, 0px) scale(4);
			height: 40px;
			opacity: 0;
			filter: alpha(opacity=0);
		}
	</style>
	<script src="${ctxStatic}/common/jquery.searchableSelect.js"></script>
	<script type="text/javascript">
        var cou_flag=true;
        var pro_flag=true;
        var cit_flag=true;
        var reg_flag=true;
        $(document).ready(function() {
            var filesname=$("#sbusinessno").val();
            if(filesname!=null&&filesname!=""){
                $(".selectfile").html("文件已上传");
                $(".fileerrorTip1").html(filesname).show();
                $("#downimg").html("下载已选择文件").show();
            }
            $(".showInfo").html("").hide();
            $(".businessmode").html("").hide();
            $("#downimg").html("").hide();
            $("#inputForm").validate();
            $('#choosecountry').searchableSelect();
            if($("#choosecountry").attr("data-val")!=""&&$("#choosecountry").attr("data-val").length>0&&cou_flag){
                $("div[tabindex='0']").find("div.searchable-select-holder").text($("#choosecountry").attr("data-val"));
                $("div[tabindex='0']").find("div.searchable-select-item").removeClass("selected");
                $("div[tabindex='0']").find("div.searchable-select-item").removeClass("hover");
                $("div[tabindex='0']").find("div.searchable-select-item:contains('"+$("#choosecountry").attr("data-val")+"')").addClass("selected");
            }
            choprovince();

            $("#choosecountry").next().find("div.searchable-select-item").click(function(){
                choprovince();
            });
//    $(".sqcon a.demo").click(function(){
//        $("#demoimg").toggle();
//        if($("#demoimg").css("display")=="block"){
//            event.stopPropagation();
//            $(document).click(function(){
//                $("#demoimg").hide();
//            });
//            $("#demoimg").click(function(event){
//                event.stopPropagation();
//            });
//        }
//
//    })


            $(".input-fileup").on("change","input[type='file']",function(){
                var filePath=$(this).val();
                if(filePath!=" "||filePath!==null){
                    $(".fileerrorTip1").html("您未上传文件，或者您上传文件类型有误！").hide();
                    var arr=filePath.split('\\');
                    var fileName=arr[arr.length-1];
                    $(".showFileName1").html(fileName);
                    $(".showInfo").html("").hide();
                }else{
                    $(".showFileName1").html("");
                    $(".selectfile").html("选择文件");
                    $(".fileerrorTip1").html("您未上传文件，或者您上传文件类型有误！").show();
                    return false
                }
            })

        });

        function choprovince(){

            var _sid= $("#choosecountry").next().find("div.searchable-select-items div.selected").attr("data-value");
            $.ajax({
                type: "post",
                url: "${ctx}/province.json",
                data: {"scountryid":_sid},
                success: function(data) {
                    $("#choprovince").html(data);
                    $('#choprovince select').searchableSelect();
                    if($("#choprovince").attr("data-val")!=""&&$("#choprovince").attr("data-val").length>0&&pro_flag){
                        $("#choprovince").find("div.searchable-select-holder").text($("#choprovince").attr("data-val"));
                        $("#choprovince").find("div.searchable-select-item").removeClass("selected");
                        $("#choprovince").find("div.searchable-select-item").removeClass("hover");
                        $("#choprovince").find("div.searchable-select-item:contains('"+$("#choprovince").attr("data-val")+"')").addClass("selected");
                    }
                    $("#choprovince").find("div.searchable-select-item").click(function(){
                        chocity();
                    });
                    chocity();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                }
            });

            //chocity();
        }

        function chocity(){
            var spid=$("#choprovince").find("div.searchable-select-items div.selected").attr("data-value");
            $.ajax({
                type: "post",
                url: "${ctx}/city.json",
                data: {"sprovinceid":spid},
                success: function(data) {
                    $("#chocity").html(data);
                    $('#chocity select').searchableSelect();
                    if($("#chocity").attr("data-val")!=""&&$("#chocity").attr("data-val").length>0&&reg_flag){
                        $("#chocity").find("div.searchable-select-holder").text($("#chocity").attr("data-val"));
                        $("#chocity").find("div.searchable-select-item").removeClass("selected");
                        $("#chocity").find("div.searchable-select-item").removeClass("hover");
                        $("#chocity").find("div.searchable-select-item:contains('"+$("#chocity").attr("data-val")+"')").addClass("selected");
                    }
                    $("#chocity").find("div.searchable-select-item").click(function(){
                        choregion();
                    });
                    choregion();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                }
            });

        }
        function choregion(){
            var scid=$("#chocity").find("div.searchable-select-items div.selected").attr("data-value");
            $.ajax({
                type: "post",
                url: "${ctx}/region.json",
                data: {"scityid":scid},
                success: function(data) {
                    $("#choregion").html(data);
                    $('#choregion select').searchableSelect();
                    if($("#choregion").attr("data-val")!=""&&$("#choregion").attr("data-val").length>0&&reg_flag){
                        $("#choregion").find("div.searchable-select-holder").text($("#choregion").attr("data-val"));
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                }
            });

        }
        function opennameFun(is) {
			$("#sopenname").val($(is).val().trim());
        }
        function subForm(){
            var flag=true;
            $("#scountry").val( $("#choosecountry").next().find("div.searchable-select-items div.selected").text());
            $("#sprovince").val($("#choprovince").find("div.searchable-select-items div.selected").text());
            $("#scity").val($("#chocity").find("div.searchable-select-items div.selected").text());
            $("#sregion").val($("#choregion").find("div.searchable-select-items div.selected").text());

            if($("#file").val()==""&&$(".fileerrorTip1").html()=="您未上传文件，或者您上传文件类型有误！"||$(".fileerrorTip1").html()==""){
                $(".fileerrorTip1").html("您未上传文件，或者您上传文件类型有误！").hide();
                $(".showInfo").html("请上传文件！").show();
                flag=false;
            }
            var stitle = $("#stitleDiv").find("input[name=sbusinessmode]:checked").val();
            if(stitle == undefined || isEmpty(stitle)){
                $(".businessmode").html("请选择公司类型").show();
                flag=false;
            }
            if(flag==true){
                $("#inputForm").submit();
            }
        }
        layui.use(['upload','layer'], function() {
            var $ = layui.jquery
                , upload = layui.upload;
            var layer=layui.layer;

            //普通图片上传
            var uploadInst = upload.render({
                elem: '#test1'
                ,url: '${ctx}/file/uploadfile.json'
                ,accept: 'file'
                ,multiple: false
                ,auto: true
                ,field:"upfile"
                ,data:{path:'/Member'}
                , before: function (obj) {
                    layer.load(1); //上传loading
                }
                , done: function (res) {
                    layer.closeAll('loading'); //关闭loadin
                    if(res.state == "SUCCESS"){
                        $("#demo1").attr("src",res.url);
                        $("#sbusinessno").val(res.path);
                    }else{
                        layer.msg(res.original+"上传失败，失败原因："+res.state);
                    }
                }
                , error: function () {
                    layer.msg("文件上传失败");
                }
            });
        });
	</script>
</head>
<body>
<c:if test="${empty issuccess}">
	<sys:message content="${message}"/>
	<form id="inputForm" modelAttribute="data" action="${ctx}/hy/member/authapply.shtml"  method="post"  enctype="multipart/form-data" style="background: #fff;padding:30px 0" class="top10">
		<input type="hidden"  name="id" value="${data.id}"/>
		<input type="hidden" id="scountry" name="scountry" value="${data.scountry}" />
		<input type="hidden" id="sprovince" name="sprovince" value="${data.sprovince}" />
		<input type="hidden" id="scity" name="scity" value="${data.scity}" />
		<input type="hidden" id="sregion" name="sregion" value="${data.sregion}" />
		<div class="sqcon top30" style="width: 660px;">
				<%--<p>公司信息</p>--%>
			<div class="input_group bottom20">
				<label>公司名称<em class="red">*</em>：</label><input onchange="opennameFun(this)" name="scnname" value="${data.scnname}" class="form_control required" placeholder="请输入营业执照上的公司名称" />
			</div>
			<div class="input_group bottom20">
				<label>统一社会代码<em class="red">*</em>：</label><input name="ssocialcreditno" value="${data.ssocialcreditno}" minlength="5" maxlength="30" class="form_control required" placeholder="请输入统一社会信用代码" />
			</div>
			<div class="input_group bottom20">
				<label>账户全称：</label><input id="sopenname" name="sopenname" value="${data.sopenname}" class="form_control required" readonly="readonly" placeholder="请输入账户全称" style="background: #dedbda4a" />
			</div>
			<div class="input_group bottom20">
				<label>开户行<em class="red">*</em>：</label><input name="sopenbank" value="${data.sopenbank}" class="form_control required" placeholder="请输入开户行" />
			</div>
			<div class="input_group bottom20">
				<label>账号<em class="red">*</em>：</label><input name="sopenaccount" value="${data.sopenaccount}" class="form_control required" placeholder="请输入账号" />
			</div>
			<div class="input_group bottom20">
				<label>联行号：</label><input name="sunionaccount" value="${data.sunionaccount}" class="form_control" placeholder="请输入联行号" />
			</div>
			<div class="input_group bottom20">
				<label>电话<em class="red">*</em>：</label><input name="sphone"  value="${data.sphone}" class="form_control required" placeholder="请输入公司电话" />
			</div>
			<div class="input_group bottom20">
				<label>联系人<em class="red">*</em>：</label><input name="slinkman" value="${data.slinkman}" class="form_control required" placeholder="请输入公司联系人" />
			</div>
			<div class="input_group bottom20">

				<dl style="float:left;">
					<dd><label>公司所在地<em class="red">*</em>：</label></dd>
					<dd id="choosecountry" data-val="${data.scountry }"><area:country op="select"  ></area:country> </dd>
					<dd id="choprovince" data-val="${data.sprovince }"></dd>
					<dd id="chocity" data-val="${data.scity }"></dd>
					<dd id="choregion" data-val="${data.sregion }"></dd>
				</dl>
				<font style="padding-left:9px;" class="icon icon-bitian2 redfont must leftfu"></font>


			</div>
			<div class="input_group bottom20">
				<label>公司详细地址<em class="red">*</em>：</label><input name="sbusaddress" value="${data.sbusaddress}" class="form_control required" placeholder="请输入公司的详细地址" /><font class="icon icon-bitian2 redfont must leftfu"></font>
			</div>
			<div class="input_group bottom20"  id="stitleDiv">
				<label>公司类型<em class="red">*</em>：</label>
				<span style="color: red"><cs:BizParaType businessmode="1" op="bizradio" name="sbusinessmode" val="${data.sbusinessmode}" /></span><span class="businessmode" style="color: red"></span>
				<font class="icon icon-bitian2 redfont must"></font>
			</div>
			<div class="input_group bottom20">
				<label>营业执照<em class="red">*</em>： </label>
				<input type="hidden" name="sbusinessno" id="sbusinessno" value="${data.sbusinessno}"/>
					<%--<input  class="width175 required" id="pufs" style="border: none;color: #8a8a8a " name="imgFile" type="file"   readonly/>--%>
				<button type="button" class="layui-btn" id="test1">上传图片</button>
				<div class="layui-upload-list" style="padding-left: 143px;">
					<c:if test="${not empty data.sbusinessno}">
						<img class="layui-upload-img" id="demo1" src="<cs:SysParaType imgurl="1" op="syspara"/>/${data.sbusinessno}">
					</c:if>
					<c:if test="${empty data.sbusinessno}">
						<img class="layui-upload-img" id="demo1">
					</c:if>
				</div>
					<%--<a class="input-file input-fileup" href="javascript:;" style="vertical-align: middle">
                        <span class="selectfile">选择文件</span><input size="100" type="file" name="file" id="file">
                    </a>
                    <span class="fileerrorTip1"></span><span class="showFileName1"></span><span class="showInfo" style="color: red"></span>
                    <font class="icon icon-bitian2 redfont must"></font> <a id="downimg" href="${ctx}/download.html?path=${data.sbusinessno}&filename=sbusinessno" class="demo bluefont"></a>--%>
				<div style="color: red;margin-left: 130px;">* 温馨提示：请上传加盖公章的扫描件或复印件，须以图片形式上传。文件大小不超过20MB</div>
			</div>
			<div class="input_group bottom20">
				<label>其他描述：</label><textarea name="scompanydesc" class="mid_text"  placeholder="">${data.scompanydesc}</textarea>
			</div>
		</div>
		<c:if test="${data.istatus eq 0 || data.istatus eq 2 }">
			<div class="sqcon noborder nopd">
				<div class="input_group input_group_lg bottom20">
					<label></label>
					<input type="button" onclick="subForm();" class="form_control comfir" value="提交申请" />
				</div>
			</div>
		</c:if>
	</form>
</c:if>

<c:if test="${issuccess}">
	<div id="success" >
		<div class="suc">
			<img class="bingo" src="${ctx}/images/find_suc.png" />
			<h2>企业认证申请成功！</h2>
			<p>请保持电话畅通，我们将在2个工作日内完成审核。<a href="${ctx}/hy/member/authapply.shtml">修改</a></p>
			<a class="back" href="${ctx}/index.html">返回首页</a>
		</div>
	</div>
</c:if>
</body>
</html>
