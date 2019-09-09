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
			<label>呢称：</label>
			<div class="layui-inline">
				<input class="layui-input" name="nickname" autocomplete="off">
			</div>
			<label>手机：</label>
			<div class="layui-inline">
				<input class="layui-input" name="phone" autocomplete="off">
			</div>
		</div>
	</form>
</div>

<script type="text/html" id="xtoolbar">
	<shiro:hasPermission name="users:edit">
		<jj:listbtn name="添加" event="add"></jj:listbtn>
	</shiro:hasPermission>
</script>
<!-- 工具栏 -->
<div class="row">
	<table class="layui-hide" id="stable" lay-filter="stable"></table>
</div>
	<script>
		<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
        layui.use(['table','layer'],function(){


            jj.table =layui.table;
            jj.url="${ctx}/users/list.json";
            jj.cols= [[
                {field:'nickname', title: '呢称',sort: true}
                ,{field:'phone',  title: '手机', sort: true}
                ,{field:'region',  title: '所属群', sort: true}
                ,{field:'isBoss',  title: '用户类型', sort: true,toolbar: '#titleTpl'}
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
                    content: "${ctx}/users/detail.shtml"
                });
            };

        });
	</script>
	<script type="text/html" id="titleTpl">
		{{#  if(d.isBoss==0){ }}
		交易员
		{{#  } else{}}
		领导
		{{#  } }}
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