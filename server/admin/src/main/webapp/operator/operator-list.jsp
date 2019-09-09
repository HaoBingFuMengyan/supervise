<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>员工管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body class="">
<div class="search" >
	<form  class="layui-form" id="searchForm">
		<sys:message content="${message}"/>
		<!-- 查询条件 -->
		<div class="layui-form-item">
			<label>用户名：</label>
			<div class="layui-inline">
				<input class="layui-input" name="search_like_susername" autocomplete="off">
			</div>
			<label>真实姓名：</label>
			<div class="layui-inline">
				<input class="layui-input" name="search_like_srealname" autocomplete="off">
			</div>
			<label>手机：</label>
			<div class="layui-inline">
				<input class="layui-input" name="search_like_smobile" autocomplete="off">
			</div>
			<p></p>
			<label>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
			<div class="layui-inline">
				<input class="layui-input" name="search_like_semail" autocomplete="off">
			</div>
		</div>
	</form>
</div>

<!-- 工具栏 -->
<div class="row">
	<script type="text/html" id="xtoolbar">
		<shiro:hasPermission name="operator:edit">
			<jj:listbtn name="添加" event="add"></jj:listbtn>
		</shiro:hasPermission>
	</script>

	<table class="layui-hide" id="stable" lay-filter="stable"></table>

	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>

        layui.use(['table','layer'],function(){


            jj.table =layui.table;
            jj.url="${ctx}/jj/operator/list.json?search_eq_sdepartmentid=${sdepartmentid}";
            jj.cols= [[
                {field:'susername', title: '登入名',sort: true}
                ,{field:'srealname', title: '真实姓名', sort: true}
                ,{field:'smobile',  title: '手机', sort: true}
                ,{field:'sphone', title: '电话' ,sort: true}
                ,{field:'semail', title: '邮箱',sort: true}
                ,{field:'sqq', title: 'QQ',sort: true}
                ,{field:'bisfreeze', title: '状态',sort: true,templet: '#titleTpl'}
                ,{fixed: 'right', width:250, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

            ]];
            jj.render({
                initSort:{
                    field:"susername",
                    type:"desc"
                },
                height:'full-100',
                page: true
            });

            jj.add=function(){

                var i=jj.open({
                    content: "${ctx}/jj/operator/detail.shtml?sdepartmentid=${sdepartmentid}"
                });
            };

        });
	</script>
	<script type="text/html" id="titleTpl">
		{{#  if(d.bisfreeze==0){ }}
		启用
		{{#  } else{}}
		禁用
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