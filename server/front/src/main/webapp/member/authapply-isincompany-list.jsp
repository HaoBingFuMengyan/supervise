<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp" %>
<html>
<head>
    <title>基金账号</title>
    <link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/jeeplus.js"></script>
    <link href="${ctxStatic}/common/jeeplus.css" type="text/css" rel="stylesheet"/>
    <style>
        .table thead th, .table td {
            text-align: left;
        }
    </style>
    <script type="text/javascript">
        //查看基本信息
        function querydetail(id) {
            layer.open({
                type: 2,
                title: "信息",
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapply/index.shtml?id=' + id,
                btn: ['关闭'],
                cancel: function (index) { //或者使用btn2
//                    layer.close(index);
                }
            });
        }

        //企业信息变更
        function changeInfo(id) {
            top.layer.open({
                type: 2,
                title: '信息变更申请',
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapply/changeinfo_' + id + '.shtml',
                btn: ['确认', '关闭'],
                yes: function (index, layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $ = iframeWin.contentWindow.$;
                    var doc = $(iframeWin.contentWindow.document);
//                    doc.find("form").first().submit();
                    if(iframeWin.contentWindow.valiForm()){
                        if (iframeWin.contentWindow.check()) {
                            $.post("${ctx}/hy/authapply/changeinfo.json",doc.find('#formx').serialize(),function(rs){
    //                            layer.closeAll('loading');
                                if (rs.success) {

                                    layer.close(index);

                                    top.layer.msg("操作成功!",{icon:1},function () {
                                        parent.location.reload();
                                    });
                                }
                                else {
                                    top.layer.msg(rs.msg,{icon:5});
                                }
                            });
                        }
                    }

                },
                cancel: function (index) {
                }
            });
        }

        //监管问询
        function dailQuery(id){
            layer.open({
                type: 2,
                title: "监管问询",
                area: ['65%', '75%'],
                content: '${ctx}/cx/message/dail-index.shtml?id=' + id,
                btn: ['关闭'],
                cancel: function (index) { //或者使用btn2
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
                    <form:form id="searchForm" action="${ctx}/hy/authapply/list.shtml" method="post"
                               class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0"/>
                        <div class="form-group">
                            <span>企业名称：</span>
                            <input type="text" name="search_like_scnname" value="${search_like_scnname}" class='form-control input-sm'/>
                            <span>业务类型：</span>
                            <member:BizType op="select" val="${search_eq_icorbiztype}" name="search_eq_icorbiztype" defval="" defname="全部" option="class='form-control input-sm'"/>
                            <span>入驻类型：</span>
                            <member:AuthapplySource op="select" val="${search_eq_iauthapplysource}" name="search_eq_iauthapplysource" defval="" defname="全部" option="class='form-control input-sm'"/>
                        </div>
                    </form:form>
                    <br/>
                </div>
            </div>

            <!-- 工具栏 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="pull-left">
                        <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left"
                                onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新
                        </button>
                    </div>
                    <div class="pull-right" style="margin: 0 10px 10px 0">
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()"><i
                                class="fa fa-search"></i> 查询
                        </button>
                        <button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()"><i
                                class="fa fa-refresh"></i> 重置
                        </button>
                    </div>
                </div>
            </div>

            <table id="contentTable"
                   class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
                <thead>
                <tr>
                    <th class="sort-column">企业名称</th>
                    <th class="sort-column">业务类型</th>
                    <th class="sort-column">入驻日期</th>
                    <th class="sort-column">认缴规模</th>
                    <th class="sort-column">入驻方式</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.content}" var="obj">
                    <tr>
                        <td>${obj.scnname}</td>
                        <td>
                            <member:BizType op="label" val="${obj.icorbiztype}"/>
                        </td>
                        <td>
                            <mw:format label="date" value="${obj.dapplydate}"/>
                        </td>
                        <td>${obj.iregmoney}</td>
                        <td>
                            <member:AuthapplySource op="label" val="${obj.iauthapplysource}"/>
                        </td>
                        <td>
                            <a onclick="querydetail('${obj.id}')" class="btn btn-success btn-xs"><i
                                    class="fa fa-edit"></i>企业信息</a>

                            <c:if test="${obj.istatus eq 1 && obj.iprocess eq 30}">
                                <a onclick="changeInfo('${obj.id}')" class="btn btn-danger btn-xs"><i
                                        class="fa fa-edit"></i>信息变更</a>
                            </c:if>

                            <a onclick="dailQuery('${obj.id}')" class="btn btn-default btn-xs"><i
                                    class="fa fa-edit"></i>监管问询</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br/>
            <div class="mpage">
                <mw:page pageobj="list"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>