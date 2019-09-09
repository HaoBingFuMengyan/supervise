<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>国家列表管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctx}/common/js/validate/bootstrapValidator.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){focusmenu('国家');});
	</script>
</head>
	
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
			<h5>国家列表管理</h5>
	</div>
    <div class="ibox-content">
    <sys:message content="${message}"/>
	<div class="row">
		<div class="col-sm-12">
			<form:form id="searchForm" class="form-inline" action="" method="post">
				<input id="pageNo" name="start" value="0" type="hidden">
				<div class="form-group">
					<span>国家名：</span>
					<input type="text" name="search_like_sname" id="sname" value="${search_like_sname}" class="form-control" />
				 </div>	
			</form:form>
		</div>
	</div>
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12" style="margin-top:10px;">
		<div class="pull-left">
			<shiro:hasPermission name="country:add">
				<table:addRow url="${ctx}/dt/country/detail.shtml" title="国家表"></table:addRow>
	       	</shiro:hasPermission>
			<shiro:hasPermission name="country:delete">
				<table:delRow message="确定删除国家吗？" url="${ctx}/dt/country/deleteJson.shtml"></table:delRow><!-- 删除按钮 -->
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
				<th><input type="checkbox" class="i-checks" /></th>
				<th class="sort-column">国家名</th>
				<th class="sort-column">显示顺序</th>
				<th class="sort-column">是否常用</th>
				<th class="sort-column">简拼名</th>
				<th class="sort-column">全拼名</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td><input type="checkbox" class="i-checks" value="${obj.id}" id="${obj.id}"/></td>
					<td>${obj.sname}</td>
					<td>${obj.isort}</td>
					<td><consts:BoolType val="${obj.biscommon}" /></td>
					<td>${obj.sjpname}</td>
					<td>${obj.spyname}</td>
					<td>
						<a onclick="openHref('${ctx}/dt/country/detail.shtml?id=${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
						<a href="javascript:deleteSome('确定要删除国家吗？','${ctx}/dt/country/deleteJson.shtml','${obj.id}')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>					
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