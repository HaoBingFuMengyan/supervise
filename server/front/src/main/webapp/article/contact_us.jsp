<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>帮助中心</title>
	<link type="image/x-icon" href="${ctx}/title/favicon.png" rel="shortcut icon">
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${ctx}/font/iconfont.css">
    <link href="${ctx}/css/help.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
	<link href="${ctx}/css/static.css" rel="stylesheet" type="text/css">
	<script>

        $(function(){
            $('#click1').click(function(){
                $('.screen').show();
            })
            $('#close').click(function(){
                $('.screen').hide();
            })
        })
	</script>
</head>
<body>
<div class="help_nav">
	<div class="mycon">
		<div class="h_logo left"><img src="${ctx}/images/help_logo.png"/></div>
		<div class="h_dao right">
			<ul class="clearfix">
				<li><a href="${ctx}/help_P000018.html" >常见问题</a></li>
				<li><a href="${ctx}/help_P000023.html">新手指引</a></li>
				<li><a href="${ctx}/about_us.html">关于我们</a></li>
				<li><a class="active" href="${ctx}/contact_us.html">联系我们</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="contact">
	<div class="mycon tact_po">
		<div class="tact_click click1" id="click1">
			<img src="${ctx}/images/icon_more.png" />
		</div>
		<a href="http://ditu.amap.com/place/B0FFHQ2Q7A">
			<div class="tact_click click2">
				<img src="${ctx}/images/icon_more.png" />
			</div>
		</a>


	</div>
</div>
<div class="screen">
	<div class="screenin">
		<div class="screenBox">
			<ul>
				<li class="list1"><p class="title">ADDRESS</p><p class="line">&nbsp;</p><p>浙江省瑞安市合作区不锈钢资源加工园区内</p></li>
				<li class="list2"><p class="title">CALL US</p><p class="line">&nbsp;</p><p>4008-8783888</p></li>
				<li class="list3"><p class="title">FAX</p><p class="line">&nbsp;</p><p>4008-8783888</p></li>
				<li class="list4"><p class="title">POSTCODE</p><p class="line">&nbsp;</p><p>200041</p></li>
			</ul>
			<div class="close" id="close"></div>
		</div>
	</div>
</div>
</body>
</html>
