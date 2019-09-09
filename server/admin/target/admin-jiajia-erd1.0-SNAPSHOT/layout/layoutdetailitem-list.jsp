]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
    <title>挂牌管理</title>
    <meta name="decorator" content="jj"/>
</head>
<body >
<%--<div class="search">--%>
<%--<form  class="layui-form" id="searchForm">--%>
<%--<div class="layui-form-item">--%>
<%--<div class="layui-inline">--%>
<%--<label class="layui-form-label">主机名称</label>--%>
<%--<div class="layui-input-inline">--%>
<%--<input type="text" name="search_like_shostname" placeholder="主机名称" autocomplete="off" class="layui-input"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="layui-inline">--%>
<%--<label class="layui-form-label">仓单号</label>--%>
<%--<div class="layui-input-inline">--%>
<%--<input type="text" name="search_like_sindentureno" placeholder="仓单号" autocomplete="off" class="layui-input"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</form>--%>
<%--</div>--%>

<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table','layer'],function(){

        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/jj/layoutdetailitem/list.json?search_eq_slayoutdetailid=${param.slayoutdetailid}";
        jj.xurl="${ctx}/jj/layoutdetailitem/";
        jj.cols= [[
            {type:'checkbox'}
            ,{field:'ino', title: '序号',sort: true}
            ,{field:'sname', title: '名称',sort: true}
            ,{field:'surl', title: '链接',sort: true}
            ,{align:'left',fixed:'right', toolbar: '#barDemo',width:100}
        ]];

        jj.width=500;
        jj.height=530;

        jj.render({
            initSort:{
                field:"ino",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });


        jj.add=function () {
            jj.open({
                area: ['30%', '35%'],
                content:"${ctx}/jj/layoutdetailitem/detail.shtml?slayoutdetailid=${param.slayoutdetailid}"
            });
        }

        jj.edit=function (obj) {
            jj.open({
                area: ['30%', '35%'],
                content:"${ctx}/jj/layoutdetailitem/detail.shtml?slayoutdetailid=${param.slayoutdetailid}&id="+obj.id
            });
        }

    });

</script>
<script type="text/html" id="xtoolbar">
    <jj:btn name="添加" event="add" purview="layoutdetailitem:add"/>

</script>

<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">

        <jj:listbtn name="编辑" event="edit" purview="layoutdetailitem:edit"/>
        <jj:listbtn name="删除" event="delete" purview="layoutdetailitem:delete"/>

    </div>
</script>



</body>
</html>
