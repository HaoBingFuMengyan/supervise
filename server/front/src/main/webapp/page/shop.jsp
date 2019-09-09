<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="css/side.css"/>
    <meta name="data-spm" content=""/>
    <title>煤亮子</title>
    <link href="${ctx}/css/page.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/js/page.js"></script>
    <script type="text/javascript">
        var ctx="${ctx}";
        var smemberid = '${membershop.smemberid}';
    </script>

    <script type="text/javascript" src="${ctx}/js/membershopQuery.js"></script>

    <link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        body {
            background: #efefef !important;
        }

        .w-search, .focus, #navv {
            display: none;
        }

        .floor .p-list li {
            position: relative;
        }

        .p-info img {
            position: absolute;
            width: 22px;
            bottom: 25px;
            right: 15px;
        }

        .floor .p-list .p-name {
            height: 2em;
        }

        .floor .p-list {
            height: auto !important;
        }

        .floor .p-list li {
            width: 201px !important;
        }

        .floor .p-list li:nth-child(4n) {
            border-right: none;
        }

        .lazy-fn-done {
            background: #fff;
        }
        .pager_content {
            margin: 30px 0 30px 0;
        }
        div.scott span.current {
            background-color: #d0111b;
            border: 1px solid #d0111b;
        }
        div.scott a {
            border: 1px solid #d0111b;
            color: #d0111b;
        }
        .shopInfor-word {
            padding: 20px;
            background: #fff;
            min-height: 600px;
        }
        .shopInfor-word img{
            max-width: 100%;
            margin: 10px 0;
        }
        .shopInfor-word p{
            line-height: 1.8;
            margin-bottom: 10px;
            color:#666;
            font-size: 14px;
        }
    </style>
    <script>
        $(function(){
//            $("table td .showMore").click(function () {
//
//            });
            $(".shop-nav ul li").click(function(){
                var index=$(this).index();
                $(this).addClass('cur').siblings().removeClass('cur');
                $('.shopTab').removeClass('tabShow');
                $('.shopTab').eq(index).addClass('tabShow');
            });
        })
    </script>
</head>
<body>
<div class="shop-search">
    <div class="w clearfix">
        <div class="logo left" style="width: auto">
            <img class="shop-logo" height="45" src="${membershop.slogo}">
            <p>${membershop.sshopname}</p>
            <label>合作商家</label>
        </div>
        <div class="search">
            <div class="searchBar-input">
                <div class="searchBar-input-inner">
                    <input type="text" id="shopKey" name="keywords" placeholder="请输入关键字" maxlength="100" />
                </div>
            </div>
            <button onclick="searchShop()">搜本店</button>
        </div>
    </div>
</div>
<div class="">
    <c:choose>
        <c:when test="${membershop.sbannerurl != '' && membershop.sbannerurl != null}">
            <img style="width:100%" src="${membershop.sbannerurl}">
        </c:when>
        <c:otherwise>
            <img style="width:100%" src="${ctx}/images/page/shop-ban.png">
        </c:otherwise>
    </c:choose>
</div>
<div class="shop-nav">
    <div class="w">
        <ul>
            <li class="cur">我的店铺</li>
            <li>企业介绍</li>
            <li>成功案例</li>
        </ul>
    </div>
</div>
<sys:message content="${message}"/>
<div class="shop-con">
    <div class="w clearfix shopTab tabShow">
        <div class="shop-le" style="float: right">
            <div class="indexCont-search-cont">
                <table>
                    <tbody>
                    <input type="hidden" id="shopid" value="${membershop.id}"/>
                    <input type="hidden" id="product_scode" >
                    <tr levl="9">
                        <th>分类</th>
                        <td id="saleresource">
                            <div class="showDetail">
                                <span class="searchListBtn now" data-type="" onclick="selectQuery(this)">全部</span>
                                <span class="searchListBtn" data-type="0" onclick="selectQuery(this)">现货</span>
                                <span class="searchListBtn" data-type="1" onclick="selectQuery(this)">资源</span>
                            </div>
                            <a onclick="empty()" class="empty close"><span class="showMoreClose">清空</span></a>
                        </td>
                    </tr>
                    <tr levl="8">
                        <th>产品</th>
                        <td>
                            <div class="showDetail" id="scommodityname900">
                            </div>
                            <a onclick="shrink(this)" class="showMore close"><span class="showMoreClose">展开</span><i class="icon icon-smalldown"></i></a>
                        </td>
                    </tr>
                    <tr levl="6">
                        <th>存放地</th>
                        <td>
                            <div class="showDetail" id="swarehousename900">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="shop-tab">
                <ul class="clearfix">
                    <li class="cur" id="switch">全部</li>
                    <%--<li>资源</li>--%>
                </ul>
            </div>
            <div class="shop-list">
                <div class="operation bgfff clearfix">
                    <div class="operation-left" id="searchOrder">
                        <span class="active" onclick="reOrder('desc_dbegindate',this)" data-sort="desc_dbegindate">默认</span>
                        <span onclick="reOrder('asc_fprice',this)" data-sort="asc_fprice">价格<i class=""></i></span>
                    </div>
                </div>
                <div class="tableList">
                    <div class="rowList clearfix floor" id="content">
                    </div>
                </div>
            </div>
        </div>
        <div class="shop-rg" style="float: left">
            <div class="indexCont-list shopDetail">
                <div class="ztree-tit">所有分类</div>
                <div class="ztree-con">
                    <div id="ztree" class="ztree leftBox-content"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="shopTab w clearfix">
        <div class="shopInfor-word">
            ${membershop.scompanydesc}
        </div>
    </div>
    <div class="shopTab w clearfix">
        <div class="shopInfor-word">
            ${membershop.ssuccessexam}
        </div>
    </div>
</div>

<script type="text/javascript">
    var setting = {
        data: {simpleData: {enable: true, idKey: "id", pIdKey: "pId", rootPId: '0'}},
        async:{
            enable:true,
            url:"${ctx}/hy/shopproduct/treeData.json?smemberid=${membershop.smemberid}",
            autoParam:["id"],
            dataType:"json",
        },
        view: {
            selectedMulti: false
        },
        callback: {
            onClick: function (event, treeId, treeNode,pId) {
                var id = treeNode.id == '0' ? '' : treeNode.id;
                var name = treeNode.name;

//                alert("id:"+id+",name:"+name);

                treeQuery(treeNode);

            },
            onAsyncSuccess:function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
                var tree=$.fn.zTree.getZTreeObj(treeId);
//                tree.expandAll(false);
                var nodes = tree.getNodes();
                var node=nodes[0];
                tree.expandNode(node,true);
//                tree.selectNode(node);
//                setting.callback.onClick(null,node.id,node);
            }
        }
    };

    function refreshTree(){
        $.fn.zTree.init($("#ztree"), setting);
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
        $("#right-contant").width($("#content").width()- leftWidth - $("#openClose").width() -60);
//            $(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
    }
</script>
<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>

</html>
