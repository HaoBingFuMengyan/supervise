<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>基金基本信息</title>
    <style>
        .hard-list{
            display: inline-block;
            padding-left: 10px;
        }
        .hard-list li{
            position: relative;
            list-style: none;
        }
        .hard-list li ul{
            display: none;
            position: absolute;
            left: 0;
            background: #fff;
            z-index: 1000;
            padding: 10px;
            border-radius: 3px;
            box-shadow: 0 0 16px 0 hsla(0,0%,77%,.5);
        }
        .hard-list li:hover ul{
            display: block;
        }
        .hard-list li:hover ul li{
            margin-bottom: 5px;
        }
    </style>
    <script type="text/javascript">
        //查看基本信息
        function querydetail(id) {
            top.layer.open({
                type: 2,
                title:"详情",
                area: ['75%', '75%'],
                content: '${ctx}/hy/authapplywarn/detail.shtml?id='+id,
                btn: ['关闭'],
                cancel: function(index){ //或者使用btn2
//                    layer.close(index);
                }
            });
        }

        function fengxianpg(id) {
            top.layer.open({
                type: 2,
                title:"风险检测报告",
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapplywarn/index.shtml?id='+id,
                btn: ['关闭'],
                cancel: function(index){ //或者使用btn2
//                    layer.close(index);
                }
            });
        }

        function check(id) {
            top.layer.open({
                type: 2,
                title:"详情",
                area: ['75%', '75%'],
                content: '${ctx}/hy/authapplywarn/detail.shtml?id='+id,
                btn: ['通过', '拒绝', '关闭'],
                btn1: function (indexp, layero) {
                    top.layer.confirm('确定要审核通过吗？', {
                        btn: ['确定', '取消'] //按钮
                    }, function () {
                        $.post("${ctx}/hy/authapplywarn/check.json",{id: id,istatus:1},function(rs){
//                            layer.closeAll('loading');
                            if (rs.success) {

                                layer.close(indexp);

                                top.layer.msg(isnull(rs.msg) ? "操作成功!" : rs.msg,{icon:1},function () {
                                    parent.location.reload();
                                });
                            }
                            else {
                                top.layer.msg(rs.msg,{icon:5});
                            }
                        });
                    }, function () {
                        layer.close(indexp);
                    });
                },
                btn2: function (indexp, layero) {
                    top.layer.confirm('确定要拒绝审核吗？', {
                        btn: ['确定', '取消'] //按钮
                    }, function () {
                        $.post("${ctx}/hy/authapplywarn/check.json",{id: id,istatus:2},function(rs){
//                            layer.closeAll('loading');
                            if (rs.success) {
                                layer.close(indexp);

                                top.layer.msg(isnull(rs.msg) ? "操作成功!" : rs.msg,{icon:1},function () {
                                    parent.location.reload();
                                })
                            }
                            else {
                                top.layer.msg(rs.msg,{icon:5});
                            }
                        });
                    }, function () {
                        top.layer.close(indexp);
                    });
                    return false;//避免关闭顶层窗口
                },
                btn3: function (index) {
                }
            });
        }

        function riskcheckAdd(){
            top.layer.open({
                type: 2,
                title:"迁入基金风险排查",
                area: ['75%', '75%'],
                content: '${ctx}/hy/authapplywarn/riskcheck-add.shtml',
                btn: ['确定','关闭'],
                yes:function(index,layero){
                    var iframeWin = layero.find('iframe')[0];
                    var $ = iframeWin.contentWindow.$;
                    var doc = $(iframeWin.contentWindow.document);

                    if (iframeWin.contentWindow.valiForm()) {
                        $.post("${ctx}/hy/authapplywarn/save.json", doc.find('#formx').serialize(), function (rs) {
                            if (rs.success) {

                                top.layer.close(index);

                                top.layer.msg("操作成功!", {icon: 1},function () {
                                    parent.location.reload();
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

        //风险检测报告
        function riskcheck(id,irisktype){
            top.layer.open({
                type: 2,
                title: "风险评估报告",
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapplyriskdetail/risk.shtml?id='+id+'&irisktype='+irisktype+'&type=1',
                btn: ['关闭'],
                cancel: function (index) {
                }
            });
        }

        //风险总评
        function authapplyScore(id){
            top.layer.open({
                type: 2,
                title: '风险总评',
                area: ['60%', '45%'],
                content: '${ctx}/hy/authapplywarn/score.shtml?id='+id,
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $ = iframeWin.contentWindow.$;
                    var doc = $(iframeWin.contentWindow.document);
                    if (iframeWin.contentWindow.valiForm()) {
                        $.post("${ctx}/hy/authapplywarn/score.json", doc.find('#formx').serialize(), function (rs) {
                            if (rs.success) {

                                top.layer.close(index);

                                top.layer.msg("操作成功!", {icon: 1});
                            }
                            else {
                                top.layer.msg(rs.msg, {icon: 5});
                            }
                        });

                    }

                },
                cancel: function (index) {
                }
            });
        }
    </script>

</head>
<body>
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h5>拟迁入基金风险排查</h5>
        </div>
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/authapplywarn/riskcheck.shtml" method="post" class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0" />
                        <div class="form-group">
                            <span>公司名称：</span>
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
                        <shiro:hasPermission name="riskcheck:add">
                            <a onclick="riskcheckAdd()" class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" title="添加"><i class="fa fa-plus"></i> 添加</a>
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
                    <th class="sort-column">企业名称</th>
                    <th class="sort-column">业务类型</th>
                    <th class="sort-column">审核状态</th>
                    <th class="sort-column">风险评级</th>
                    <th class="sort-column">备案日期</th>
                    <th class="sort-column">申请时间</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list.content}" var="obj">
                        <tr>
                            <td>${obj.scnname}</td>
                            <td>
                                <member:BizType op="label" val="${obj.ibiztype}"/>
                            </td>
                            <td>
                                <member:CheckStatus op="label" val="${obj.istatus}"/>
                            </td>
                            <td>
                                <member:RiskLevel op="label" val="${obj.irisklevel}"/>
                            </td>
                            <td>
                                <mw:format label="date" value="${obj.drecorddate}"/>
                            </td>
                            <td>
                                <mw:format label="date" value="${obj.dadddate}"/>
                            </td>
                            <td>
                                <%--<a onclick="querydetail('${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>基本信息</a>--%>
                            <c:if test="${operator.ioperatortype eq 30}">
                                <shiro:hasAnyPermission name="riskcheck:check">
                                    <c:if test="${obj.istatus eq 0}">
                                        <a onclick="check('${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>审核</a>
                                    </c:if>
                                </shiro:hasAnyPermission>

                                <c:if test="${obj.istatus ne 0}">
                                    <ul class="hard-list">
                                        <li>风险评估
                                            <ul>
                                                <li><a onclick="authapplyScore('${obj.id}')" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>风险总评</a> </li>
                                                <li><a onclick="riskcheck('${obj.id}',7)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>风险预警</a> </li>
                                                <li><a onclick="riskcheck('${obj.id}',0)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>机构自身</a> </li>
                                                <li><a onclick="riskcheck('${obj.id}',1)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>核心人员</a></li>
                                                <li><a onclick="riskcheck('${obj.id}',2)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>关联企业</a></li>
                                                <c:if test="${obj.ibiztype eq 0}">
                                                    <li> <a onclick="riskcheck('${obj.id}',3)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>在管基金</a></li>
                                                    <li> <a onclick="riskcheck('${obj.id}',4)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>未备案企业</a></li>
                                                </c:if>
                                                <c:if test="${obj.ibiztype eq 1}">
                                                    <li><a onclick="riskcheck('${obj.id}',5)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>管理人合规性</a></li>
                                                    <li><a onclick="riskcheck('${obj.id}',6)" class="btn btn-default btn-xs"><i class="fa fa-edit"></i>基金运作情况</a></li>
                                                </c:if>
                                            </ul>
                                        </li>
                                    </ul>
                                </c:if>
                            </c:if>
                            <c:if test="${operator.ioperatortype eq 10}"><%--监管--%>
                                <a onclick="fengxianpg('${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>风险评估</a>
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