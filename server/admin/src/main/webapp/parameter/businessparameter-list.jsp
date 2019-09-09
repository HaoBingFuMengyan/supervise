]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>业务参数列表管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body >
<div class="search">
	<form  class="layui-form" id="searchForm">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">参数类型</label>
				<div class="layui-input-inline">
					<cs:BizParaType name="search_eq_iparatype" id="iparatype" val="${search_eq_iparatype}" option="class='form-control'" defname="" op="select"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">参数说明</label>
				<div class="layui-input-inline">
					<input type="text" name="search_eq_sparametername" id="sparametername" value="${search_eq_sparametername}" class="form-control"/>
				</div>
			</div>
		</div>
	</form>
</div>

<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_SysParaType = ${cs:BizParaType()};
    layui.use(['table','layer'],function(){

        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/jj/businessparameter/list.json";
        jj.xurl="${ctx}/jj/businessparameter/";
        jj.cols= [[
            {type:'checkbox'}
            ,{field:'iparatype', title: '参数类型',sort: true,templet: function (d) {
                return g_SysParaType[d.iparatype];
            }}
            ,{field:'isort', title: '排序号',sort: true}
            ,{field:'sparametername', title: '参数名称',sort: true}
            ,{field:'sparametervalue', title: '参数值',sort: true}
            ,{field:'sremark', title: '参数说明',sort: true}
            ,{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
        ]];

        jj.width=600;
        jj.height=430;

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

	<jj:btn event="add" name="添加" purview="businessparameter:add"/>
	<jj:btn event="deleteAll" name="删除" purview="businessparameter:delete"/>

</script>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group" data-rowid="{{d.id}}">
		<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
	</div>
</script>
</body>
</html>