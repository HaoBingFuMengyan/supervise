<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
	<title>代理销售项目管理</title>
</head>
<body >
<form id="searchForm" class="layui-form">
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">项目编号</label>
			<div class="layui-input-inline">
				<input type="text" name="search_like_scode" placeholder="" autocomplete="off" class="layui-input"/>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-inline">
				<project:ProjectStatus op="select" option="class='layui-input'" name="search_eq_istatus" defval=""
									   defname="全部"/>
			</div>
		</div>
	</div>
</form>
<table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_istatus=${project:ProjectStatus()};
    layui.use(['table','layer'],function(){
        jj.table =layui.table;
        jj.url="${ctx}/projectproxy/list.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scode', title: '项目编号',sort: true,width:150}
            ,{field:'swarehousecontractno', title: '仓储合同号',sort: true,width:150}
			,{field:'ssupplychainname', title: '供应链公司',sort: true,minWidth:200}
            ,{field:'fprojectamount', title: '存货总额(元)',sort: true,width:120,align:'right'}
            ,{field:'fbuyamount', title: '销售总额(元)',sort: true,width:120,align:'right'}
            ,{field:'none', title: '销售数量',width:100,hide:true,align:'right',sort: true,templet:function(d){
                    return d.ext.fsaleweight;
                }}
            ,{field:'swarehousename', title: '存货仓库',sort: true,minWidth:200}
            ,{field:'istatus', title: '状态',width:100,sort: true,templet:function(d){
                    return g_istatus[d.istatus];
                }}
            ,{field:'bisstock', title: '入库状态',width:100,sort: true,templet:'#stockinstatusTp'}
            ,{field:'none', title: '入库数量',width:100,hide:true,align:'right',sort: true,templet:function(d){
                    return d.ext.finweight;
                }}
            ,{field:'', title: '出库状态',width:100,sort: true,templet:"#stockoutstatus"}
            ,{field:'none', title: '出库数量',width:100,hide:true,align:'right',sort: true,templet:function(d){
                    return d.ext.foutweight;
                }}
            ,{ align:'left', toolbar: '#barDemo',width:150,fixed:'right'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"scode",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.detail=function(d){
            layer.open({
                type: 2,
                title:'代理销售项目详情',
                area: ['80%', '80%'],
                content: '${ctx}/project/index.shtml?id='+d.id,
                btn: ['关闭'],
                cancel: function(index){}
            });
        };
        jj.shure=function (obj) {
            var projectid=obj.id;
            layer.confirm('您确定要确认此项目吗？', {
                btn: ['确认','取消'] //按钮
            }, function(){
                jj.post("${ctx}/projectproxy/shure.json",{id:projectid});
            }, function(){
                jj.closeAll();
            });
        };
        jj.stockout=function(d){
            jj.xopen({
                area: ['80%', '80%'],
                content:'${ctx}/project/deliveryindentureadd.shtml?sprojectid='+d.id
            });
        };
    });

</script>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group" data-rowid="{{d.id}}">
		<jj:listbtn name="查看" event="detail" purview="" type="a"/>
		{{#  if(d.istatus==200 && d.bissellershure == 0){ }}
		<jj:listbtn name="确认项目" event="shure" type="a" purview="projectproxy:confirm"/>
		{{#  } }}

		{{#  if(d.istatus==320){ }}
		<jj:listbtn name="开提单" event="stockout" type="a" purview="deliveryorderandind:add"/>
		{{#  } }}
	</div>
</script>
<jsp:include page="../project-common-templete.jsp"/>

</body>
</html>