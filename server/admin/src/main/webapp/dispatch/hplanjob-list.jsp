<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>历史定时任务管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctx}/common/js/validate/bootstrapValidator.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){focusmenu('历史计划任务');});
	</script>
</head>
	
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
			<h5>历史定时任务管理</h5>
	</div>
    <div class="ibox-content">
    <sys:message content="${message}"/>
	<div class="row">
		<div class="col-sm-12">
			<form:form id="searchForm" class="form-inline" action="" method="post">
				<input id="pageNo" name="start" value="0" type="hidden">
				<div class="form-group">
				<label>任务名称</label><input name="search_like_sname" value="${search_like_sname}"/>
				 </div>	
			</form:form>
		</div>
	</div>
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
       		<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		</div>
	</div>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th class="sort-column">定时任务名称</th>
				<th class="sort-column">任务类型</th>
				<th class="sort-column">计划运行时间</th>
				<th class="sort-column">实际运行时间</th>
				<!-- <th class="sort-column">是否完成</th>
				<th class="sort-column">是否成功</th>
				<th class="sort-column">是否删除</th>
				<th class="sort-column">是否终止</th> -->
				<th class="sort-column">添加时间</th>
				
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list.content}" var="obj">
				<tr>
					<td>${obj.sname}</td>
					<td><ds:TaskType val="${obj.itasktype}"/></td>
					<td><fmt:formatDate value="${obj.dplanexectime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${obj.dexectime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<%-- <td><consts:BoolType val="${obj.bisover}" /></td>
					<td style="color:red;"><consts:BoolType val="${obj.bissuccess}" /></td>
					<td><consts:BoolType val="${obj.bisdelete}" /></td>
					<td><consts:BoolType val="${obj.bisfailstop}" /></td> --%>
					<td><fmt:formatDate value="${obj.dadddate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>
						<a href="#" onclick="openHrefView('${ctx}/dt/hplanjob/detail.shtml?id=${obj.id}')" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
						<a href="${ctx}/jj/planjob/recovery.shtml?id=${obj.id}" onclick="return confirmx('确定要恢复定时任务吗？',this.href);" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>恢复</a>
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