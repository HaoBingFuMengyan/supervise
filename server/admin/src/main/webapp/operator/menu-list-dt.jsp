<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/include/treetable.jsp" %>
	<script type="text/javascript">
        $(document).ready(function() {
            focusmenu('菜单管理');
            $("#treeTable").treeTable({expandLevel : 1,column:1}).show();
        });

        function updateSort() {
            loading('正在提交，请稍等...');
            $("#listForm").attr("action", "${ctx}/sys/menu/updateSort");
            $("#listForm").submit();
        }

        function refresh(){//刷新
            window.location="${ctx}/sys/menu/index.shtml";
        }
	</script>
</head>
<body class="">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>菜单列表 </h5>
		</div>
		<div class="ibox-content">
			<sys:message content="${message}"/>
			<form id="searchForm">
			</form>

			<!-- 工具栏 -->
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left">
						<shiro:hasPermission name="menu:edit">
							<a onclick="openlog('新增菜单','${ctx}/jj/menu/detail.shtml','1000px','500px');" class="btn btn-white btn-sm"><i class="fa fa-plus"></i>添加</a>
							<!-- <table:editRow url="${ctx}/sys/menu/form.shtml" id="treeTable"  title="菜单"></table:editRow>编辑按钮 -->
							<table:delRow url="${ctx}/jj/menu/deleteAll.shtml" message="确定删除当前菜单以及子菜单吗？"></table:delRow><!-- 删除按钮 -->
						</shiro:hasPermission>
						<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>

					</div>
				</div>
			</div>
			<form id="listForm" method="post">
				<table id="treeTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead><tr><th><input type="checkbox"  class="i-checks"></th><th>名称</th><th>链接</th><th style="text-align:center;">排序</th><th>操作</th></tr></thead>
					<tbody><c:forEach items="${list}" var="menu">
						<tr id="${menu.id}" pId="${menu.sparentid ne '0'?menu.sparentid:'0'}">
							<td> <input type="checkbox" id="${menu.id}" value="${menu.id}" class="i-checks"></td>
							<td nowrap><i class="icon-menu.icon"></i><a onclick="openlogView('查看菜单', '${ctx}/jj/menu/detail.shtml?id=${menu.id}','1000px', '500px')">${menu.sname}</a></td>
							<td >${menu.smenupath}</td>
							<td style="text-align:center;">
									${menu.isort}
							</td>
							<td nowrap>

								<a onclick="openlogView('查看菜单','${ctx}/jj/menu/detail.shtml?id=${menu.id}','1000px','500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
								<shiro:hasPermission name="menu:edit">
									<a onclick="openlog('菜单管理','${ctx}/jj/menu/detail.shtml?id=${menu.id}','1000px','500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
									<a href="${ctx}/jj/menu/delete.shtml?id=${menu.id}" onclick="return confirmx('要删除该菜单及所有子菜单项吗？', this.href)" class="btn btn-danger btn-xs" ><i class="fa fa-trash"></i> 删除</a>
									<a onclick="openlog('菜单管理','${ctx}/jj/menu/detail.shtml?sparentid=${menu.id}','1000px','500px')" class="btn btn-primary btn-xs" ><i class="fa fa-plus"></i> 添加下级菜单</a>
								</shiro:hasPermission>
							</td>
						</tr>
					</c:forEach></tbody>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>