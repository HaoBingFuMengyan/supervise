<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body class="">
<div class="search" >
	<form  class="layui-form" id="searchForm">
		<sys:message content="${message}"/>
		<!-- 查询条件 -->
		<div class="layui-form-item">
			<label>群名称：</label>
			<div class="layui-inline">
				<input class="layui-input" name="name" autocomplete="off">
			</div>
		</div>
	</form>
</div>

<!-- 工具栏 -->
<div class="row">
	<script type="text/html" id="xtoolbar">
		<shiro:hasPermission name="group:edit">
			<jj:listbtn name="添加" event="add"></jj:listbtn>
		</shiro:hasPermission>
	</script>

	<table class="layui-hide" id="stable" lay-filter="stable"></table>

	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
        var groupTypeMap = ${groupTypeMap};
        layui.use(['table','layer'],function(){


            jj.table =layui.table;
            jj.url="${ctx}/group/list.json";
            jj.cols= [[
                {field:'name', title: '群名称',sort: true}
                ,{field:'groupTypeName',  title: '群类型', sort: true,templet: function (d) {
						return groupTypeMap[d.igroupType];
					}}
                ,{field:'memberCount',  title: '用户数', sort: true}
                ,{field:'bulletin',  title: '群公告', sort: true}
                ,{field:'isort',  title: '排序号', sort: true}
                ,{field:'createdAt',  title: '添加时间', sort: true}
                ,{fixed: 'right', width:250, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

            ]];
            jj.render({
                initSort:{
                    field:"nickname",
                    type:"desc"
                },
                height:'full-100',
                page: true
            });

            jj.add=function(){

                var i=jj.open({
                    content: "${ctx}/group/detail.shtml"
                });
            };

        });
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