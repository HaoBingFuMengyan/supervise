<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>基金基本信息</title>
    <script type="text/javascript">
        //查看基本信息
        function querydetail(id) {
            top.layer.open({
                type: 2,
                title:"信息",
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapply/index.shtml?id='+id,
                btn: ['关闭'],
                cancel: function(index){ //或者使用btn2
//                    layer.close(index);
                }
            });
        }

        //监管问询
        function dailQuery(id){
            top.layer.open({
                type: 2,
                title:"监管问询",
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapply/dail-index.shtml?id='+id,
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
            <h5>企业信息变更列表</h5>
        </div>
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/authapply/changeinfo.shtml" method="post" class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0" />
                        <div class="form-group">
                            <span>公司名称：</span>
                            <input type="text" name="search_like_scnname" value="${search_like_scnname}" class='form-control input-sm'/>
                            <span>预审状态：</span>
                            <member:CheckStatus op="select" val="${search_eq_istatus}" name="search_eq_istatus" defval="" defname="全部" option="class='form-control input-sm'"/>
                            <span>变更状态：</span>
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
                    <div class="pull-right">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                    </div>
                </div>
            </div>

            <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th class="sort-column">公司名称</th>
                    <th class="sort-column">类型</th>
                    <th class="sort-column">注册地址</th>
                    <th class="sort-column">预审状态</th>
                    <th class="sort-column">申请时间</th>
                    <th class="sort-column">变更状态</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.content}" var="obj">
                    <tr>
                        <td>${obj.scnname}</td>
                        <td>
                            <member:CompanyBizType op="label" val="${obj.icorbiztype}"/>
                        </td>
                        <td>
                            ${obj.sregaddress}
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

                            <c:if test="${type eq 1}">
                                <a onclick="dailQuery('${obj.id}')" class="btn btn-danger btn-xs"><i class="fa fa-edit"></i>监管问询</a>
                            </c:if>
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