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
                    <div class="layui-card-header"><strong>持仓</strong></div>
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <div class="layui-col-md4">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">自营</label>
                                        <div class="layui-input-block">
                                            <textarea class="layui-textarea" style="min-height: 60px;height: 60px;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md4">
                                <div class="grid-demo">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">非自营</label>
                                        <div class="layui-input-block">
                                            <textarea  class="layui-textarea" style="min-height: 60px;height: 60px;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md4">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">点价</label>
                                        <div class="layui-input-block">
                                            <textarea class="layui-textarea" style="min-height: 60px;height: 60px;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row">
                            <button class="layui-btn layui-btn-lg layui-btn-normal">保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>



            <div class="layui-col-md12">
                <form class="layui-form layui-form-pane" action="">
                <div class="layui-card">
                    <div class="layui-card-header"><strong>增加交易记录</strong></div>
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-md12">
                                <div class="grid-demo grid-demo-bg2">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">交易信息</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="number" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row">
                            <button class="layui-btn layui-btn-lg layui-btn-normal">增加</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>






        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header"><strong>历史交易记录</strong></div>
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
                            jj.url="${ctx}/jj/positiontransrecord/list.json";
                            jj.xurl="${ctx}/jj/positiontransrecord/";
                            jj.cols= [[
                                {field:'dadddate', title: '交易时间',sort: true,width:150}
                                ,{field:'scontent', title: '交易信息',sort: true}
                                ,{ fixed:'right', align:'left',width:100, toolbar: '#operation',} //这里的toolbar值是模板元素的选择器
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

<script type="text/html" id="operation">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="删除" event="delete" purview=""/>
    </div>
</script>
</body>
</html>