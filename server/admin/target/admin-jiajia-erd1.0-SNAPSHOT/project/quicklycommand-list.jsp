<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>
    <title>常用指令列表</title>
    <meta name="decorator" content="jj"/>
</head>
<div>
    <mw:msg></mw:msg>
    <div class="search">
        <form class="layui-form" id="searchForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <!-- 查询条件 -->
                    <div class="layui-form-item">
                        <label>指令简称：</label>
                        <div class="layui-inline">
                            <input class="layui-input" name="search_like_sshorname" value="${search_like_sshorname}" autocomplete="off">
                        </div>
                        <label>指令内容：</label>
                        <div class="layui-inline">
                            <input class="layui-input" name="search_like_scontent" value="${search_like_scontent}" autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script type="text/html" id="xtoolbar">
        <shiro:hasPermission name="users:edit">
            <jj:listbtn name="添加" event="add"></jj:listbtn>
        </shiro:hasPermission>
    </script>
    <div class="row">
        <table class="layui-hide" id="stable" lay-filter="stable"></table>
    </div>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

    <script>
        layui.use(['table', 'layer'], function () {
            var layupload = layui.upload;
            jj.table = layui.table;
            var form = layui.form;
            jj.url = "${ctx}/jj/quicklycommand/list.json";
            jj.xurl = "${ctx}/jj/quicklycommand/";
            jj.cols = [[
                {field: 'sshorname', title: '指令简称', sort: true}
                , {field: 'scontent', title: '指令内容', sort: true}
                , {field: 'ienable', title: '是否启用', sort: true, templet: '#ienableTpl'}
                , {field: 'isort', title: '排序', sort: true}
                , {field: 'sremark', title: '备注', sort: true}
                // , {field: 'saddoperator', title: '添加人', sort: true}
                // , {field: 'dadddate', title: '添加时间', sort: true}
                , {fixed: 'right', align: 'left', width: 100, toolbar: '#operation',} //这里的toolbar值是模板元素的选择器
            ]];

            jj.width = 500;
            jj.height = 530;

            jj.render({
                initSort: {
                    field: "isort",
                    type: "asc"
                },
                cellMinWidth: 80,
                page: true
            });


        });
    </script>


</div>

<script type="text/html" id="operation">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="修改" event="edit" purview=""/>
        <jj:listbtn name="删除" event="delete" purview=""/>
    </div>
</script>

<script type="text/html" id="ienableTpl">
    {{#  if(d.ienable==1){ }}
    启用
    {{#  } else{}}
    禁用
    {{#  } }}
</script>
</body>
</html>