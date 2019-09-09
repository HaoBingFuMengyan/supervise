<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
    <title>部门管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/include/treeview.jsp" %>
    <!-- 树控件end-->
    <style type="text/css">
        .ztree {
            margin: 0;
            _margin-top: 10px;
            padding: 0px 0 0 0px;
            overflow-x: hidden;
        }

        #right {
            margin: 0 0 0 0;
            padding: 0 0 0 0;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            focusmenu('账号管理');
        });
        function refresh() {//刷新
            refreshNode();
        }
    </script>
</head>
<body class="">
<div id="main" class=" wrapper-content">
    <sys:message content="${message}"/>
    <div id="content" class="row">
        <div id="left" class="leftBox col-sm-1">
            <a onclick="refresh()" class="pull-right">
                <i class="fa fa-refresh"></i>
            </a>
            <div id="ztree" class="ztree leftBox-content"></div>
        </div>
        <div id="right" class="col-sm-11  animated fadeInRight">
            <iframe id="officeContent" style="overflow-x:hidden;" height="100%" width="100%" name="officeContent"
                    src="" frameborder="0"></iframe>
        </div>
        <input type="hidden" id="operatoridAndName" name="operatoridAndName">
    </div>
    <script type="text/javascript">
        var setting = {
            data: {simpleData: {enable: true, idKey: "id", pIdKey: "pId", rootPId: '0'}},
            async:{
                enable:true,
                url:"${ctx}/dt/department/treeData.shtml",
                autoParam:["id"],
                dataType:"json",
            },
            view: {
                selectedMulti: false
            },
            callback: {
                onClick: function (event, treeId, treeNode) {
                    var id = treeNode.id == '0' ? '' : treeNode.id;
                    $('#officeContent').attr("src", "${ctx}/jj/operator/choicelist.shtml?sdepartmentid=" + id);
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

        function refreshTree() {
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
        var frameObj = $("#left, #openClose, #right, #right iframe");
        function wSize() {
            var strs = getWindowSize().toString().split(",");
            htmlObj.css({"overflow-x": "hidden", "overflow-y": "hidden"});
            mainObj.css("width", "auto");
            frameObj.height(strs[0]);
            var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
            $("#right").width($("#content").width() - leftWidth - 50);
            $(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
        }
    </script>
    <script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>