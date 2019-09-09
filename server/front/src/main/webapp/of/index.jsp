<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="煤亮子,煤亮子商城"/>
<meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
<title>会员中心-煤亮子</title>
<link href="${ctx}/of/css/office.css" rel="stylesheet" type="text/css" />
<script src="${ctx }/echarts/echarts.js" type="text/javascript"></script>
<script src="${ctx }/echarts/jquery-1.9.1.min.js" type="text/javascript"></script>
<style>
	.mycontainer{
		background: #fff;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		top.$.jBox.closeTip();
		if(false){
			setTimeout("$('#messageBox').hide(500)",3000);
		}
	});

</script>
</head>
<body>
<div class="wrapper wrapper-content">
	<div class="workplat"><p>工作台</p></div>
	<div class="colorkuai clearfix">
		<div class="centerbk clearfix">
			<div class="centerbk_1">
				<div class="color_left">
					<img src="${ctx}/images/colorkuai4.png">
				</div>
				<div class="color_right">
					<div class="color_right metion">融资额度(元)</div>
					<div class="color_right">￥0</div>
				</div>
			</div>
		</div>
		<div class="centerbk clearfix">
			<div class="centerbk_2">
				<div class="color_left">
					<img src="${ctx}/images/colorkuai5.png">
				</div>
				<div class="color_right">
					<div class="color_right metion">利息收入(元)</div>
					<div class="color_right">￥0</div>
				</div>
			</div>
		</div>
		<div class="centerbk clearfix">
			<div class="centerbk_3">
				<div class="color_left">
					<img src="${ctx}/images/colorkuai6.png">
				</div>
				<div class="color_right">
					<div class="color_right metion">自由货物库存</div>
					<div class="color_right">0</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 普通会员 -->
	<div class="workplat"><p>常用</p></div>
	<div class="uasual clearfix">
		<a class="J_menuItem" href="#">
			<div class="ususer">
				<img src="${ctx}/images/uasual1.png">
				<p>订单融资</p>
			</div>
		</a>
		<a href="#">
			<div class="ususer">
				<img src="${ctx}/images/uasual2.png">
				<p>仓单融资</p>
			</div>
		</a>
		<a href="#">
			<div class="ususer">
				<img src="${ctx}/images/uasual3.png">
				<p>我要出库</p>
			</div>
		</a>
		<a href="3">
			<div class="ususer">
				<img src="${ctx}/images/uasual4.png">
				<p>联系我们</p>
			</div>
		</a>
		<a href="#">
			<div class="ususer">
				<img src="${ctx}/images/uasual5.png">
				<p>关于我们</p>
			</div>
		</a>
		<a href="#">
			<div class="ususer">
				<img src="${ctx}/images/uasual6.png">
				<p>关于云仓</p>
			</div>
		</a>
	</div>
	<div class="workplat"><p>融资订单</p></div>
	<div class="layui-form">
		<table id="contentTable" class="layui-table">
			<thead>
			<tr>
				<th class="sort-column">融资申请编号</th>
				<th class="sort-column">代理订单编号</th>
				<th class="sort-column">代理公司</th>
				<th class="sort-column">资方</th>
				<th class="sort-column">放款金额(元)</th>
				<th class="sort-column">待还款金额(元)</th>
				<th class="sort-column">截止时间</th>
			</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
</div>
</body>
</html>
