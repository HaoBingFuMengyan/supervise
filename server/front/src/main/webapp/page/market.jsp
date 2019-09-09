<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/side.css">
<meta name="data-spm" content="">
<title>煤亮子(www.meiliangzi.cn)</title>
<meta name="keywords" content="煤亮子,煤亮子商城"/>
<meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
<link rel="stylesheet" href="${ctx}/css/buxiu.css">
<link rel="stylesheet" href="${ctx}/css/common.css">
<link rel="stylesheet" href="${ctx}/font/iconfont.css">
<link rel="stylesheet" href="${ctx}/css/static.css">
<link rel="stylesheet" href="${ctx}/css/liMarquee.css">
<script src="${ctx}/js/saved1.js"></script>
<script src="${ctx}/js/jquery-1.11.3.js"></script>
<script src="${ctx}/js/jquery.liMarquee.js"></script>

<script type="text/javascript" src="${ctx}/js/queryData.js"></script>
<script>
	$(function(){
	    //展开按钮
		$(".icon-open").click(function(){
		    if($(this).hasClass('open')){
                $(this).removeClass('open');
                $(this).parent().find('ul').css({"height":"30px"});
			}
			else{
                $(this).addClass('open');
                $(this).parent().find('ul').css({"height":"auto"});
			}
		})
		$(".botRegFixed .closeBtn").click(function(){
		    $(".botRegFixed").hide();
		})
	})
</script>
</head>
<body>
<div class="find top20">
	<div class="mycon">
		<div class="mk">
			<dl class="clearfix ">
				<dt class="left">主机名称：</dt>
				<dd class="left">
					<ul id="shostname" levl="5" class="clearfix kinds visible">
					</ul>
					<button class="icon icon-open icon-smalldown" style="display: none">展开</button>
				</dd>
			</dl>
			<dl class="clearfix ">
				<dt class="left">主机厂商：</dt>
				<dd class="left">
					<ul id="shostbrand" levl="4" class="clearfix kinds visible">
					</ul>
					<button class="icon icon-open icon-smalldown" style="display: none">展开</button>
				</dd>
			</dl>
			<dl class="clearfix ">
				<dt class="left">仓库：</dt>
				<dd class="left">
					<ul id="swarehousename" levl="3" class="clearfix kinds visible">
					</ul>
				</dd>
			</dl>
			<dl class="clearfix ">
				<dt class="left">验证：</dt>
				<dd class="left">
					<ul class="clearfix kinds visible">
						<li>
							<label>
								<input type="checkbox" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11">
								<img class="lamp" src="${ctx}/images/lamp-green.png" title="经认证，该资源在仓库系统信息完全符合，可放心购买"/>
							</label>
						</li>
						<li>
							<label>
								<input type="checkbox" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11">
								<img class="lamp" src="${ctx}/images/lamp-orange.png" title="经认证，该资源真实在库，但货主信息不符，购买后需等待供应商过户，2天后未转绿的订单自动撤销"/>
							</label>
						</li>
					</ul>
				</dd>
			</dl>
			<dl class="clearfix ">
				<dt class="left">资源类型：</dt>
				<dd class="left">
					<ul class="clearfix kinds visible">
						<li>
							<label>
								<input type="checkbox" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11">
								<img class="resource" src="${ctx}/images/metriel.png" />现货
							</label>
						</li>
						<li>
							<label>
								<input type="checkbox" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11">
								<img class="resource" src="${ctx}/images/sale.png" />预售
							</label>
						</li>
					</ul>
				</dd>
			</dl>
			<dl class="clearfix noborder">
				<dt class="left top10">搜索：</dt>
				<dd class="left">
					<form>
						<input type="hidden" id="skeywords" name="skeywords" value="${skeywords}" />
						<div class="input_group input_group_xs bottom20 left search">
							<label>供应商</label><input class="form_control" id="smembername" name="smembername"/>
							<label>主机型号</label><input class="form_control" id="shostmodel" name="shostmodel" />
							<label>物资名称</label><input type="text" class="form_control" id="wuzi" />
							<label>规格型号</label><input class="form_control" id="sspec" name="sspec"/>
						</div>
					</form>
					<button class="sure" id="formSubmit">确定</button>
					<button class="clean" id="cleanForm">清空</button>
				</dd>

			</dl>
		</div>

		<div id="supermarket-sorting-li" class="re_list top30">

		</div>

	</div>
</div>


<div class="box-adv-col1">
	<div class="item-adv-simple">
		<a href="#"><img alt="" src="${ctx}/images/ad5.png"></a>
	</div>
</div>
<div class="list-partner clearfix">
	<a href="#" class="partner-link"><img src="${ctx}/images/pn1.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn2.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn3.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn4.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn5.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn6.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn7.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn8.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn9.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn10.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn11.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn12.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn13.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn14.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn15.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn16.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn17.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn18.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn19.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn20.png" alt=""></a>
	<a href="#" class="partner-link"><img src="${ctx}/images/pn21.png" alt=""></a>
</div>
<div class="botRegFixed" style="">
	<a href="${ctx}/register.html" class="regBtn"></a>
	<a class="closeBtn">×</a>
</div>
<script src="${ctx}/js/data.js"></script>
</body>
</html>
