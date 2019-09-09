<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="煤亮子,煤亮子商城"/>
<meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
<title>行情资讯_煤亮子</title>
<link href="${ctx}/css/news.css" rel="stylesheet" type="text/css">
<script src="${ctx}/static/infinite-scroll/infinite-scroll.pkgd.min.js"></script> 
<script type="text/javascript">
	var flag=true;
	$(function(){
	    var type = '${param.type}';
	    if (type == 0 && type!= ""){
	        $(".news-kind li").removeClass("active");
            $(".news-kind li:eq(3)").addClass("active");
		}
		$(".news-kind .zi ul li").mouseover(function(){
			$("div.container").find("div.xc").html("");
			var index=$(this).index();
			$(this).addClass('active').siblings().removeClass('active');
			//$('.container .xc').removeClass('display');
			//$('.container .xc').eq(index).addClass('display');
			getnewslist();
		});
		$(".newslist:last").css({"border":"none"});
		getnewslist();
		$(window).scroll(function() {
			if($(window).height() - $(window).scrollTop()<1000&&flag&&($("div.container").find("div.newslist").length)%6==0){
				flag=false;
				getnewslist();
			}
				
			});
	});
	function getnewslist(){
		$.ajax({
			type: "post",
			url: "${ctx}/newslist.html",
			data: {"scode":$(".news-kind .zi ul li.active").attr("data-scode"),"sarticleid":$("div.container").find("div.newslist:last").attr("data-id") },
			success: function(data) {
				$("div.container").find("div.xc").append(data);
				flag=true;
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	}
	
	//委托找货
	function purchase(){
		$.post("${ctx}/resource/purchase_index.json",$("#purchaseForm").serialize(),function(result){
		    if(result.success){
		    	alert("发布委托找货成功");
		    }else{
		    	alert(result.msg);
		    }
		  });
	}
	
</script>
</head>
<body>
<div class="news clearfix">
	<div class="news-ban">
		<h2>新闻中心</h2>
		<p>NEWS CENTER</p>
	</div>
	<div class="mycon">
		<div class="news-kind">
			<div class="zi clearfix">
				<ul>

					<li class="active" data-scode="P000011">煤亮子资讯</li>
					<li data-scode="P000012">行业动态</li>
					<li data-scode="P000013">钢知识</li>
					<li data-scode="P000010">煤亮子公告</li>
				</ul>
			</div>
		</div>
		<div class="news_le right">
			<div class="gy">
				<div class="container">
					<div class="display xc">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
