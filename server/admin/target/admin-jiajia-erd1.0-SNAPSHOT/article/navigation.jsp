<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	</script>
</head>

<body>
	<div class="wrapper wrapper-content">
    <sys:message content="${message}"/>
		<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="" action="" method="post" class="form-inline">
	<input type="hidden" name="start" id="pageNo"/>
		<div class="form-group">
			<span>栏目名称：</span>
				<input type="text" id="sname" name="search_eq_sname" value="${search_eq_sname}" class="form-control"/>
			<span>栏目编码：</span>
				<input type="text" id="scode" name="search_eq_scode" value="${search_eq_scode}" class="form-control"/>
		 </div>
	</form:form>
	<br/>
	</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="navigation:edit">
			<table:addRow url="${ctx}/xw/navigation/detail.shtml" title="系统参数表" width="800px" height="525px" ></table:addRow><!-- 增加按钮 -->
			<table:delRow message="确定要删除吗！" url="${ctx}/xw/navigation/delete.shtml" ></table:delRow><!-- 删除按钮 -->
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
				<th><input type="checkbox" class="i-checks"/></th>
				<th class="sort-column">栏目名称</th>
				<th class="sort-column">栏目编码</th>
				<th class="sort-column">排序号</th>
				<th class="sort-column">是否为默认栏目</th>
				<th class="sort-column">附图</th>
				<th class="sort-column">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td><input type="checkbox" class="i-checks" value="${obj.id}"/></td>
					<td>${obj.sname}</td>
					<td>${obj.scode}</td>
					<td>${obj.isort}</td>
					<td><consts:BoolType val='${obj.bisdefault}'/></td>
					<td>${obj.stitleimage}</td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br/>
	<div class="mpage">
			<mw:page pageobj="list" />
	</div>
	</div>
</body>
</html>