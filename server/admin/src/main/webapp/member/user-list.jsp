<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>基金账号</title>
</head>
<body>
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>基金账号列表</h5>
        </div>
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/user/list.shtml" method="post" class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0" />
                        <div class="form-group">
                            <span>真实姓名：</span>
                            <input name="search_like_sname"  maxlength="50" value="${search_like_sname}" class=" form-control input-sm"/>
                            <span>用户名：</span>
                            <input name="search_like_susername"  maxlength="50" value="${search_like_susername}" class=" form-control input-sm"/>
                        </div>
                    </form:form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <shiro:hasPermission name="user:add">
                            <a onclick="openlog('会员账号编辑','${ctx}/dt/user/add.shtml?type=0','90%','70%')" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
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
                    <th class="sort-column">真实姓名</th>
                    <th class="sort-column">用户名</th>
                    <th class="sort-column">手机号</th>
                    <th class="sort-column">QQ</th>
                    <th class="sort-column">邮箱</th>
                    <th class="sort-column">是否有效</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.content}" var="obj">
                    <tr>
                        <td>${obj.sname}</td>
                        <td>${obj.susername}</td>
                        <td>${obj.smobile}</td>
                        <td>${obj.sqq}</td>
                        <td>${obj.semail}</td>
                        <td>
                            <consts:BoolType op="label" val="${obj.bisvalid}"/>
                        </td>
                        <td>
                            <shiro:hasPermission name="user:edit">
                                <a href="javascript:openlog('会员账号编辑','${ctx}/dt/user/add.shtml?id=${obj.id}&type=1','90%','70%')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>编辑</a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="user:edit">
                                <a href="javascript:openlog('密码重置','${ctx}/dt/user/reset.shtml?id=${obj.id}','90%','70%')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>密码重置</a>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="user:edit">
                                <a href="javascript:openlog('账号禁用','${ctx}/dt/user/add.shtml?id=${obj.id}&type=2','90%','70%')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>禁用</a>
                            </shiro:hasPermission>
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