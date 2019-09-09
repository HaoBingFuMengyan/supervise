<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html style="overflow-x:hidden;overflow-y:auto;">
<head>
	<title>权限码管理</title>
</head>
<body class="">
<div class=" wrapper-content">
		<!-- 查询条件 -->
	<div class="row">
   <div class="col-sm-12">
	<form:form id="searchForm" action="" method="post" class="form-inline">
      <input type="hidden" name="search_eq_sparentid" value="${sparentid}"/>
		<table:sortColumn id="orderBy" name="orderBy" value="" callback="sortOrRefresh();"/><!-- 支持排序 -->
		<div class="form-group">
			<span>权限名称：</span>
				<input name="search_like_spurname" value="${search_like_spurname}" class="form-control"/>
			<span>权限代码：</span>
				<input name="search_like_spurcode" value="${search_like_spurcode}" class="form-control"/>
		 </div>	
	</form:form>
	<br/>
	</div>
	</div>
	 <sys:message content="${message}"/>
	<!-- 工具栏 -->
	<table class="layui-hide" id="stable" lay-filter="stable"></table>

	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>




        layui.use(['table','layer'],function(){

            jj.table =layui.table;
            jj.url="${ctx}/jj/purview/list.json";
            jj.cols= [[
                {type:'checkbox'}
                ,{field:'spurno',  title: '权限编号', sort: true}
                ,{field:'spurname', title: '权限名称',sort: true}
                ,{field:'sparentname',title: '父菜单名称',sort: true,templet:function (d) {
                    return d.sparentname;
                }}
                ,{field:'surlpath', title: '权限码' ,sort: true}
                ,{fixed: 'right', width:250, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

            ]];
            jj.render({
                initSort:{
                    field:"spurno",
                    type:"desc"
                },
                page: true,
            });

//        jj.add=function () {
//            var checkStatus = jj.table.checkStatus(jj.xtable); //test即为基础参数id对应的值
//            console.log(checkStatus.data) //获取选中行的数据
//            console.log(checkStatus.data.length) //获取选中行数量，可作为是否有选中行的条件
//            console.log(checkStatus.isAll ) //表格是否全选
//        }
            jj.add=function(){

                var i=jj.xopen({
					title:'新增权限',
                    content: "${ctx}/jj/purview/detail.shtml?sparentid=${sparentid}"
                });
            };


            jj.detail=function(obj){

                var i=jj.xview({
                    title:'查看权限',
                    content: "${ctx}/jj/purview/detail.shtml?id="+obj.id+"&sparentid="+obj.sparentid
                });

            }
            jj.height=500;
            jj.width=700;


            <%--jj.edit=function(obj){--%>

                <%--var i=jj.open({--%>
                    <%--content: "${ctx}/jj/purview/detail.shtml?id="+obj.id--%>
                <%--});--%>
                <%--layui.layer.full(i);--%>

            <%--}--%>
            <%--jj.delete=function (obj) {--%>
                <%--layer.confirm("确定要删除该权限吗?", {icon: 3, title:'系统提示'},function(index){--%>
                    <%--jj.post("${ctx}/jj/purview/delete.json",{ids:[obj.id]});--%>
                <%--});--%>
            <%--};--%>
            <%--jj.deleteAll=function () {--%>

                <%--layer.confirm("确定要删除该权限吗?", {icon: 3, title:'系统提示'},function(index){--%>
                    <%--jj.post("${ctx}/jj/purview/delete.json",{ids:jj.ids()});--%>
                <%--});--%>
            <%--};--%>
        });


	</script>
	<script type="text/html" id="barDemo">
		<div class="layui-btn-group" data-rowid="{{d.id}}">

		<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
        <shiro:hasPermission name="purview:edit">
        <a class="layui-btn layui-btn-xs" lay-event="edit" title="编辑">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
        </shiro:hasPermission>
		</div>
	</script>
	<script type="text/html" id="xtoolbar">
		<shiro:hasPermission name="purview:edit">
			<jj:btn event="add" name="新增" />
			<jj:btn event="deleteAll" name="删除" />
		</shiro:hasPermission>
	</script>

    <%--<a onclick="openlogView('查看权限码', '${ctx}/dt/purview/detail.shtml?id=${obj.id}&sparentid=${obj.sparentid}','600px', '450px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>--%>
    <%--<shiro:hasPermission name="purviewlist:edit">--%>
    <%--<a onclick="openlog('修改权限码', '${ctx}/dt/purview/detail.shtml?id=${obj.id}&sparentid=${obj.sparentid}','600px', '450px', 'officeContent')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>--%>
    <%--<a href="${ctx}/dt/purview/deleteJson.shtml?id=${obj.id}&sparentid=${obj.sparentid}" onclick="return confirmx('确认要删除该权限码吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>--%>
    <%--</shiro:hasPermission>--%>
	
</body>
</html>