<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>城市列表管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" href="${ctxStatic}/common/jquery.searchableSelect.css" />
	<script src="${ctxStatic}/common/jquery.searchableSelect.js"></script> 
	<script type="text/javascript">
	$(function(){focusmenu('城市');});
	
	$(function(){
		$('select').searchableSelect();
	});
	
	</script>
</head>
	
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>城市列表管理</h5>
	</div>
    <div class="ibox-content">
    <sys:message content="${message}"/>
	<div class="row">
		<div class="col-sm-12">
			<form:form id="searchForm" class="form-inline" action="${ctx}/dt/city/list.shtml" method="post">
				<input id="pageNo" name="start" value="0" type="hidden">
				<div class="form-group">
					<span>国家：</span>
					<select name="search_eq_scountryid" id="scountryId" class="form-control">
		         		<option value=""></option>
		         		<c:forEach items="${countryList}" var="country">
		         			<option value="${country.id}" ${country.id == search_eq_scountryid ? 'selected' : ''}>${country.sname}</option>
		         		</c:forEach> 
		         	</select>
					<span>省份/地区：</span>
					<input name="sprovincename" value="${sprovincename}" class="form-control"/>
					<span>城市：</span>
					<input name="search_like_sname" value="${search_like_sname}" class="form-control"/>
				 </div>	
			</form:form>
		</div>
	</div>
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12" style="margin-top:10px;">
		<div class="pull-left">
			<shiro:hasPermission name="city:add">
				<table:addRow url="${ctx}/dt/city/detail.shtml" title="城市列表"></table:addRow>
	       	</shiro:hasPermission>
			<shiro:hasPermission name="city:delete">
				<table:delRow message="确定删除城市吗？" url="${ctx}/dt/city/deleteJson.shtml"></table:delRow><!-- 删除按钮 -->
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
				<th class="sort-column">所属国家</th>
				<th class="sort-column">所属省份</th>
				<th class="sort-column">城市名称</th>
				<th class="sort-column">显示顺序</th>
				<th class="sort-column">简拼名</th>
				<th class="sort-column">全拼名</th>
				<th class="sort-column">是否省会</th>
				<th class="sort-column">是否常用</th>
				<th class="sort-column">区号</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td><input type="checkbox" class="i-checks" value="${obj.id}" id="${obj.id}"/></td>
					<td>${obj.country.sname}</td>
					<td>${obj.sprovince.sname}</td>
					<td>${obj.sname}</td>
					<td>${obj.isort}</td>
					<td>${obj.sjpname}</td>
					<td>${obj.spyname}</td>
					<td><consts:BoolType val="${obj.bisprovincecity}" /></td>
					<td><consts:BoolType val="${obj.biscommon}" /></td>
					<td>${obj.sareacode}</td>
					<td>
						<a href="#" onclick="openHref('${ctx}/dt/city/detail.shtml?id=${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
						<a href="javascript:deleteSome('确定要删除城市吗？','${ctx}/dt/city/deleteJson.shtml','${obj.id}')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>					
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