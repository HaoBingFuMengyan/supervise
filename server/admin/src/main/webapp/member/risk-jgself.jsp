<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>风险评估报告</title>
    <script type="text/javascript">
        //添加
        function addRisk(id,irisktype,type){
            top.layer.open({
                type: 2,
                title:"添加",
                area: ['45%', '40%'],
                content: '${ctx}/hy/authapplyriskdetail/add.shtml?id='+id+'&irisktype='+irisktype+'&type='+type,
                btn: ['确定','关闭'],
                yes:function(index,layero){
                    var iframeWin = layero.find('iframe')[0];
                    var $ = iframeWin.contentWindow.$;
                    var doc = $(iframeWin.contentWindow.document);

                    if (iframeWin.contentWindow.valiForm()) {
                        $.post("${ctx}/hy/authapplyriskdetail/add.json", doc.find('#formx').serialize(), function (rs) {
                            if (rs.success) {

                                top.layer.close(index);

                                top.layer.msg("操作成功!", {icon: 1},function () {
                                    location.reload();
                                });
                            }
                            else {
                                top.layer.msg(rs.msg, {icon: 5});
                            }
                        });
                    }
                }
                ,cancel: function(index){ //或者使用btn2
                }
            });
        }

        function del(id){
            $.post("${ctx}/hy/authapplyriskdetail/delete.json",{id: id}, function (rs) {
                if (rs.success) {

                    top.layer.msg("操作成功!", {icon: 1},function () {
                        location.reload();
                    });
                }
                else {
                    top.layer.msg(rs.msg, {icon: 5});
                }
            });
        }

        function exceptionAdd(title,detailid,iexceptiontype){
            top.layer.open({
                type: 2,
                title: title,
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapplyriskexce/list.shtml?id='+detailid+'&iexceptiontype='+iexceptiontype,
                btn: ['关闭'],
                cancel: function (index) {
                }
            });
        }
    </script>

</head>
<body>
<div class="wrapper wrapper-content">
    <div class="ibox">
        <%--<div class="ibox-title">--%>
            <%--<h5>风险评估报告</h5>--%>
        <%--</div>--%>
        <div class="ibox-content">
            <shiro:hasAnyPermission name="exception:see">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/authapplyriskdetail/risk.shtml" method="post" class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0" />
                        <input type="hidden" id="irisktype" name="irisktype" value="${irisktype}" />
                        <input type="hidden" id="id" name="id" value="${id}" />
                        <div class="form-group">
                            <span>机构名称：</span>
                            <input type="text" name="search_like_scnname" value="${search_like_scnname}" class='form-control input-sm'/>
                        </div>
                    </form:form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <shiro:hasAnyPermission name="exception:add">
                            <a onclick="addRisk('${id}','${irisktype}','${type}')" class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
                        </shiro:hasAnyPermission>
                            <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
                    </div>
                    <div class="pull-right">
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
                        <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
                    </div>
                </div>
            </div>
            </shiro:hasAnyPermission>
            <table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th class="sort-column">机构名称</th>
                    <th class="sort-column">管理人资格</th>
                    <th class="sort-column">司法异常</th>
                    <th class="sort-column">行政处罚</th>
                    <th class="sort-column">经营异常</th>
                    <th class="sort-column">涉诉情况</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.content}" var="obj">
                    <tr>
                        <td>${obj.scnname}</td>
                        <td>${obj.smanager}</td>
                        <td>${obj.ssfexce == null ? 0 : obj.ssfexce +1}条</td>
                        <td>${obj.sxzcfexce == null ? 0 : obj.sxzcfexce +1}条</td>
                        <td>${obj.sjjinvice == null ? 0 : obj.sjjinvice +1}条</td>
                        <td>${obj.sshensuexce == null ? 0 : obj.sshensuexce +1}条</td>
                        <td>
                            <a onclick="exceptionAdd('司法异常','${obj.id}',0)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>司法异常</a>
                            <a onclick="exceptionAdd('行政处罚','${obj.id}',1)" class="btn btn-danger btn-xs"><i class="fa fa-edit"></i>行政处罚</a>
                            <a onclick="exceptionAdd('经营情况','${obj.id}',2)" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>经营情况</a>
                            <a onclick="exceptionAdd('涉诉情况','${obj.id}',3)" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i>涉诉情况</a>
                            <shiro:hasAnyPermission name="exception:del">
                                <a onclick="del('${obj.id}')" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i>删除</a>
                            </shiro:hasAnyPermission>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <shiro:hasAnyPermission name="exception:see">
            <br/>
            <div class="mpage">
                <mw:page pageobj="list" />
            </div>
            </shiro:hasAnyPermission>
        </div>
    </div>
</div>
</body>
</html>