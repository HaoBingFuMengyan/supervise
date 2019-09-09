<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" charset="" content="jj">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>产品分类列表</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/of/centercss.css" rel="stylesheet" type="text/css">
    <style>
        .layui-btn{
            background: #e73426!important;
        }
        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: #e73426!important;
        }
    </style>
</head>
<body>
<sys:message content="${message}"/>
<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var sproductid = '${data.id}';
    var sparentid = '${data.sparentid}';
    var resourceIds = [];
    layui.use(['table','layer','laydate'],function(){

        jj.table =layui.table;
        jj.url="${ctx}/hy/shopproduct/list.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'sname', title: '分类名称',minWidth:120,sort: true},
            {field:'id', title: '添加人',minWidth:120,sort: true,templet:function (d) {
                return d.user.smobile;
            }},
            {field:'dadddate', title: '添加时间',minWidth:140,sort: true}
            ,{fixed: 'right', align:'left', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.limit=50;
        jj.render({
            initSort:{
                field:"dadddate",
                type:"desc"
            },
            where:{
                search_eq_sparentid:sproductid
            },
            cellMinWidth:80,
            page: true
        });
        
        jj.addClass = function (obj) {
            jj.open({
                area: ['65%', '50%'],
                content:"${ctx}/hy/shopproduct/add.shtml?id="+sproductid
            });
        };

        jj.edit = function (obj) {
            jj.open({
                area: ['65%', '50%'],
                content:"${ctx}/hy/shopproduct/add.shtml?id="+obj.id+"&type=edit"
            });
        };

        jj.RelationCommodity = function (obj) {
            top.layer.open({
                type: 2,
                area: ['550px', '550px'],
                title:"关联商品",
                content:"${ctx}/hy/shopproductsource/resourceselect.shtml?id="+obj.id,
                btn: ['确定', '关闭']
                ,yes: function(index, layero){ //或者使用btn1
                    var iframeWin = layero.find('iframe')[0];
                    var $=iframeWin.contentWindow.$;
                    var doc=$(iframeWin.contentWindow.document);

                    iframeWin.contentWindow.treeSelect();

                    resourceIds = iframeWin.contentWindow.ids;
                    var resourceNames = iframeWin.contentWindow.names;

                    if (resourceIds.length != 0 && resourceNames.length != 0){
                        var formdata = new FormData();
                        formdata.append("resourceids",resourceIds);
                        formdata.append("resourcenames",resourceNames);
                        formdata.append("id",obj.id);
                        $.ajax({
                            url: "${ctx}/hy/shopproduct/resourcesave.shtml",
                            type: 'POST',
                            data: formdata,
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                if(data.success){
                                    jj.closeAll();
                                    if (data.msg)
                                        jj.msg(data.msg);
                                    else
                                        jj.msg('操作成功');
                                }else{
                                    jj.msg(data.msg,5,3);
                                }
                            },
                            error:function (data) {
                                jj.error('系统错误，请联系管理员');
                            }
                        });
                    }

                }

            });
        };

        jj.queryRelationCommodity = function (obj) {
            jj.xview({
                area: ['550px', '550px'],
                title:"关联商品",
                content:"${ctx}/hy/shopproductsource/resourceselect.shtml?id="+obj.id
            })
        };

        jj.parentDelete = function (obj) {
            top.layer.confirm('您确定要删除一级分类及所有子分类吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                jj.deleteID(obj.id);
            }, function(){
                jj.closeAll(1);
            });
        };

        jj.delete = function (obj) {
            jj.deleteID(obj.id);
        };

        jj.deleteID = function(id) {
            jj.post("${ctx}/hy/shopproduct/delete.json",{id:id},function (rs) {
                if(rs.success){
                    jj.closeAll();
                    if(rs.msg){
                        jj.msg(rs.msg);
                    }
                    else {
                        jj.msg("操作成功!");
                    }
                    jj.refresh();
                }
                else {
                    jj.msg(rs.msg,5,3);
                }
            });
        }

    });
</script>

<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="编辑" event="edit" type="a" />

        <jj:listbtn name="关联商品" event="RelationCommodity" type="a" />

        <jj:listbtn name="查看关联商品" event="queryRelationCommodity" type="a" />

        {{#  if(sparentid == "" || sparentid == null){ }}
            <jj:listbtn name="删除" event="parentDelete" type="a" />
        {{#  } else{}}
            <jj:listbtn name="删除" event="delete" type="a" />
        {{#  } }}

    </div>
</script>

<script type="text/html" id="xtoolbar">
    {{#  if(sparentid == "" || sparentid == null){ }}
        <jj:btn event="addClass" name="添加一级分类" />
    {{#  } else{}}
        <jj:btn event="addClass" name="添加二级分类" />
    {{#  } }}

</script>
</body>
</html>


