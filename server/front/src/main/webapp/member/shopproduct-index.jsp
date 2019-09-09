<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会员店铺产品分类</title>
    <link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}
    </style>
    <script type="text/javascript">
        function refresh(){//刷新
            refreshNode();
        }
    </script>
</head>
<body class="fixed-sidebar  gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-content">
            <sys:message content="${message}"/>
            <div id="content" class="clearfix">
                <div id="left"  class="leftBox" style="float: left">
                    <div class="clearfix" style="padding: 10px 0">
                        <span class="pull-left">产品分类</span>
                        <a onclick="refresh()" class="pull-right">
                            <i class="fa fa-refresh"></i>
                        </a>
                    </div>
                    <div id="ztree" class="ztree leftBox-content"></div>
                </div>
                <div id="right-contant"  class="animated fadeInRight" style="float: right;">
                    <iframe id="officeContent" name="officeContent"  width="100%" height="91%" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var setting = {
        data: {simpleData: {enable: true, idKey: "id", pIdKey: "pId", rootPId: '0'}},
        async:{
            enable:true,
            url:"${ctx}/hy/shopproduct/treeData.json",
            autoParam:["id"],
            dataType:"json",
        },
        view: {
            selectedMulti: false
        },
        callback: {
            onClick: function (event, treeId, treeNode,pId) {
                var id = treeNode.id == '0' ? '' : treeNode.id;
                if(pId==null){
                    $('#officeContent').attr("src", "${ctx}/hy/shopproduct/list.shtml");}
                else{
                    $('#officeContent').attr("src", "${ctx}/hy/shopproduct/list.shtml?sproductid=" + id);
                }
            },
            onAsyncSuccess:function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
                var tree=$.fn.zTree.getZTreeObj(treeId);
                tree.expandAll(true);
                var nodes = tree.getNodes();
                var node=nodes[0];
                tree.selectNode(node);
                setting.callback.onClick(null,node.id,node);
            }
        }
    };

    function refreshTree(){
        <%--$('#officeContent').attr("src", "${ctx}/hy/shopproduct/list.shtml");--%>
        $.fn.zTree.init($("#ztree"), setting);
    }
    function refreshNode(){
        var zTree=$.fn.zTree.getZTreeObj('ztree');
        var type = "refresh",
            silent = false,
                /*获取 zTree 当前被选中的节点数据集合*/
            nodes = zTree.getSelectedNodes();
        /*强行异步加载父节点的子节点。[setting.async.enable = true 时有效]*/
        zTree.reAsyncChildNodes(nodes[0], type, silent);
    }
    refreshTree();

    var leftWidth = 180; // 左侧窗口大小
    var htmlObj = $("html"), mainObj = $("#main");
    var frameObj = $("#left, #openClose, #right-contant, #right-contant iframe");
    function wSize(){
        var strs = getWindowSize().toString().split(",");
        htmlObj.css({"overflow-x":"hidden"});
        mainObj.css("width","auto");
        frameObj.height(strs[0] - 120);
        var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
        $("#right-contant").width($("#content").width()- leftWidth - $("#openClose").width()-30);
        $(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
    }
</script>
<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>