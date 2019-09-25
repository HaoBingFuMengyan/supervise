<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
    <title>准入基金列表</title>
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
                title:"信息",
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapply/index.shtml?id='+id,
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
            <h5>拟准入基金列表</h5>
        </div>
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <!-- 查询条件 -->
            <div class="row">
                <div class="col-sm-12">
                    <form:form id="searchForm" action="${ctx}/hy/authapply/bisincompany.shtml" method="post" class="form-inline">
                        <input type="hidden" id="pageNo" name="start" value="0" />
                        <div class="form-group">
                            <span>注册地址：</span>
                            <input type="text" name="search_like_sregaddress" value="${search_like_sregaddress}" class='form-control input-sm'/>
                            <span style="margin-left: 20px">业务类型：</span>
                            <member:BizType op="select" val="${search_eq_icorbiztype}" name="search_eq_icorbiztype" defval="" defname="全部" option="class='form-control input-sm'"/>
                            <span style="margin-left: 20px">入驻方式：</span>
                            <member:AuthapplySource op="select" val="${search_eq_iauthapplysource}" name="search_eq_iauthapplysource" defval="" defname="全部" option="class='form-control input-sm'"/>
                            <span style="margin-left: 20px">预审状态：</span>
                            <member:CheckStatus op="select" val="${search_eq_istatus}" name="search_eq_istatus" defval="" defname="全部" option="class='form-control input-sm'"/>
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
                    <th class="sort-column">注册地址</th>
                    <th class="sort-column">业务类型</th>
                    <th class="sort-column">入驻方式</th>
                    <th class="sort-column">预审状态</th>
                    <th class="sort-column">入驻审核</th>
                    <th class="sort-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.content}" var="obj">
                    <tr>
                        <td>
                            <c:if test="${obj.istatus eq 1}">
                                ${obj.sregaddress}
                            </c:if>
                        </td>
                        <td><member:BizType op="label" val="${obj.icorbiztype}"/></td>
                        <td>
                            <member:AuthapplySource op="label" val="${obj.iauthapplysource}"/>
                        </td>

                        <td>
                            <member:CheckStatus op="label" val="${obj.istatus}"/>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${obj.iprocess == null || obj.iprocess eq 0}">
                                    未申请
                                </c:when>
                                <c:when test="${obj.iprocess eq 10}">
                                    审核中
                                </c:when>
                                <c:when test="${obj.iprocess eq 30}">
                                    审核通过
                                </c:when>
                                <c:when test="${obj.iprocess eq 40}">
                                    审核拒绝
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a onclick="querydetail('${obj.id}')" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>企业信息</a>
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