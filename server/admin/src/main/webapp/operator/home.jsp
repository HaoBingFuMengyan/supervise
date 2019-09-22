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
	<script src="${ctx}/common/js/echarts/echarts.min.js"></script>
	<style type="text/css">

	body{
		height: auto!important;
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
        <div class="row mtitle">
        	<div class="col-md-12">
        		<div class="infor"><i class="fa fa-institution"></i> <span class="nav-label">数据统计</span></div>
        	</div>
        </div>
         <div class="row colorkuai">
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_1">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>88</h2>
                            	<p>入驻企业数量</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-user"></i></div>
                            </div>
                       </div>
                  </div>
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_2">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>65</h2>
                            	<p>备案基金数量</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-list-ul"></i></div>
                            </div>
                       </div>
                  </div>
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_3">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>20,938,388</h2>
                            	<p>入驻企业认缴规模</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-soundcloud"></i></div>
                            </div>
                       </div>
                  </div>
                  <div class="col-sm-6 col-xs-12 col-md-3">
                       <div class="centerbk_4">
                            <div class="col-sm-9 col-xs-9">
                            	<h2>16,348,348</h2>
                            	<p>备案基金认缴规模</p>
                            </div>
                            <div class="col-sm-3 col-xs-3">
                                 <div class="myicon"><i class="fa fa-gears"></i></div>
                            </div>
                       </div>
                  </div>
               </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">年</span>
                        <h5>入驻企业数量</h5>
                    </div>
                    <div class="ibox-content" id="main" style="height: 400px">

                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">年</span>
                        <h5>备案基金数量</h5>
                    </div>
                    <div class="ibox-content" id="main1" style="height: 400px">

                    </div>
                </div>
            </div>
			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">全部</span>
						<h5>入驻企业风险评级分布</h5>
					</div>
					<div class="ibox-content" id="main2" style="height: 400px">

					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">全部</span>
						<h5>入驻企业业务类型分布</h5>
					</div>
					<div class="ibox-content" id="main3" style="height: 400px">

					</div>
				</div>
			</div>
        </div>
    </div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '入驻企业数量',
                textStyle: {//副标题文本样式{"color": "#aaa"}
                    fontSize: 14,
                    fontStyle: 'normal',
                    fontWeight: 'normal',
                },
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            xAxis: {
                type: 'category',
                data: ['1', '2', '3', '4', '5', '6', '7','8','9']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [10, 20, 40, 32, 60, 80, 90,100,180],
                type: 'line',
                smooth: true
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
	</script>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main1'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '备案基金数量',
                textStyle: {//副标题文本样式{"color": "#aaa"}
                    fontSize: 14,
                    fontStyle: 'normal',
                    fontWeight: 'normal',
                },
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            xAxis: {
                type: 'category',
                data: ['1', '2', '3', '4', '5', '6', '7','8','9']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [0, 0, 5, 10,20, 23, 40,90,150],
                type: 'line',
                smooth: true
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
	</script>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));

        // 指定图表的配置项和数据
        var option = {
            title : {
                text: '入驻企业风险评级分布',
                textStyle: {//副标题文本样式{"color": "#aaa"}
                    fontSize: 14,
                    fontStyle: 'normal',
                    fontWeight: 'normal',
                },
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:['优秀','良好',"瑕疵",'风险']
            },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:300, name:'优秀'},
                        {value:200, name:'良好'},
                        {value:20, name:'瑕疵'},
                        {value:8, name:'风险'}
                    ]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
	</script>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main3'));

        // 指定图表的配置项和数据
        var option = {
            title : {
                text: '入驻企业业务类型分布',
                textStyle: {//副标题文本样式{"color": "#aaa"}
                    fontSize: 14,
                    fontStyle: 'normal',
                    fontWeight: 'normal',
                },
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:['基金管理人','创投基金']
            },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:300, name:'基金管理人'},
                        {value:200, name:'创投基金'}
                    ]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
	</script>
</body>
</html>