]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>系统参数列表管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body >
<div class="search">
	<form  class="layui-form" id="searchForm">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">参数类型</label>
				<div class="layui-input-inline">
					<input type="text" name="search_like_iparatype" placeholder="参数类型" autocomplete="off" class="layui-input"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">参数说明</label>
				<div class="layui-input-inline">
					<input type="text" name="search_like_sremark" placeholder="参数说明" autocomplete="off" class="layui-input"/>
				</div>
			</div>
		</div>
	</form>
</div>

<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_SysParaType = ${cs:SysParaType()};
    layui.use(['table','layer'],function(){

        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/jj/parameter/list.json";
        jj.xurl="${ctx}/jj/parameter/";
        jj.cols= [[
            {type:'checkbox'}
            ,{field:'iparatype', title: '参数类型',sort: true,templet: function (d) {
                return g_SysParaType[d.iparatype];
            }}
            ,{field:'sparametervalue', title: '参数值',sort: true}
            ,{field:'sremark', title: '参数说明',sort: true}
            ,{field:'saddoperator', title: '添加人',sort: true}
            ,{field:'dadddate', title: '添加日期',sort: true}
            ,{field:'dmodifydate', title: '修改日期',sort: true}
            ,{field:'smodifyoperator', title: '修改人',sort: true}
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



<script type="text/html" id="xtoolbar">

	<jj:btn event="add" name="添加" purview="parameter:add"/>
	<jj:btn event="deleteAll" name="删除" purview="parameter:delete"/>

</script>


</body>
</html>
