<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html style="overflow-x:hidden;overflow-y:auto;">
<head>
    <title>权限码管理</title>
</head>
<body class="">
<div class=" wrapper-content">
    <!-- 查询条件 -->
    <div class="row">
        <div class="col-sm-12">
            <form:form id="searchForm" action="" method="post" class="form-inline">
                <input type="hidden" name="search_eq_sparentid" value="${sparentid}"/>
                <div class="form-group">
                    <span>名称：</span>
                    <input name="search_like_sname" value="${search_like_spurname}" class="form-control"/>
                </div>
            </form:form>
            <br/>
        </div>
    </div>

    <table class="layui-hide" id="stable" lay-filter="stable"></table>

    <script>


        layui.use(['table', 'layer'], function () {

            jj.table = layui.table;
            jj.url = "${ctx}/jj/menu/list.json";
            jj.cols = [[
                {type: 'checkbox'}
                , {field: 'isort', title: '编号', sort: true}
                , {field: 'sname', title: '权限名称', sort: true}
                , {field: 'smenupath', title: '权限码', sort: true}
                , {fixed: 'right', width: 250, align: 'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

            ]];
            jj.render({
                initSort: {
                    field: "isort",
                    type: "asc"
                },
                page: true
            });


            jj.add = function () {

                var i = jj.open({
                    content: "${ctx}/jj/menu/detail.shtml?sparentid=${sparentid}"
                });
            };
            jj.edit = function (obj) {

                var i = jj.open({
                    content: "${ctx}/jj/menu/detail.shtml?id=" + obj.id
                });

            };
            jj.up = function (d) {

                jj.post("${ctx}/jj/menu/up.json", {id: d.id});

            };
            jj.down = function (d) {

                jj.post("${ctx}/jj/menu/down.json", {id: d.id});
            };

        });
        jj.width = 800;
        jj.height = 400;
    </script>
    <script type="text/html" id="barDemo">
        <div class="layui-btn-group" data-rowid="{{d.id}}">

            <jj:listbtn event="detail" name="查看"/>
            <shiro:hasPermission name="menu:edit">
                <jj:listbtn event="edit" name="编辑"/>
                <jj:listbtn event="delete" name="删除"/>
                <jj:listbtn event="up" name="up"/>
                <jj:listbtn event="down" name="down"/>
            </shiro:hasPermission>
        </div>

    </script>
    <script id="xtoolbar" type="text/html">
        <shiro:hasPermission name="menu:edit">
            <jj:btn name="添加" event="add"></jj:btn>
            <jj:btn name="删除" event="deleteAll"></jj:btn>
        </shiro:hasPermission>
    </script>
</body>
</html>