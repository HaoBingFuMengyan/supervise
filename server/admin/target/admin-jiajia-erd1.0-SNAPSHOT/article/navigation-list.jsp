<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title>品种管理</title>

	<script type="text/javascript">
        function beforeRefresh() {
            parent.refreshNode();
        }
	</script>
</head>
<body>

<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>栏目管理列表 </h5>
		</div>
		<div class="ibox-content">
			<sys:message content="${message}"/>
			<!-- 查询条件 -->
			<div class="row">
				<div class="col-sm-12">
					<form:form id="searchForm"  method="post" class="form-inline">
						<input type="hidden" id="pageNo" name="start" value="0" />
						<div class="form-group">
							<span>品种名：</span>
							<input name="search_like_sname"  maxlength="50" value="${search_like_sname}" class=" form-control input-sm"/>
							<span>简拼名：</span>
							<input name="search_like_sjpname"  maxlength="50" value="${search_like_sjpname}" class=" form-control input-sm"/>
						</div>
					</form:form>
					<br/>
				</div>
			</div>

			<!-- 工具栏 -->
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left">
						<shiro:hasPermission name="navigation:add">
							<a onclick="openHref('${ctx}/dt/navigation/detail.shtml?sparentid=${search_eq_sparentid}')" class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="navigation:delete">
							<table:delRow message="确定删除所选纪录吗？" url="${ctx}/dt/navigation/deleteJson.shtml" callback="beforeRefresh"></table:delRow><!-- 删除按钮 -->
						</shiro:hasPermission>
						<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
					</div>
					<div class="pull-right">
						<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
						<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
					</div>
				</div>
			</div>

			<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				<thead>
				<tr>
					<th><input type="checkbox" class="i-checks"></th>
					<th class="sort-column">栏目名称</th>
					<%--<th class="sort-column">俗名</th>--%>
					<th class="sort-column">编号</th>
					<%--<th class="sort-column">替代品</th>--%>
					<th class="sort-column">排序号</th>
					<th class="sort-column">是否单页</th>
					<th class="sort-column">备注</th>
					<th class="sort-column">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list.content}" var="obj">
					<tr>
						<td> <input type="checkbox" id="${obj.id}" value="${obj.id}" class="i-checks"></td>
						<td>${obj.sname}</td>
						<td>${obj.scode}</td>
						<td>${obj.isort}</td>
						<td><consts:BoolType val="${obj.bisdefault}" /></td>
						<td>${obj.sremark}</td>
						<td>
							<shiro:hasPermission name="navigation:edit">
								<a onclick="openHref('${ctx}/dt/navigation/detail.shtml?id=${obj.id}');" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
							</shiro:hasPermission>
							<a href="javascript:openHrefView('${ctx}/dt/navigation/detail.shtml?id=${obj.id}')" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<br/>
			<div class="mpage">
				<mw:page pageobj="list" />
			</div>
		</div>
	</div>
</div>
</body>
</html>