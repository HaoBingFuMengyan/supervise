<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">

    <link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
    <title>关联仓单</title>

    <script type="text/javascript">
        var ids = [],names = [];
        function createTree(url, treeId) {
            var zTree; //用于保存创建的树节点
            var setting = { //设置
                check: {
                    enable: true
                },
                view: {
                    showLine: true, //显示辅助线
                    dblClickExpand: true,
                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id",
                        pIdKey: "pid",
                        rootPId: 0
                    }
                }
            };

            $.ajax({ //请求数据,创建树
                type: 'GET',
                url: url,
                dataType: "json", //返回的结果为json
                success: function(data) {
                    zTree = $.fn.zTree.init($(treeId), setting,data); //创建树

                    selectCheckNode();
                },
                error: function(data) {
                    jj.error("创建树失败!");
                }
            });
        }

        function treeSelect(){
            var treeObj = $.fn.zTree.getZTreeObj("tree");
            var nodes = treeObj.getCheckedNodes(true);
            if(0 === nodes.length) {
                jj.error('请选择关联品名');
                return;
            }
//            console.log(JSON.stringify(nodes));
            ids=[];
            for(var i = 0; i < nodes.length; i++) {
                ids.push(nodes[i].id);
                names.push(nodes[i].name.split('/')[0]);
            }
        }

        //默认选择节点
        function selectCheckNode() {
            var ztreeMenu = $.fn.zTree.getZTreeObj("tree");
            var sguids = "${selectIds}".split(",");
            for(var i=0; i<sguids.length; i++) {
                var node = ztreeMenu.getNodeByParam("id", sguids[i]);
                if(node){
                    try{ztreeMenu.checkNode(node, true, false);}catch(e){}
                    ztreeMenu.selectNode(node, true);
                }else{
                    ztreeMenu.selectNode(node, false);
                }
            }
        }
        $(document).ready(function() {
            createTree("${ctx}/zy/marginsaleresource/treeData.shtml", "#tree"); //创建
        });

    </script>
</head>
<body>
    <div id="tree" class="ztree" style="padding:15px 20px;"></div>
</body>
</html>