<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>基金账号</title>
    <link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <script src="${ctxStatic}/common/jeeplus.js"></script>
    <link href="${ctxStatic}/common/jeeplus.css" type="text/css" rel="stylesheet" />
    <style>
        .table thead th,.table td{
            text-align: left;
        }
    </style>
    <script type="text/javascript">
        //查看基本信息
        function querydetail(id) {
            layer.open({
                type: 2,
                title:"基本信息",
                area: ['90%', '90%'],
                content: '',
                btn: ['关闭'],
                cancel: function(index){ //或者使用btn2
//                    layer.close(index);
                }
            });
        }
    </script>
</head>
<body>
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <%--<h5>申请列表</h5>--%>
        </div>
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/authapply/list.shtml" method="post" class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0" />
                        <div class="form-group">
                            <span>状态：</span>
                            <member:CheckStatus op="select" val="${search_eq_istatus}" name="search_eq_istatus" defval="" defname="全部" option="class='form-control input-sm'"/>
                            <span>审核结果：</span>
                            <member:ApprovalStatus op="select" val="${search_eq_iapprovalstatus}" name="search_eq_iapprovalstatus" defval="" defname="全部" option="class='form-control input-sm'"/>
                        </div>
                    </form:form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
                    </div>
                    <div class="pull-right" style="margin: 0 10px 10px 0">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th class="sort-column">会员编号</th>
                    <th class="sort-column">注册地址</th>
                    <th class="sort-column">状态</th>
                    <th class="sort-column">申请时间</th>
                    <th class="sort-column">审核结果</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.content}" var="obj">
                    <tr>
                        <td>${obj.smemberno}</td>
                        <td>
                            <c:if test="${obj.istatus eq 1 && obj.iapprovalstatus eq 1}">
                                ${obj.sregaddress}
                            </c:if>
                        </td>
                        <td>
                            <member:CheckStatus op="label" val="${obj.istatus}"/>
                        </td>
                        <td>
                                <mw:format label="datetime" value="${obj.dapplydate}"/>
                        </td>
                        <td>
                            <member:ApprovalStatus op="label" val="${obj.iapprovalstatus}"/>
                        </td>
                        <td>

                            <a onclick="querydetail('${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>基本信息</a>
                            <%--<shiro:hasPermission name="user:edit">--%>
                            <%--<a href="javascript:openlog('密码重置','${ctx}/dt/user/reset.shtml?id=${obj.id}','90%','70%')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>密码重置</a>--%>
                            <%--</shiro:hasPermission>--%>
                            <%--<shiro:hasPermission name="user:edit">--%>
                            <%--<a href="javascript:openlog('账号禁用','${ctx}/dt/user/add.shtml?id=${obj.id}&type=2','90%','70%')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>禁用</a>--%>
                            <%--</shiro:hasPermission>--%>
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