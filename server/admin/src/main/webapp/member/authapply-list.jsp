<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>基金基本信息</title>
</head>
<body>
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>基金申请列表</h5>
        </div>
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/authapply/list.shtml" method="post" class="form-inline">
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
                            <a  class="btn btn-success btn-xs"><i class="fa fa-edit"></i>基本信息</a>
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