<%@ taglib prefix="fund" uri="http://www.frogsing.com/tags/fund" %>
]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>挂牌管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body >
<div class="search">
	<form  class="layui-form" id="searchForm">

	</form>
</div>


<table class="layui-hide" id="stable" lay-filter="stable" style="display: none;"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_FundPayType = ${fund:BillPaySrcType()};
    var g_BillPayStatus = ${fund:BillPayStatus()};
    var g_PayStartPoint = ${fund:PayStartPoint()};
    layui.use(['table','layer'],function(){

        jj.table =layui.table;

        var form = layui.form;
        jj.url="${ctx}/fund/billpay/project-list.json?sprojectid=${data.id}";
        jj.cols= [[
            {type:'checkbox'}
            ,{field:'spayno', title: '付款单号',sort: true}
            ,{field:'sbillno', title: '支付业务编号',sort: true}
            ,{field:'ipaytype', title: '支付业务类型',sort: true,templet: function (d) {
                return g_FundPayType[d.ipaytype];
            }}
            ,{field:'ipaystatus', title: '支付状态',sort: true,templet: function (d) {
                return g_BillPayStatus[d.ipaystatus];
            }}
            ,{field:'ddate', title: '付款单时间',sort: true}
            ,{field:'famount', title: '支付金额',sort: true}
            ,{field:'spayuser', title: '付款方',sort: true}
            ,{field:'isendpoint', title: '发起方',sort: true,templet: function (d) {
                return g_PayStartPoint[d.isendpoint];
            }}
            ,{fixed: 'right', align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
        ]];

        jj.width=500;
        jj.height=530;

        jj.limit=10000;
        jj.showtoolbar=false;
        jj.render({
            initSort:{
                field:"ddate",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.detail=function (obj) {
            layer.open({
                type: 2,
                title:"",
                area: ['1200px', '80%'],
                content: "${ctx}/billpay/detail.shtml?id="+obj.id ,
                btn: ['关闭'],
                btnAlign:'c',
                cancel: function(index){}
            });
        }

    });

</script>

<script type="text/html" id="barDemo">
	<div class="layui-btn-group" data-rowid="{{d.id}}">

	<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	</div>
</script>



</body>
</html>