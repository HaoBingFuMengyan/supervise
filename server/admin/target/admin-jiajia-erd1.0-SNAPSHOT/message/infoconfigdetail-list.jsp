<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="infoconfigdetail" uri="http://www.frogsing.com/tags/message" %>
<html>
<head>
<title>短信节点明细管理列表</title>
<meta name="decorator" content="default"/>
<script src="${ctx}/static/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx}/static/bigautocomplete/jquery.bigautocomplete.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/common/css/forview.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/common/css/style.css" type="text/css" />
<style>
   .check{
   width:17px;
   height:17px;
   border-radius:0px!important;
   }
   .form-horizontal .control-label {
  float: left;
  width: 150px;
  padding-top: 5px;
  text-align: right;
}
</style>
<script type="text/javascript">
	$().ready(function (){
		focusmenu('短信节点管理');
	});	
</script>
</head>
<body class="fixed-sidebar  gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>短信节点明细管理列表</h5>
	</div>
	<div class="ibox-content">
    <sys:message content="${message}"/>
    <div class="row">
	<div class="col-md-12">
		<div class="widget box">
			<div class="widget-header">
				<h4><i class="fa fa-list-ul"></i>节点信息</h4>
			</div>
			<div class="widget-content">
				<form:form class="form-horizontal row-border" action="#" modelAttribute="InfoConfig">
					<div class="form-group">
						<label class="col-md-1 control-label">编号:</label>
						<div class="col-md-2 control-label1">${InfoConfig.ssendno}</div>
						<label class="col-md-1 control-label">节点名称:</label>
						<div class="col-md-2 control-label1">${InfoConfig.sname}</div>
						<label class="col-md-1 control-label">是否系统节点:</label>
						<div class="col-md-2 control-label1"><consts:BoolType val="${InfoConfig.bissysbranch}" /></div>
					</div>
					<c:if test="${InfoConfig.sremark != null}">
						<div class="form-group">
							<label class="col-md-2 control-label">备注:</label>
							<div class="col-md-10 control-label1">${InfoConfig.sremark}</div>
						</div>
					</c:if>
				</form:form>
			</div>
		</div>
	</div>
</div> 
		<!-- 查询条件 -->
	<div class="row">
	   <div class="col-sm-12">
		<form:form id="searchForm" action="" method="post" class="form-inline">
			<div class="form-group">
			</div>	
		</form:form>
		</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		 <div class="pull-left">
		 	<shiro:hasPermission name="infoconfig:add">
		    	<a href="javascript:openlog('添加节点明细','${ctx}/dt/infoconfigdetail/detail.shtml?param_sconfigid=${search_eq_sconfigid}','700px','400px');" class="btn btn-white btn-sm" id="addConfig"><i class="fa fa-plus"></i>添加</a>
		    </shiro:hasPermission>
			<shiro:hasPermission name="infoconfig:delete">
			<table:delRow message="确定删除短信节点吗？" url="${ctx}/dt/infoconfigdetail/deleteJson.shtml"></table:delRow><!-- 删除按钮 -->
			</shiro:hasPermission>
       		<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		</div> 
	</div>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th><input type="checkbox" class="i-checks"/></th>
				<th class="sort-column">类型</th>
				<th class="sort-column">是否发送</th>
				<th class="sort-column">序号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td>
						<input type="checkbox" class="i-checks" value="${obj.id}" id="${obj.id}"/>
					</td>
					<td><infoconfigdetail:InfoType val="${obj.iinfotype}" /></td>
					<td><consts:BoolType val="${obj.bissend}" /></td>
					<td>${obj.isort}</td>
					<td>
						<a href="javascript:openlog('添加节点明细','${ctx}/dt/infoconfigdetail/detail.shtml?id=${obj.id}&param_sconfigid=${search_eq_sconfigid}','700px','400px');" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
						<a href="javascript:deleteSome('确定要删除节点明细吗？','${ctx}/dt/infoconfigdetail/deleteJson.shtml','${obj.id}')" class="btn btn-danger btn-xs" data-flag="delete"><i class="fa fa-trash"></i>删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
</body>
</html>