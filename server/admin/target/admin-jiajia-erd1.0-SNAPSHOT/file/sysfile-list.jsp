<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>cc列表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(function(){focusmenu('系统文件');});
	</script>
</head>

<body class="fixed-sidebar  gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
			<h5>系统文件 </h5>

	</div>
    <div class="ibox-content">
    <sys:message content="${message}"/>
		<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="" action="" method="post" class="form-inline">
		<div class="form-group">
			<span>文件类型：</span>
			<cs:SysFileType name="search_eq_isysfiletype" op="select" val="${search_eq_isysfiletype }" defname="全部" option="class='form-control'" ></cs:SysFileType>
		 </div>
	</form:form>
	<br/>
	</div>
	</div>

	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="sysfile:edit">
			<a href="javaScript:openlog('系统参数','${ctx}/dt/sysfile/detail.shtml','800px','525px')" class="btn btn-white btn-sm" ><i class="fa fa-plus"></i>添加</a>
			<table:delRow url="${ctx}/dt/sysfile/deleteJson.shtml" message="确定删除所选系统参数吗？"></table:delRow><!-- 删除按钮 -->
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
				<th class="sort-column">文件类型</th>
				<th class="sort-column">文件名</th>
				<th class="sort-column">文件地址</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
			<tr>
				<td><input  type="checkbox" name="checks" value="${obj.id}" class="i-checks" id="${obj.id}"/></td>
				<td>${obj.scode }</td>
				<td><cs:SysFileType op="label"  val="${obj.isysfiletype }"></cs:SysFileType> </td>
				<td>${obj.sfilename}</td>
				<td>${obj.surl}</td>
				<td>
					<shiro:hasPermission name="sysfile:edit">
						<a href="javaScript:openlog('系统参数','${ctx}/dt/sysfile/detail.shtml?id=${obj.id}','800px','525px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i>修改</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sysfile:delete">
						<a href="javaScript:deleteSome('确认要删除该系统参数吗？','${ctx}/dt/sysfile/deleteJson.shtml','${obj.id}')"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
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
</body>
</html>