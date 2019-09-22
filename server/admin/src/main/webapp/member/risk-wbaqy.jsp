<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>风险评估报告</title>
    <script type="text/javascript">
        //添加
        function addRisk(id,irisktype){
            top.layer.open({
                type: 2,
                title:"添加",
                area: ['50%', '60%'],
                content: '${ctx}/hy/authapplyriskdetail/add.shtml?id='+id+'&irisktype='+irisktype,
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
                            <a onclick="addRisk('${id}','${irisktype}')" class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
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
                    <th class="sort-column">机构名称</th>
                    <th class="sort-column">成立日期</th>
                    <th class="sort-column">合伙人数量</th>
                    <th class="sort-column">自然合伙人数量</th>
                    <th class="sort-column">对外投资情况</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.content}" var="obj">
                    <tr>
                        <td>${obj.scnname}</td>
                        <td>${obj.dsetdate}</td>
                        <td>${obj.fnum}</td>
                        <td>${obj.fnaturalnum}</td>
                        <td>${obj.sinvest}</td>
                        <td></td>
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