<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>结算单管理</title>
	<script type="text/javascript">
        $().ready(function () {
            $("#paymember").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
        });
	</script>
</head>
<body >
<form  id="searchForm" class="layui-form">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">结算单号</label>
					<div class="layui-input-inline">
						<input type="text" name="search_like_scode" placeholder="" autocomplete="off" class="layui-input"/>
					</div>
				</div>
					<div class="layui-inline">
						<label class="layui-form-label">项目编号</label>
						<div class="layui-input-inline">
							<input type="text" name="search_like_project.scode" placeholder="" autocomplete="off" class="layui-input"/>
						</div>
					</div>
				<div class="layui-inline">
					<label class="layui-form-label">支付会员</label>
					<div class="layui-input-inline">
						<input type="text" id="paymember" name="search_like_paymber.scnname" placeholder="" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-inline">
						<project:ProjectSettleStatus op="select" option="class='layui-input'" defname="全部" defval="" name="search_eq_istatus"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">日期</label>
					<div class="layui-input-inline">
						<input type="text" id="ddatestart" name="search_gtetime_ddate" class="layui-input" placeholder="开始日期" readonly/>
					</div>
					<div class="layui-form-mid layui-word-aux">-</div>
					<div class="layui-input-inline">
						<input type="text" id="ddateend" name="search_ltetime_ddate" class="layui-input" placeholder="截止日期" readonly/>
					</div>
				</div>
			</div>
		</form>

		<table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_ProjectSettleStatus = ${project:ProjectSettleStatus()};
    layui.use(['table','layer','laydate'],function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#ddatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#ddateend',
            event: 'focus'
        });
        jj.table =layui.table;
        jj.url="${ctx}/projectsettle/chain-list.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scode', title: '结算单号',width:120,sort: true}
            ,{field:'id', title: '项目编号',width:120,sort: true,templet:function (d) {
					return d.project.scode;
                }}
            ,{field:'id', title: '支付会员',minWidth:150,sort: true,templet:function (d) {
					return d.paymber.scnname;
                }}
            ,{field:'famount', title: '结算总额(元)',width:120,sort: true,align:'right'}
            ,{field:'fdiscount', title: '优惠金额(元)',width:120,sort: true,align:'right'}
            ,{field:'freceivable', title: '应收金额(元)',width:120,sort: true,align:'right'}
            ,{field:'istatus', title: '状态',sort: true,templet:function (d) {
                    return g_ProjectSettleStatus[d.istatus];
                }}
            ,{field:'ddate', title: '申请日期',sort: true,width:160}
            ,{field:'dsettledate', title: '结算日期',sort: true,width:100,templet:function (d) {
					return tt.toDate(d.dsettledate);
                }}
            ,{field:'dpaydate', title: '支付日期',sort: true,width:160,hide:true}
            ,{field:'scurpayserialno', title: '付款单号',sort: true,width:160,hide:true}
            ,{ align:'left', toolbar: '#barDemo',width:150,fixed:'right'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"ddate",
                type:"desc"
            },
            cellMinWidth:100,
            page: true
        });

        jj.detail=function (d) {
            layer.open({
                type: 2,
                title:'结算单详情',
                area: ['80%', '80%'],
                content: '${ctx}/projectsettle/detail_'+d.id+'.shtml',
                btn: ['关闭'],
                cancel: function(index){}
            });
        }

        jj.projectsettlegathering = function (d) {
            layer.open({
                type: 2,
                title: '生成收款单',
                area: ['80%', '85%'],
                content: '${ctx}/projectsettle/projectsettlegathering_' + d.id + '.shtml',
                btn: ['生成收款单', '关闭'],
                yes: function (index, layero) {
                    layer.confirm('确定要生成收款单吗？', {
                        btn: ['确定', '取消'] //按钮
                    }, function () {
                        var iframeWin = layero.find('iframe')[0];
                        var $ = iframeWin.contentWindow.$;
                        var doc = $(iframeWin.contentWindow.document);
                        doc.find('form').first().submit();
                    }, function () {
                        jj.closeAll(1);
                    });
                },
                cancel: function (index) {
                }
            });
        };
        jj.openTicket=function (d) {
            jj.xopen({
                content: '${ctx}/ht/receiptInfo/toreceiptinfo.shtml?projectsettleid='+d.id
            });
        }

    });

</script>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group" data-rowid="{{d.id}}">
		<jj:listbtn name="查看" event="detail" purview="" type="a"/>
		<jj:listbtn name="开票" event="openTicket" purview="billpay:add" type="a" />
		{{# if(d.istatus==30) { }}
			<jj:listbtn name="生成收款单" event="projectsettlegathering" purview="billpay:add" type="a" />
		{{#  } }}
	</div>
</script>




</body>
</html>