<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>店铺装修</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/shop.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/ueditor/ueditor.all.js"> </script>

    <link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        .ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}
    </style>
    <script type="text/javascript">
        $(function(){
            $(".shop-tab ul li").click(function(){
                var index=$(this).index();
                $(this).addClass('active').siblings().removeClass('active');
                $('.shop-tab-content .shop-content').removeClass('display');
                $('.shop-tab-content .shop-content').eq(index).addClass('display');
            });

            UE.getEditor('scompanydesc',{UEDITOR_HOME_URL:'${ctxStatic}/ueditor/',lang:'zh-cn',serverUrl:'${ctx}/file/upload.json'});
            UE.getEditor('ssuccessexam',{UEDITOR_HOME_URL:'${ctxStatic}/ueditor/',lang:'zh-cn',serverUrl:'${ctx}/file/upload.json'});
        });

        layui.use(['layer', 'laydate', 'upload', 'form', 'element'], function () {
            var laydate = layui.laydate;
            var layer = layui.layer;
            var layupload = layui.upload;

            //拖拽上传
            layupload.render({
                elem: '#logo,#banner'
                , url: '${ctx}/file/uploadfile.json'
                , accept: 'file'
                , multiple: true
                , auto: true
                , field: "upfile"
                , data: {path: '/memberShop'}
                , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    layer.load(1); //上传loading
                }
                , allDone: function (obj) {
                    layer.closeAll('loading'); //关闭loadin
                }
                , done: function (res, index, upload) {
                    if (res.state == "SUCCESS") { //上传成功
                        var item = this.item;   // 获取当前触发上传的元素，一般用于 elem 绑定 class 的情况，注意：此乃 layui 2.1.0 新增
                        var id = item.attr('id');
                        $("#formImage").empty();
                        $("#formImage").append('<input type="hidden" name="isopen" value="${isOpen}">');
                        if (id == 'logo'){
                            $("#logoImage").attr('src',res.url);
                            $("#formImage").append('<input type="hidden" name="type" value="0">');
                            $("#formImage").append('<input type="hidden" name="slogo" value="'+res.url+'">');
                        }else {
                            $("#bannerImage").attr('src',res.url);
                            $("#formImage").append('<input type="hidden" name="type" value="1">');
                            $("#formImage").append('<input type="hidden" name="sbannerurl" value="'+res.url+'">');
                        }
                        $("#formImage").submit();
                    } else {
                        layer.msg(res.original + "上传失败，失败原因：" + res.state);
                        this.error(index, upload);
                    }
                }
            });
        });

        //店铺预览
        function preview(url) {
//            window.location.href=url;
            window.open(url,'_blank');
        }
    </script>
</head>
<body>
    <mw:msg />
    <div class="shop-logo">
        <div class="shopCon">
            <div class="">
                <c:choose>
                    <c:when test="${obj.slogo == '' || obj.slogo == null}">
                        <img id="logoImage" src="${ctx}/images/shop-logo.png">
                    </c:when>
                    <c:otherwise>
                        <img id="logoImage" src="${obj.slogo}">
                    </c:otherwise>
                </c:choose>
                <span>黄金店铺</span>
                <button class="layui-btn" id="banner">编辑Banner</button>
                <button class="layui-btn" id="logo">编辑Logo</button>
            </div>
        </div>
    </div>
    <div class="shop-ban">
        <c:choose>
            <c:when test="${obj.sbannerurl == '' || obj.sbannerurl == null}">
                <img id="bannerImage" src="${ctx}/images/shop-ban-common.jpg">
            </c:when>
            <c:otherwise>
                <img id="bannerImage" src="${obj.sbannerurl}">
            </c:otherwise>
        </c:choose>
    </div>
    <form id="formImage" action="${ctx}/hy/membershopapply/imageurl.shtml" method="post">
    </form>
    <div class="shop-tab">
        <div class="shopCon">
            <ul class="clearfix">
                <li class="active">所有产品</li>
                <li>企业介绍</li>
                <li>成功案例</li>
                <c:choose>
                    <c:when test="${isOpen == 1}">
                        <button onclick="preview('${ctx}/shop.html?id=${obj.id}')">店铺预览</button>
                    </c:when>
                    <c:otherwise>
                        <%--<button onclick="preview('${ctx}/apply.html?id=${obj.id}')">店铺预览</button>--%>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <div class="shop-tab-content">
        <div class="shopCon">
            <div class="shop-content shop-content0 display">
                <%--所有产品--%>
                <div class="shop-all clearfix">
                    <div class="shop-nav left">
                        <div class="shop-nav-head">所有类别<a href="${ctx}/hy/shopproduct/index.shtml">编辑</a></div>
                        <div id="ztree" class="ztree leftBox-content"></div>
                    </div>
                    <div class="shop-right left shop-demo-img">
                        <h2>店铺样板展示</h2>
                        <img src="${ctx}/images/shop-demo.jpg">
                    </div>
                </div>
            </div>
            <div class="shop-content shop-content1">
                <%--企业介绍--%>
                <div class="company-infor">
                    <form action="${ctx}/hy/membershopapply/imageurl.shtml" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="isopen" value="${isOpen}">
                    <input type="hidden" name="type" value="2">
                    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                        <tbody>
                            <tr>
                                <td class="active width-15"><label class="pull-right"></label></td>
                                <td colspan="3"><textarea id="scompanydesc" name="scompanydesc" style="width:100%;height:500px;">${obj.scompanydesc}</textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <button class="layui-btn" style="float: right">确定</button>
                    </div>
                    </form>
                </div>
            </div>
            <div class="shop-content shop-content2">
                <%--成功案例--%>
                <div class="sucess-case clearfix">
                    <form action="${ctx}/hy/membershopapply/imageurl.shtml" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="isopen" value="${isOpen}">
                        <input type="hidden" name="type" value="3">
                        <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                            <tbody>
                                <tr>
                                    <td class="active width-15"><label class="pull-right"></label></td>
                                    <td colspan="3"><textarea id="ssuccessexam" name="ssuccessexam" style="width:100%;height:500px;">${obj.ssuccessexam}</textarea></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="clearfix">
                            <button class="layui-btn" style="float: right">确定</button>
                        </div>
                    </form>
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
                },
                onAsyncSuccess:function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
                    var tree=$.fn.zTree.getZTreeObj(treeId);
//                    tree.expandAll(false);
                    var nodes = tree.getNodes();
                    var node=nodes[0];
                    tree.expandNode(node,true);
//                    tree.selectNode(node);
//                    setting.callback.onClick(null,node.id,node);
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


