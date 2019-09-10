<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>煤亮子(www.meiliangzi.cn)-帮助中心</title>
	<meta name="keywords" content="煤亮子,煤亮子商城"/>
	<meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
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
            $("#h_menu .mainlist li.liu").find("i").click(function(){
                if($(this).hasClass("icon-you2")){
                    $(this).removeClass("icon-you2").addClass("icon-weibiaoti35");
                    $(this).parents("li").find("ul").show("slow");
                }
                else{
                    $(this).removeClass("icon-weibiaoti35").addClass("icon-you2");
                    $(this).parents("li").find("ul").hide("slow");
                }
            });
            $(".inner-ul li a").each(function(){
                $this = $(this);
                if($this[0].href==String(window.location)){
                    $this.addClass("redfont");
                }
            });
        })
    </script>
</head>
<body>
<%--<div class="help_nav">--%>
	<%--<div class="mycon">--%>
		<%--<div class="h_logo left"><img src="${ctx}/images/help_logo.png"/></div>--%>
		<%--<div class="h_dao right">--%>
			<%--<ul class="clearfix">--%>
				<%--<li><a href="${ctx}/index.html" >首页</a></li>--%>
				<%--<li><a class="active" href="${ctx}/help_P000018.html">新手指引</a></li>--%>
				<%--<li><a href="${ctx}/about_us.html">联系我们</a></li>--%>
			<%--</ul>--%>
		<%--</div>--%>
	<%--</div>--%>
<%--</div>--%>
<div id="h_container">
    <div class="wid">
        <div id="h_content" class="clearfix">
            <!-- 左边菜单 -->
            <div id="h_menu">
                <ul class="mainlist">
                	<c:forEach items="${tree}" var="tre">
                		<c:choose>
                			<c:when test="${ not empty tre.children }">
                				<li class="liu">${tre.obj.sname}<i class="icon icon-weibiaoti35"></i>
	                				<ul class="inner-ul" style="display:block;">
		                				<c:forEach items="${tre.children}" var="oc">
		                					<li><a href="${ctx}/help_${oc.obj.scode}.html">${oc.obj.sname }</a></li>
		                				</c:forEach>
		                			</ul>
	                			</li>
                			</c:when>
                			<c:otherwise>
                				<li><a href="${ctx}/help_${tre.obj.scode}.html">${tre.obj.sname }</a></li>
                			</c:otherwise>
                		</c:choose>
                	</c:forEach>
                	<!-- <li class="diff">常见问题</li>
                    <li>账号问题<i class="icon icon-weibiaoti35"></i>
                        <ul style="display:block;">
                            <li><a href="">如何找回密码</a></li>
                            <li><a href="">如何修改登陆密码</a></li>
                            <li><a href="">如何变更手机号码</a></li>
                            <li><a href="">注册协议</a></li>
                        </ul>
                    </li>
                    <li>店铺问题<i class="icon icon-weibiaoti35"></i>
                        <ul style="display:block;">
                            <li><a href="">如何申请开店</a></li>
                            <li><a href="">如何发布产品</a></li>
                            <li><a href="">如何修改店铺信息</a></li>
                        </ul>
                    </li>
                    <li>购买问题<i class="icon icon-weibiaoti35"></i>
                        <ul style="display:block;">
                            <li><a href="">如何查找现货</a></li>
                            <li><a href="">如何购买现货</a></li>
                            <li><a href="">如何支付</a></li>
                            <li><a href="">发票问题</a></li>
                        </ul>
                    </li>

                </ul> -->
            </div>
            <!--右边 -->
            <div id="h_main">
            	<div class="main_con">
                	<div class="h_tit">${article.stitle }</div>
                	<div class="h_step top30">
                		${article.ac.bcontent }
                	</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
