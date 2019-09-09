<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title>新闻管理</title>

	<script type="text/javascript">
		function addcontent(){
		    var navid='${search_eq_snavigationid}';
			if(navid==null||navid==""){
				alert("请先选择栏目");
			}else{
				openHref("${ctx}/dt/article/detail.shtml?snavigationid="+navid);
			}
		}
	</script>
</head>
<body>
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>新闻管理列表 </h5>
		</div>
		<div class="ibox-content">
			<sys:message content="${message}"/>
			<!-- 查询条件 -->
			<div class="row">
				<div class="col-sm-12">
					<form:form id="searchForm" action="${ctx}/dt/article/list.shtml" method="post" class="form-inline">
						<input type="hidden" id="pageNo" name="start" value="0" />
						 <div class="form-group">
							<span>标题：</span>
							<input name="search_like_stitle"  maxlength="50" value="${search_like_stitle}" class=" form-control input-sm"/>
							<%-- <span>简拼名：</span>
							<input name="search_like_sjpname"  maxlength="50" value="${search_like_sjpname}" class=" form-control input-sm"/> --%>
						</div> 
					</form:form>
					<br/>
				</div>
			</div>

			<!-- 工具栏 -->
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-left">
						<shiro:hasAnyPermission name="article:add,helpcenter:add">
							<%-- <c:if test="${bisroot}"> --%>
								<a onclick="javascript:addcontent();" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
							<%-- </c:if> --%>
						</shiro:hasAnyPermission>
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
					<th class="sort-column" width="30%">标题</th>
					<th class="sort-column">缩略图</th>
					<th class="sort-column">发布时间</th>
					<th class="sort-column">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list.content}" var="obj">
					<tr>
						<td>${obj.stitle}</td>
						<td class="sort-column"><img alt="" height="26px" src="<cs:SysParaType imgurl="1" op="syspara"/>/${obj.stitleimage}"></td>
						<td><mw:format label="datetime" value="${obj.dpublishdate}"></mw:format> </td>
						<td>
							<shiro:hasAnyPermission name="article:add,helpcenter:add">
								<c:if test="${bisroot}">
									<a onclick="openHref('${ctx}/dt/article/detail.shtml?snavigationid=${search_eq_snavigationid}')" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
								</c:if>
							</shiro:hasAnyPermission>
							<c:if test="${obj.icheckstate eq 0 }">
								<shiro:hasAnyPermission name="article:edit,helpcenter:edit">
										<a href="javascript:openHref('${ctx}/dt/article/detail.shtml?id=${obj.id}&snavigationid=${obj.snavigationid}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
								</shiro:hasAnyPermission>
								<shiro:hasAnyPermission name="article:publish,helpcenter:publish">
										<a href="${ctx}/dt/article/publish.shtml?id=${obj.id}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>发布</a>
								</shiro:hasAnyPermission>
							</c:if>
							<c:if test="${obj.icheckstate eq 1 }">
								<shiro:hasAnyPermission name="article:publish,helpcenter:publish">
										<a href="${ctx}/dt/article/cancelpublish.shtml?id=${obj.id}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>取消发布</a>
								</shiro:hasAnyPermission>
							</c:if>
							<shiro:hasAnyPermission name="article:delete,helpcenter:delete">
								<a  id="${obj.id}"  href="javascript:deleteSome('确定删除该新闻吗？','${ctx}/dt/article/delete.shtml','${obj.id}')"  class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
							</shiro:hasAnyPermission>
							<a href="javascript:openHrefView('${ctx}/dt/article/detail.shtml?id=${obj.id}')" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>预览</a> </td>
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