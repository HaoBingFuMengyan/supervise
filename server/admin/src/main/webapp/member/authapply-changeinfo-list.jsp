<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>基金基本信息</title>
    <script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>

    <link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">

        layui.use(['form', 'layedit', 'upload', 'laydate'], function () {
            device = layui.device();
            form = layui.form;
            var layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;

            laydate.render({
                elem: '#drecorddate',
                trigger: 'click'
            });
            laydate.render({
                elem: '#drecorddate1',
                trigger: 'click'
            });

            laydate.render({
                elem: '#beian',
                trigger: 'click'
            });
            laydate.render({
                elem: '#beian1',
                trigger: 'click'
            });

            form.verify({
//                required: function (value) {
//                    if (pub.isnull(value)) {
//                        return '这是必填项';
//                    }
//                }
            });

            var layupload = layui.upload;

        });

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
            <h5>入驻企业统计</h5>
        </div>
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/authapply/changeinfo.shtml?type=${type}" method="post" class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0" />
                        <div class="form-group">
                            <span>企业名称：</span>
                            <input type="text" name="search_like_scnname" value="${search_like_scnname}" class='form-control input-sm'/>
                            <span style="margin-left: 20px">业务类型：</span>
                            <member:BizType op="select" val="${search_eq_icorbiztype}" name="search_eq_icorbiztype" defval="" defname="全部" option="class='form-control input-sm'"/>
                            <span style="margin-left: 20px">入驻类型：</span>
                            <member:AuthapplySource op="select" val="${search_eq_iauthapplysource}" name="search_eq_iauthapplysource" defval="" defname="全部" option="class='form-control input-sm'"/>
                            <span style="margin-left: 20px">风险评级：</span>
                            <member:RiskLevel op="select" val="${search_eq_irisklevel}" name="search_eq_irisklevel" defval="" defname="全部" option="class='form-control input-sm'"/>
                        </div>
                        <div class="form-group" style="display:block;margin-top: 10px;">
                            <span>入驻日期：</span>
                            <input id="drecorddate" name="search_gte_dapplydate" value="${search_gte_dapplydate}" class="form-control input-sm">-
                            <input id="drecorddate1" name="search_lte_dapplydate"  value="${search_lte_dapplydate}"  class="form-control input-sm">
                            <span>备案日期：</span>
                            <input id="beian" name="search_gte_drecorddate" value="${search_gte_drecorddate}" class="form-control input-sm">-
                            <input id="beian1" name="search_lte_drecorddate"  value="${search_lte_drecorddate}"  class="form-control input-sm">
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
                    <th class="sort-column">企业名称</th>
                    <th class="sort-column">业务类型</th>
                    <th class="sort-column">入驻类型</th>
                    <th class="sort-column">入驻日期</th>
                    <th class="sort-column">认缴规模(万元)</th>
                    <th class="sort-column">备案日期</th>
                    <th class="sort-column">风险评级</th>
                    <th class="sort-column">风险预警</th>
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
                            <member:AuthapplySource op="label" val="${obj.iauthapplysource}"/>
                        </td>
                        <td>
                            <mw:format label="date" value="${obj.dapplydate}"/>
                        </td>
                        <td>${obj.iregmoney}</td>
                        <td><mw:format label="date" value="${obj.drecorddate}"/></td>
                        <td>
                            <member:RiskLevel op="label" val="${obj.irisklevel}"/>
                        </td>
                        <td><mw:format label="toint" value="${obj.fwarnnum}"/></td>
                        <td>
                            <a onclick="querydetail('${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>企业信息${obj.fwarnnum}</a>

                            <c:if test="${type eq 1}">
                                <c:if test="${operator.ioperatortype eq 10}">
                                    <a onclick="dailQuery('${obj.id}')" class="btn btn-danger btn-xs"><i class="fa fa-edit"></i>监管问询</a>
                                </c:if>
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