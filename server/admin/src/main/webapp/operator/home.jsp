<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		     
		
	</script>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/common/css/tooltip-classic.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/common/css/addm.css" />

	<style type="text/css">
	.div-a{ background:url(div-a-bg.png) no-repeat;width:230px;height:136px;padding:10px;} 
	.div-b{ background:#000;width:200px;height:100px;padding:5px;font-size:12px;color:#FFFFFF; filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8}
	body{
		height: auto!important;
		background: url(${ctx}/common/images/homebg.jpg?v=1) no-repeat center center;
		background-size: 100% 100%;
		width: 100%!important;
	}
	.link{
		width: 800px;
		margin: 0 auto;
		margin-top: 6%;
	}
	.link img.logo{
		width: 100%;
		display: block;
	}
	.link ul{
		text-align: center;
		margin-top: 120px;
	}
	.link ul li{
		width:49%;
		display: inline-block;
		padding: 0 30px;
	}
	.link ul li a{
		display: block;
		padding: 20px 0;
		background: rgba(255,255,255,0.5);
	}
	.link ul li img{
		width: 32%;
		display: block;
		margin:0 auto;
	}
	.link ul li p{
		display: block;
		text-align: center;
		color:#fff;
		font-size: 26px;
	}
	</style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
		<div class="link">
			<!-- <img class="logo" src="${ctx}/common/images/mei-logo1.png">
			<ul>
				<li>
					<a href="${ctx}/center.shtml">
						<img src="${ctx}/common/images/center-icon2.png">
						<p>金融监管仓</p>
					</a>
				</li>
				<li>
					<a target="_blank" href="http://fk.meiliangzi.cn/index.shtml">
						<img src="${ctx}/common/images/center-icon1.png">
						<p>风控系统</p>
					</a>
				</li>
			</ul> -->
		</div>
        <!-- <div class="row mtitle">
        	<div class="col-md-12">
        		<div class="infor"><i class="fa fa-institution"></i> <span class="nav-label">云仓信息</span></div>
        	</div>
        </div> -->
        <!-- <div class="row colorkuai">
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_1">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>88</h2>
                            	<p>当前用户数量</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-user"></i></div>
                            </div>
                       </div>
                  </div>
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_2">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>5</h2>
                            	<p>本月新增用户数</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-list-ul"></i></div>
                            </div>
                       </div>
                  </div>
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_3">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>88</h2>
                            	<p>当前云仓数量</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-soundcloud"></i></div>
                            </div>
                       </div>
                  </div>
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_4">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>8</h2>
                            	<p>本月新增云仓数量</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-gears"></i></div>
                            </div>
                       </div>
                  </div>
               </div> -->
        <!-- 待办事宜开始 -->
        <!-- <div class="row">
					<div class="col-md-12">
						<div class="widget box forhigh">
							<div class="widget-header">
								<h4 style="font-weight:normal;"><i class="fa fa-book"></i> 待办事宜</h4>
							</div>
							<div class="widget-content">
								<div class="tabbable box-tabs">
									<ul class="nav nav-tabs">
										<li><a href="#box_tab3" data-toggle="tab">待确认合同</a></li>
										<li><a href="#box_tab2" data-toggle="tab">待审核单据</a></li>
										<li class="active"><a href="#box_tab1" data-toggle="tab">待确认合同</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="box_tab1">
											<p>Content #1</p>
										</div>
										<div class="tab-pane" id="box_tab2">
											<p>Content #2</p>
										</div>
										<div class="tab-pane" id="box_tab3">
											<p>Content #3</p>
										</div>
									</div>
								</div> /.tabbable portlet-tabs
							</div> /.widget-content
						</div> /.widget .box
					</div> /.col-md-12
				</div> /.row -->
				<!-- /Box Tabs -->
       <%-- <div class="row">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">全部</span>
                        <h5>当前用户数量</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="J_menuItem" href="javascript:void(-1)" onclick="doOpenTab(1)">${currCustomerCount}</a></h1>
                        <div class="stat-percent font-bold text-success"><!-- 98% <i class="fa fa-bolt"></i> -->
                        </div>
                        <small>总数量</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">月</span>
                        <h5>本月新增用户数</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="J_menuItem" href="javascript:void(-1)" onclick="doOpenTab(3)">${currMonthCustomerCount}</a></h1>
                        <div class="stat-percent font-bold text-info"><!-- 20% <i class="fa fa-level-up"></i> -->
                        </div>
                        <small>新用户</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">全部</span>
                        <h5>当前云仓数量</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><a class="J_menuItem" href="javascript:void(-1)" onclick="doOpenTab(3)">${currMonthCustomerCount}</a></h1>
                        <div class="stat-percent font-bold text-navy"><!-- 44% <i class="fa fa-level-up"></i> -->
                        </div>
                        <small>总数量</small>
                    </div>
                </div>
            </div>
        </div>  --%>
    </div>
     
</body>
</html>