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
    <script>
        $(function(){
            var down = $("#h_menu ul.mainlist li i");
            var inner =$("#h_menu ul.mainlist li ul");
            $("#h_menu .mainlist").find("li").click(function(){
                if($(this).find("i").hasClass("icon-you2")){
                    $(this).find("i").removeClass("icon-you2").addClass("icon-weibiaoti35");
                    $(this).find("ul").show("slow");
                }
                else{
                    $(this).find("i").removeClass("icon-weibiaoti35").addClass("icon-you2");
                    $(this).find("ul").hide("slow");
                }
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
				<li><a href="${ctx}/index.html" >首页</a></li>
				<li><a href="${ctx}/help_P000023.html" >新手指引</a></li>
				<li><a class="active" href="${ctx}/about_us.html">联系我们</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="about_tit top50">
	<div class="mycon">
		<div class="a_logo">
			<img src="${ctx}/images/about_logo.png" />
			<%--<span>煤亮子林产品交易中心</span>--%>
			<h2 class="top20">领先的安全、稳定的一站式平台</h2>
			<p>采购、仓储、物流、供应链的一站式平台,煤亮子助您飞跃发展</p>
		</div>
		<div class="cj_list top50">
			<div class="cj_func cj_func1">
				<a href="${ctx}/auction/lobby.html">
					<img src="${ctx}/images/ab_icon1.png" />
					<h2 class="diff">采购</h2>
				</a>
			</div>
			<div class="cj_func cj_func2">
				<a href="#">
					<img src="${ctx}/images/ab_icon2.png" />
					<h2 class="diff">物流</h2>
				</a>
			</div>
			<div class="cj_func cj_func3">
				<a href="#">
					<img src="${ctx}/images/ab_icon3.png" />
					<h2 class="diff">仓储</h2>
				</a>
			</div>
			<div class="cj_func cj_func4">
				<a href="${ctx}/unity.html">
					<img src="${ctx}/images/ab_icon4.png" />
					<h2 class="diff">联合采购</h2>
				</a>
			</div>
			<div class="cj_func cj_func5">
				<a href="${ctx}/finance.html">
					<img src="${ctx}/images/ab_icon5.png" />
					<h2 class="diff">供应链</h2>
				</a>
			</div>
		</div>

	</div>
</div>
<div class="about_tit top80 map_bg">
	<div class="mycon">
		<div class="a_logo">
			<h2 class="top20">以用户为中心、以服务为主导</h2>
			<p>供应链平台具有创新、协同、共赢、共享、绿色等特征，推进不锈钢供应链创新发展</p>
		</div>
	</div>
</div>
<div class="blue_bg">
	<div class="about_intro">
		<div class="pic">
			<img src="${ctx}/images/company-img.jpg" alt="">
		</div>
		<div class="intro">
			<div class="intro-tit">公司简介</div>
			<div class="detial">
				<h2>“浙江云篮供应链管理有限公司”旗下的不锈钢供应链平台</h2>
				<p>是国内率先致力于不锈钢产业供给侧结构性改革的新方向+共享经济为核心【产业+互联网+金融资本】的不锈钢产业链整合服务平台。</p>
				<p>【煤亮子】平台依托互联网数据接入以一线钢厂资源共享为端口，以不锈钢供 需和价值为导向，以不锈钢加工配送中心为服务点，以智能仓储物流+供应链金融为动力，以降低成本提高质量增加效率为目标.   构建不锈钢产业链B2B+O2O交易平台</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
