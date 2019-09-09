<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>单据编号列表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(function(){focusmenu('单据编号');});
	
	function copy(){
		var checkid = new Array();
		var flag=true;
		$("input.i-checks:checked").each(function (i){
			checkid[i]=$(this).val();
		});
		if(checkid.length <= 0){
			 $.jBox.tip("请选择一条数据!",'error');
			 flag=false;
		}else if(checkid.length > 1){
			$.jBox.tip("只能选择一条数据！",'error');
			flag=false;
		}
		if(flag)
			openHref('${ctx}/dt/sequence/detail.shtml?id='+checkid+'&param_copy=copy');
	}
	</script>
</head>
	
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>单据编号列表管理</h5>
	</div>
    <div class="ibox-content">
    <sys:message content="${message}"/>
	<div class="row">
		<div class="col-sm-12">
			<form:form id="searchForm" class="form-inline" action="" method="post">
				<input id="pageNo" name="start" value="0" type="hidden">
				<div class="form-group">
					<span>名称：</span>
					<input type="text" name="search_like_sobjectname" id="sobjectname" value="${search_like_sobjectname}" class="form-control" />
					<span>代码：</span>
					<input type="text" name="search_like_scode" value="${search_like_scode}" class="form-control" />
				 </div>	
			</form:form>
		</div>
	</div>
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12" style="margin-top:10px;">
		<div class="pull-left">
			<shiro:hasPermission name="sequence:add">
				<table:addRow url="${ctx}/dt/sequence/detail.shtml" title="单据编号列表"></table:addRow>
				<a onclick="copy();" class="btn btn-white btn-sm"><i class="fa fa-edit"></i>复制</a>
	       	</shiro:hasPermission>
			<shiro:hasPermission name="sequence:delete">
				<table:delRow message="确定删除单据吗？" url="${ctx}/dt/sequence/delete.shtml"></table:delRow><!-- 删除按钮 -->
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
				<th class="sort-column">名称</th>
				<th class="sort-column">代码</th>
				<th class="sort-column">格式</th>
				<th class="sort-column">起始编号</th>
				<th class="sort-column">增长阶梯</th>
				<th class="sort-column">当前序号</th>
				<th class="sort-column">前缀</th>
				<th class="sort-column">后缀</th>
				<th class="sort-column">当前日期</th>
				<th class="sort-column">是否循环</th>
				<th class="sort-column">是否清零</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td><input type="checkbox" id="${obj.id}" class="i-checks" value="${obj.id}" /></td>
					<td>${obj.sobjectname}</td>
					<td>${obj.scode}</td>
					<td>${obj.sfromat}</td>
					<td>${obj.istartno}</td>
					<td>${obj.iincrement}</td>
					<td>${obj.icurrentno}</td>
					<td>${obj.sprefix}</td>
					<td>${obj.ssuffix}</td>
					<td>${obj.dcurrentdate}</td>
					<td><consts:BoolType val="${obj.biscycle}" /></td>
					<td><consts:BoolType val="${obj.bisreset}" /></td>
					<td>
						<a onclick="openHref('${ctx}/dt/sequence/detail.shtml?id=${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
						<a href="javascript:deleteSome('确定要删除单据吗？','${ctx}/sys/sequence/delete.shtml','${obj.id}')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>					
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