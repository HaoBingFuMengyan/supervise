<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="none"/>
	<script type="text/javascript">
		     
		
	</script>

	<style type="text/css">
	.div-a{ background:url(div-a-bg.png) no-repeat;width:230px;height:136px;padding:10px;} 
	.div-b{ background:#000;width:200px;height:100px;padding:5px;font-size:12px;color:#FFFFFF; filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8}
	.ibox {
		margin-bottom: 30px;
		margin-top: 0;
		padding: 0;
		position: relative;
		width:33.33%;
		float: left;
		padding-right: 20px;
		box-sizing: border-box;
	}
	.ibox-title {
		-moz-border-bottom-colors: none;
		-moz-border-left-colors: none;
		-moz-border-right-colors: none;
		-moz-border-top-colors: none;
		background-color: #ffffff;
		border-color: #e7eaec;
		border-image: none;
		border-style: solid solid none;
		border-width: 4px 0px 0;
		color: inherit;
		margin-bottom: 0;
		padding: 14px 15px 7px;
		min-height: 26px;
		border-top: none;
	}
	.ibox-title h5 {
		display: inline-block;
		font-size: 14px;
		margin: 0 0 7px;
		padding: 0;
		text-overflow: ellipsis;
		float: left;
	}
	.ibox-content {
		background-color: #ffffff;
		color: inherit;
		padding: 40px 20px 20px 20px;
		border-color: #e7eaec;
		border-image: none;
		border-style: solid solid none;
		border-width: 1px 0px;
	}
	.tab-content .houseimg img {
		margin: 0 auto;
		height: 100%;
		display: block;
	}
	.tab-content .ckname {
		text-align: center;
		font-size: 18px;
		padding: 10px 0;
		color: #333;
	}
	.tab-content .addsq {
		margin-top: 45px;
	}
	.tab-content .addsq a {
		display: block;
		width: 100%;
		font-size: 14px;
		text-align: center;
		padding: 8px 0;
		color: #fff;
		background: #5ab6df;
		text-decoration: none;
	}
	.tab-content .addsq a.build{
		background: #dcdcdc;
	}
	</style>
	<script type="text/javascript">
		function openTab() {
            top.openTab('${ctx}/jj/indenture/list.shtml','库存管理',false);
        }
	</script>
</head>
<body class="gray-bg" style="background:#e6e8ea">
	
    <div class="wrapper wrapper-content clearfix" style="padding:0 40px;border-top:none;">
		<%--<a href="javascript:openTab()">打开仓单</a>--%>
		<div class="ibox">
			<div class="ibox-title" style="border-top:none;">

				<h5 style="color:#fc8675;font-weight: normal;">仓库编号：SMCK00001</h5>
			</div>
			<div class="ibox-content">
				<div class="tab-content"> <!-- navgation tab 主体 开始-->
					<div class="tab-pane fade in active">
						<div class="houseimg">
							<img src="${ctx}/common/images/wood-house.png">
						</div>
						<div class="ckname">神木1号库</div>
						<div class="addsq"><a href="javascript:openTab()">查看库存</a></div>
					</div>
				</div>
			</div>
		</div>
			<div class="ibox">
				<div class="ibox-title" style="border-top:none;">

					<h5 style="color:#fc8675;font-weight: normal;">仓库编号：SMCK00002</h5>
				</div>
				<div class="ibox-content">
					<div class="tab-content"> <!-- navgation tab 主体 开始-->
						<div class="tab-pane fade in active">
							<div class="houseimg">
								<img src="${ctx}/common/images/wood-house.png">
							</div>
							<div class="ckname">神木2号库</div>
							<div class="addsq"><a class="build" href ="javascript:return false;">建设中</a></div>
						</div>
					</div>
				</div>
			</div>
			<div class="ibox">
				<div class="ibox-title" style="border-top:none;">

					<h5 style="color:#fc8675;font-weight: normal;">仓库编号：SMCK00003</h5>
				</div>
				<div class="ibox-content">
					<div class="tab-content"> <!-- navgation tab 主体 开始-->
						<div class="tab-pane fade in active">
							<div class="houseimg">
								<img src="${ctx}/common/images/wood-house.png">
							</div>
							<div class="ckname">神木3号库</div>
							<div class="addsq"><a class="build" href ="javascript:return false;">建设中</a></div>
						</div>
					</div>
				</div>
			</div>
    </div>
     
</body>
</html>