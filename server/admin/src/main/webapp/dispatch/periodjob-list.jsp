<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>周期任务管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctx}/common/js/validate/bootstrapValidator.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){focusmenu('周期任务');});
	
	</script>
</head>
	
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
			<h5>周期任务管理</h5>
	</div>
    <div class="ibox-content">
    <sys:message content="${message}"/>
	<div class="row">
		<div class="col-sm-12">
			<form:form id="searchForm" class="form-inline" action="" method="post">
				<input id="pageNo" name="start" value="0" type="hidden">
				<div class="form-group">
				 </div>	
			</form:form>
		</div>
	</div>
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="periodjob:add">
				<table:addRow url="${ctx}/dt/periodjob/detail.shtml" title="周期任务"></table:addRow>
	       	</shiro:hasPermission>
			<shiro:hasPermission name="periodjob:delete">
				<table:delRow message="确定删除定时任务吗？" url="${ctx}/dt/periodjob/delete.shtml"></table:delRow><!-- 删除按钮 -->
	       	</shiro:hasPermission>
       		<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		</div>
	</div>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th><input type="checkbox" class="i-checks" /></th>
				<th class="sort-column">定时任务编号</th>
				<th class="sort-column">定时任务名称</th>
				<th class="sort-column">任务类型</th>
				<th class="sort-column">周期类型</th>
				<th class="sort-column">周期</th>
				<th class="sort-column">计划运行时间</th>
				<th class="sort-column">是否禁用</th>
				<th class="sort-column">是否删除</th>
				<th class="sort-column">是否终止</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td><input type="checkbox" class="i-checks" value="${obj.id}"/></td>
					<td>${obj.sjobno}</td>
					<td>${obj.sname}</td>
					<td><ds:PeriodTaskType val="${obj.itasktype}"/></td>
					<td><ds:PeriodType val="${obj.iperiodtype}"/></td>
					<td>${obj.iperiod}</td>
					<td><fmt:formatDate value="${obj.dplanexectime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><consts:BoolType val="${obj.bisforbidden}" /></td>
					<td><consts:BoolType val="${obj.bisdelete}" /></td>
					<td><consts:BoolType val="${obj.bisfailstop}" /></td>
					<td>
						<a onclick="openHrefView('${ctx}/dt/periodjob/detail.shtml?id=${obj.id}')" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
						<a onclick="openHref('${ctx}/dt/periodjob/detail.shtml?id=${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
						<a href="javascript:deleteSome('确定删除周期任务吗？','${ctx}/dt/periodjob/delete.shtml','${obj.id}')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>
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