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
		</div>
	</form>
</div>

<!-- 工具栏 -->
<div class="row">
	<table class="layui-hide" id="stable" lay-filter="stable"></table>

	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
        layui.use(['table','layer'],function(){
            jj.table =layui.table;
            //监听表格复选框选择
            jj.table.on('radio(stable)', function(obj){
                parent.$("#operatoridAndName").val(obj.data.id+":"+obj.data.srealname);
                //console.log(obj.data.id+":"+obj.data.srealname);
            });
            jj.url="${ctx}/jj/operator/list.json?search_eq_sdepartmentid=${sdepartmentid}";
            jj.cols= [[
                {type: 'radio', fixed: 'left'}
                ,{field:'susername', title: '登入名',sort: true}
                ,{field:'srealname', title: '真实姓名', sort: true}
                ,{field:'smobile',  title: '手机', sort: true}
            ]];
            jj.render({
                initSort:{
                    field:"susername",
                    type:"desc"
                },
                height:'full-100',
                page: true
            });



        });
	</script>

</div>
</body>
</html>