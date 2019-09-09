<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
<title>短信节点管理列表</title>
<meta name="decorator" content="default"/>
<script src="${ctx}/static/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/static/bigautocomplete/jquery.bigautocomplete.css" type="text/css" />
<script type="text/javascript">
$(function(){focusmenu('短信节点管理');});
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>短信节点管理列表</h5>
	</div>
	 <div class="ibox-content">
    <sys:message content="${message}"/>
		<!-- 查询条件 -->
	<div class="row">
   <div class="col-sm-12">
	<form:form id="searchForm" action="" method="post" class="form-inline">
		  <input type="hidden" id="pageNo" name="start" value="0" />
		<div class="form-group">
			<span>编号：</span>
				<input type="text" name="search_like_ssendno" maxlength="50" value="${search_like_ssendno}" class="form-control input-sm"/>
			<span>名称：</span>
				<input type="text" name="search_eq_sname" maxlength="50" value="${search_eq_sname}" class="form-control input-sm"/>
		 </div>	
	</form:form>
	<br/>
	</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		 <div class="pull-left">
			<shiro:hasPermission name="infoconfig:add">
			<a onclick="openlog('短信节点记录','${ctx}/dt/infoconfig/detail.shtml','400px','450px')" class="btn btn-white btn-sm"><i class="fa fa-plus"></i>添加</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="infoconfig:delete">
			<table:delRow message="确定删除短信节点吗？" url="${ctx}/dt/infoconfig/deleteJson.shtml"></table:delRow><!-- 删除按钮 -->
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
				<th class="sort-column">编号</th>
				<th class="sort-column">节点名称</th>
				<th class="sort-column">是否系统节点</th>
				<th class="sort-column">节点明细</th>
				<th >操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td><input type="checkbox" id="${obj.id}" class="i-checks" value="${obj.id}"/></td>
					<td>${obj.ssendno}</td>
					<td>${obj.sname}</td>
					<td><consts:BoolType val="${obj.bissysbranch}" /></td>
					<td>
						<a href="javascript:openHrefView('${ctx}/dt/infoconfigdetail/list.shtml?search_eq_sconfigid=${obj.id}')">添加节点明细</a>
					</td>
					<td>
						<a onclick="openlog('编辑短信节点记录','${ctx}/dt/infoconfig/detail.shtml?id=${obj.id}','600px','400px')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
						<a href="javascript:deleteSome('确定删除短信节点吗？','${ctx}/dt/infoconfig/deleteJson.shtml','${obj.id}')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>
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