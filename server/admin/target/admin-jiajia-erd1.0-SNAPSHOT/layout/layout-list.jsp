<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title>布局管理</title>

	<script type="text/javascript">
	</script>
</head>
<body>
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>布局管理列表 </h5>
		</div>
		<div class="ibox-content">
			<sys:message content="${message}"/>
			<!-- 查询条件 -->
			<div class="row">
				<div class="col-sm-12">
					<form:form id="searchForm" action="${ctx}/dt/layout/list.shtml" method="post" class="form-inline">
						<input type="hidden" id="pageNo" name="start" value="0" />
						 <div class="form-group">
							<span>标题：</span>
							<input name="search_like_stitle"  maxlength="50" value="${search_like_stitle}" class=" form-control input-sm"/>

						</div> 
					</form:form>
					<br/>
				</div>
			</div>

			<!-- 工具栏 -->
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left">
						<shiro:hasPermission name="layout:add">
							<%-- <c:if test="${bisroot}"> --%>
								<a onclick="openHref('${ctx}/dt/layout/detail.shtml?param_snavigationid=${search_eq_snavigationid}')" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
							<%-- </c:if> --%>
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
					<th class="sort-column">编号</th>
					<th class="sort-column">名称</th>
					<th class="sort-column">描述</th>
					<th class="sort-column">终端类型</th>
					<th class="sort-column">布局类型</th>
					<th class="sort-column">关联类型</th>
					<th class="sort-column">是否启用</th>
					<th class="sort-column">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list.content}" var="obj">
					<tr>
						<td>${obj.scode}</td>
						<td>${obj.sname}</td>
						<td>${obj.sdes}</td>
						<td><layout:LayoutTerminalType op="label" val="${obj.iterminal}" />  </td>
						<td><layout:LayoutPosition name="iposition" op="label" val="${obj.iposition}" ></layout:LayoutPosition>  </td>
						<td><layout:LayoutReleaseType name="ireleasetype" op="label" val="${obj.ireleasetype}" ></layout:LayoutReleaseType> </td>
						<td><consts:BoolType name="bisenabled" op="label" val="${obj.bisenabled }"></consts:BoolType> </td>
						<td>
							<shiro:hasPermission name="layout:add">
								<c:if test="${bisroot}">
									<a onclick="openHref('${ctx}/dt/layout/detail.shtml')" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
								</c:if>
							</shiro:hasPermission>
							<shiro:hasPermission name="layout:edit">
								<a href="javascript:openHref('${ctx}/dt/layout/detail.shtml?id=${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="layout:edit">
								<a href="javascript:openHref('${ctx}/dt/layoutdetail/list.shtml?id=${obj.id}&&')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>布局内容</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="layout:delete">
								<a  id="${obj.id}"  href="javascript:deleteSome('确定删除该内容及其子内容吗？','${ctx}/dt/layout/deleteJson.shtml','${obj.id}')"  class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
							</shiro:hasPermission>
							<%-- <a href="javascript:openHrefView('${ctx}/sp/layout/detail.shtml?id=${obj.id}')" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a> --%></td>
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