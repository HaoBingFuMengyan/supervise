<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="keywords" content="煤亮子,煤亮子商城"/>
	<meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
	<title>煤亮子</title>
	<link type="image/x-icon" href="${ctx}/title/favicon.ico" rel="shortcut icon">
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
				<li><a href="${ctx}/help_P000018.html" >常见问题</a></li>
				<li><a class="active" href="${ctx}/newer_guide.html">新手指引</a></li>
				<li><a href="${ctx}/about_us.html">关于我们</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="cj_ques top50">
	<div class="mycon">
		<div class="newer_pd">
			<div class="newer_tit">常见问题</div>
			<div class="cj_list top50">
				<div class="cj_func cj_func1">
					<a href="">
						<div class="newer_icon func"></div>
						<h2>如何开店</h2>
					</a>
				</div>
				<div class="cj_func cj_func2">
					<a href="">
						<div class="newer_icon func"></div>
						<h2>如何发布产品</h2>
					</a>
				</div>
				<div class="cj_func cj_func3">
					<a href="">
						<div class="newer_icon func"></div>
						<h2>如何委托找货</h2>
					</a>
				</div>
				<div class="cj_func cj_func4">
					<a href="">
						<div class="newer_icon func"></div>
						<h2>发票问题</h2>
					</a>
				</div>
				<div class="cj_func cj_func5">
					<a href="">
						<div class="newer_icon func"></div>
						<h2>如何查找现货</h2>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="cj_ques top80">
	<div class="mycon">
		<div class="newer_pd">
			<div class="newer_tit">我是<font class="redfont">买家</font></div>
			<div class="graybg top30">
				<ul class="clearfix">
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="cj_ques top80 bottom80">
	<div class="mycon">
		<div class="newer_pd">
			<div class="newer_tit">我是<font class="bfont">卖家</font></div>
			<div class="graybg top30 salejia">
				<ul class="clearfix">
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
					<li><a href="">如何查找现货</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

</body>
</html>
