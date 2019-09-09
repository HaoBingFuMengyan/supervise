]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body >
<div class="search">
	<form  class="layui-form" id="searchForm">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">名称</label>
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
        jj.url="${ctx}/jj/role/list.json?search_ne_iroletype=0";
        jj.xurl="${ctx}/jj/role/";
        jj.cols= [[
            {type:'checkbox'}
            ,{field:'srolename', title: '角色名称',sort: true}
            ,{field:'sremark', title: '角色描述',sort: true}
            ,{ fixed:'right', align:'left', toolbar: '#operation'} //这里的toolbar值是模板元素的选择器
        ]];

        jj.width=500;
        jj.height=530;

        jj.render({
            initSort:{
                field:"srolename",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });

    });

</script>
<script type="text/html" id="operation">
	<div class="layui-btn-group" data-rowid="{{d.id}}">
		<jj:listbtn name="查看" event="detail" purview="role:query"/>
		<jj:listbtn name="编辑" event="edit" purview="role:edit"/>
		<jj:listbtn name="删除" event="delete" purview="role:delete"/>
	</div>
</script>

<script type="text/html" id="xtoolbar">
	<div class="layui-btn-group">
		<jj:btn event="add" name="添加" purview="role:add" />
	</div>
</script>



</body>
</html>