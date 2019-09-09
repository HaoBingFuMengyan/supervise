<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords" content="煤亮子,煤亮子商城"/>
<meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
<title>煤亮子</title>
<link href="${ctx}/css/news.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
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
<div class="adress top20">
	<div class="mycon fontsz"><span class="icon icon-dizhi1"></span>您所在的位置：<font>${ni.sname }</font></div>
</div>
<div class="news clearfix top10">
	<div class="mycon">
		<div class="news_le width-line">
			<div class="de_tit">
				<div class="bigsize">${at.stitle}</div>
				<div class="comefrom bottom10">作者：${at.sauthor}&nbsp;&nbsp;&nbsp;&nbsp;来源：${at.sresourcename }</div>
				<font><mw:format label='date' value='${at.dpublishdate}'></mw:format></font>
		   </div>
			<div class="de_wz">
				${at.ac.bcontent}
			</div>
			<!-- JiaThis Button BEGIN -->
			<div class="jiathis_style_32x32 bottom30 top30 clearfix">
				<a class="jiathis_button_cqq right"></a>
				<a class="jiathis_button_weixin right"></a>
				<a class="jiathis_button_qzone right"></a>
				<a class="jiathis_button_tsina right"></a>
			</div>
			<div class="nextfive top20 clearfix">
				<div class="next_tit bottom20">
					<span>下5条资讯</span>
				</div>
				<ul class="clearfix width-line">
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach items="${list}" var="obj" >
								<li><span class="left">[${ni.sname }]</span><span class="right"><mw:format label='date' value='${obj.dpublishdate}'></mw:format></span><a href="${ctx}/news_detial.html?id=${obj.id}">${obj.stitle}</a></li>
								<c:if test="${size lt 5 }"><li>没有更多的内容了</li></c:if>
							</c:forEach>
						</c:when>
						<c:otherwise><li>没有更多的内容了</li></c:otherwise>
					</c:choose>
					
					<!-- <li><span class="left">[新闻中心]</span><span class="right">2017-11-11</span><a>早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡沫</a></li>
					<li><span class="left">[新闻中心]</span><span class="right">2017-11-11</span><a>早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡沫</a></li>
					<li><span class="left">[新闻中心]</span><span class="right">2017-11-11</span><a>早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡沫</a></li>
					<li><span class="left">[新闻中心]</span><span class="right">2017-11-11</span><a>早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡早知道你只是飞鸟，难道就不寂寞，爱本是泡沫</a></li> -->
				</ul>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
</body>
</html>
