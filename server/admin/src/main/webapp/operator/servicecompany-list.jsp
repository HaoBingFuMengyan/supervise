<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>员工管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(function(){focusmenu('员工管理');});
	</script>
</head>
<body>
<body class="">
<div class=" wrapper-content">
    <sys:message content="${message}"/>
		<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form id="searchForm" action="" method="post" class="form-inline">
		<div class="form-group">
			<span>企业名：</span>
			<input name="search_like_susername" value="${search_like_member.scnname}"  style="width: 180px" class="form-control"/>
		 </div>	
	</form>
	<br/>
	</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
				<shiro:hasPermission name="servicecompany:edit">
					<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="openlog('添加员工信息', '${ctx}/dt/servicecompany/detail.shtml?sserviceid=${search_eq_sserviceid}','700px', '450px', 'officeContent')" title="添加"><i class="fa fa-plus"></i>添加</button>
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
				<th class="sort-column">客服人员</th>
				<th class="sort-column">企业名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.content}" var="obj">
			<tr>
				<td>${obj.operator.susername}</td>
				<td>${obj.member.scnname}</td>
				<td>
					<a onclick="openHrefView('${ctx}/dt/servicecompany/detail.shtml?id=${obj.id}')"  class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
					<shiro:hasPermission name="servicecompany:edit">
					<a onclick="openHref('${ctx}/dt/servicecompany/detail.shtml?id=${obj.id}',false,window.parent);" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="servicecompany:edit">
						<a href="javascript:deleteSome('确定要删除该客户吗？','${ctx}/dt/servicecompany/deleteJson.shtml','${obj.id}')" class="btn  btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
					</shiro:hasPermission>
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
</body>
</html>