<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp"%>
<html>
<head>
	<title>品名管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
	<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
	<style type="text/css">
		.ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}
	</style>
	<script type="text/javascript">
        $(function(){focusmenu('新闻管理');});
        function refresh(){//刷新
           // window.location="${ctx}/dt/article/index.shtml";
        	refreshTree();
        }
	</script>
</head>
<body class="fixed-sidebar  gray-bg">

<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-content">
			<sys:message content="${message}"/>
			<div id="content" class="row">
				<div id="left"  class="leftBox col-sm-1">
					<a onclick="refresh()" class="pull-right">
						<i class="fa fa-refresh"></i>
					</a>
					<div id="ztree" class="ztree leftBox-content"></div>
				</div>
				<div id="right"  class="col-sm-11  animated fadeInRight">
					<iframe id="officeContent" name="officeContent" src="${ctx}/dt/article/list.shtml?search_eq_snavigationid=" width="100%" height="91%" frameborder="0"></iframe>
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
            url:"${ctx}/dt/navigation/treeData.shtml",
            autoParam:["id"],
            dataType:"json",
        },
        view: {
            selectedMulti: false
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                var id = treeNode.id;
                $('#officeContent').attr("src", "${ctx}/dt/article/list.shtml?search_eq_snavigationid=" + id);
            },
            onAsyncSuccess:function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
                var tree=$.fn.zTree.getZTreeObj(treeId);
                tree.expandAll(true);
            }
        }
    };

    function refreshTree(){
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
    function wSize(){
        var strs = getWindowSize().toString().split(",");
        htmlObj.css({"overflow-x":"hidden", "overflow-y":"hidden"});
        mainObj.css("width","auto");
        frameObj.height(strs[0] - 120);
        var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
        $("#right").width($("#content").width()- leftWidth - $("#openClose").width() -60);
        $(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
    }
</script>
<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>