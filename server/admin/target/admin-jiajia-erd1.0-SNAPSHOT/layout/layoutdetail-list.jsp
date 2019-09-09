<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title>布局内容管理</title>

	<script type="text/javascript">
	</script>
</head>
<body>
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>布局内容管理列表 </h5>
		</div>
		<div class="ibox-content">
			<sys:message content="${message}"/>
			<!-- 查询条件 -->
			<div class="row">
				<div class="col-sm-12">
					<form:form id="searchForm" action="${ctx}/dt/layoutdetail/list.shtml" method="post" class="form-inline">
						<input type="hidden" id="pageNo" name="start" value="0" />
						<input type="hidden" id="layoutid" name="id" value="${ly.id}" />
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
						<shiro:hasPermission name="layoutdetail:add">
								<a onclick="openHref('${ctx}/dt/layoutdetail/detail.shtml?slayoutid=${ly.id}',false,window)" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
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
					<th class="sort-column" width="30">序号</th>
					<th class="sort-column">名称</th>
					<c:if test="${ly.ireleasetype gt 0 }">
						<th class="sort-column">关联编号</th>
						<th class="sort-column">关联名称</th>
					</c:if>
					<th class="sort-column" width="100">图片</th>
					<th class="sort-column">链接</th>
					<th class="sort-column">描述</th>
					<th class="sort-column" width="120">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list.content}" var="obj">
					<tr>
						<td>${obj.sno}</td>
						<td>${obj.sdetailname}</td>
						<c:if test="${ly.ireleasetype gt 0 }">
							<td class="sort-column">${obj.srelasecode}</td>
							<td class="sort-column">${obj.srelasename}</td>
						</c:if>
						<td class="sort-column">
							<c:if test="${not empty obj.sdetailimg}"> <img alt="" height="26px" src="<cs:SysParaType imgurl="1" op="syspara"/>/${obj.sdetailimg}"></c:if>
						</td>
						<td>${obj.surl}</td>
						<td>${obj.sremark}</td>
						<td>
							<%-- <shiro:hasPermission name="layoutdetail:add">
								<c:if test="${bisroot}">
									<a onclick="openHref('${ctx}/dt/layoutdetail/detail.shtml?slayoutid=${ly.id}')" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
								</c:if>
							</shiro:hasPermission> --%>
							<shiro:hasPermission name="layoutdetail:edit">
								<a href="javascript:openHref('${ctx}/dt/layoutdetail/detail.shtml?slayoutid=${ly.id}&id=${obj.id}',false,window)" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="layoutdetail:delete">
								<a  id="${obj.id}"  href="javascript:deleteSome('确定删除该条内容吗？','${ctx}/dt/layoutdetail/deleteJson.shtml','${obj.id}')"  class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
							</shiro:hasPermission>
							<%-- <a href="javascript:openHrefView('${ctx}/sp/layout/detail.shtml?id=${obj.id}')" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a> --%>
								<shiro:hasPermission name="layoutdetail:edit">
									<a href="javascript:openlogView('配置明细','${ctx}/jj/layoutdetailitem/list.shtml?slayoutdetailid=${obj.id}','800px','500px')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>明细</a>
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
	</div>
</div>
</body>
</html>