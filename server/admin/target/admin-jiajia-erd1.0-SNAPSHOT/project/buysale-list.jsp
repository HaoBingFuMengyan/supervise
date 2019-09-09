<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>采购-销售</title>
	<meta name="decorator" content="jj" />
</head>
	<div style="padding: 20px; background-color: #F2F2F2;">
	<div class="layui-row layui-col-space15">
			<form class="layui-form layui-form-pane" action="">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header"><strong>增加采购销售记录</strong></div>
					<div class="layui-card-body">

						<div class="layui-row">
							<div class="layui-col-xs3">
								<div class="grid-demo grid-demo-bg1">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">当日实际采购数量</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">次日可采购数量</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo grid-demo-bg1">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">次日预计采购数量</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">当周预计采购数量</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="layui-row">
							<div class="layui-col-xs3">
								<div class="grid-demo grid-demo-bg1">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">当日采购点价</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">当日销售点价</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo grid-demo-bg1">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">采购点价期货套保余额</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">销售点价期货套保余额</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="layui-row">
							<div class="layui-col-xs3">
								<div class="grid-demo grid-demo-bg1">
									<div class="layui-form-item layui-form-text">
										<label class="layui-form-label">前日生产总数</label>
										<div class="layui-input-block">
											<input type="text" name="number" autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo" style="margin-left: 30px;margin-top: 15px;">
									<button class="layui-btn layui-btn-lg layui-btn-normal">增加</button>
								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo grid-demo-bg1">

								</div>
							</div>
							<div class="layui-col-xs3">
								<div class="grid-demo">

								</div>
							</div>
						</div>




					</div>
				</div>
			</div>
</form>


			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header"><strong>历史采购销售记录</strong></div>
					<div class="layui-card-body">
						<div class="search">
							<form  class="layui-form" id="searchForm">
								<div class="layui-form-item">
									<div class="layui-inline">
										<label class="layui-form-label">查询条件</label>
										<div class="layui-input-inline">
											<input type="text" name="search_like_srolename" placeholder="" autocomplete="off" class="layui-input"/>
										</div>
									</div>
								</div>
							</form>
						</div>

						<table class="layui-hide" id="stable" lay-filter="stable"></table>

						<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

						<script>
                            layui.use(['table','layer'],function(){

                                jj.table =layui.table;
                                var form = layui.form;
                                jj.url="${ctx}/jj/buysale/list.json";
                                jj.xurl="${ctx}/jj/buysale/";
                                jj.cols= [[
                                    {field:'ftodayrealitybuyweight', title: '当日实际采购数量',sort: true}
                                    ,{field:'ftomorrowmaybuyweight', title: '次日可采购数量',sort: true}
                                    ,{field:'ftomorrowplanbuyweight', title: '次日预计采购数量',sort: true}
                                    ,{field:'fweekplanbuyweight', title: '当周预计采购数量',sort: true}
                                    ,{field:'ftodaybuyprice', title: '当日采购点价',sort: true}
                                    ,{field:'ftodaysaleprice', title: '当日销售点价',sort: true}
                                    ,{field:'fbuypricefuturesbalance', title: '采购点价期货套保余额',sort: true}
                                    ,{field:'fsalepricefuturesbalance', title: '销售点价期货套保余额',sort: true}
                                    ,{field:'fprice', title: '前日生成总数',sort: true}
                                ]];

                                jj.width=500;
                                jj.height=530;

                                jj.render({
                                    initSort:{
                                        field:"dadddate",
                                        type:"desc"
                                    },
                                    cellMinWidth:80,
                                    page: true
                                });

                            });

						</script>



					</div>
				</div>
			</div>
	</div>
</div>

</body>
</html>