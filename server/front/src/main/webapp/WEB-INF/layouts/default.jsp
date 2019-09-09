<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="format-detection" content="telephone=no" />
    <title><sitemesh:title/></title>
	<link type="image/x-icon" href="${ctx}/title/favicon.ico" rel="shortcut icon">
    <link href="${ctx}/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/font/iconfont.css"/>
    <script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="${ctx}/static/common/common.js" type="text/javascript"></script>
     <!-- 校验js -->
    <script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js" charset="UTF-8" ></script>
	<link href="${ctx}/js/jquery-validation-1.17.0/demo/css/cmxform.css" rel="stylesheet" type="text/css">

    <!--屏蔽鼠标右键 -->
    <%
        if(!(request.getServerName().contains("localhost"))){
            out.print("<script type='text/javascript' src='"+request.getContextPath()+"/js/disableMouse.js'></script>");
        }
    %>

    <!-- 引入layer插件 -->
    <script src="${ctxStatic}/layer-v3.1.0/layer/layer.js"></script>
    <script src="${ctxStatic}/layDate-v5.0.8/laydate/laydate.js"></script>
    <script src="${ctxStatic}/common/jeeplus.js"></script>
    <link rel="stylesheet" href="${ctx}/css/buxiu.css">
    <link href="${ctx}/css/page.css" type="text/css" rel="stylesheet">
    <script>
        var ctx="${ctx}";

        $().ready(function () {
            //全局查询回车事件
            $("#textt").keydown(function (even) {
                if (even.keyCode == 13)
                    queryIndeAndStock();
            });

            $(".search input[type='button']").click(function () {
                queryIndeAndStock();
            });

            $(".hotwords a").click(function () {
                $(this).siblings().removeClass('red');
                $(this).addClass('red');
                $('#textt').val($(this).text().trim());

                queryIndeAndStock();
//                gotoIndex();
            });
            //5级菜单
            var trigger = null;
            $(".dd-inner .font-item .font-item1 .font-lefty dd a").mouseover(function(){
                console.log("in3");
                var category = $(this).text().trim();
                var categoryid=$(this).data("id");
                trigger = setTimeout(function(){
                    querySbrand(category,categoryid);
                },800); //这里1000就是间隔1秒
            })
            $(".dd-inner .font-item .font-item1 .font-lefty dd a").mouseleave(function(){
                console.log("out");
                clearTimeout(trigger);
            })
        });
        //获取下级品牌，规格型号
        function querySbrand(category) {
            $.ajax({
                url: '${ctx}/sbrand.json',
                data: {sname:category},
                traditional: true,
                success: function (data) {
                    if (data.success) {
                        var i = 0;
                        $(".brand-box-body").empty();
                        $(".brand-box-head span").text(data.msg);
                        $.each(data.obj,function(index,value){
//                            $(".brand-box-head span").text(value.attributes);
                            $(".brand-box-body").append('<div class="brand-group"><h2><img src="<cs:SysParaType imgurl="1" op="syspara"/>/'+value.iconCls+'" alt="">'+'<a onclick="searchSproducer(\''+value.attributes+'\',\''+value.text+'\')">'+value.text+'</a>'+'<button onclick="Exhibition(this)">展开</button></h2><ul class="clearfix brand_box_body'+i+'"></ul></div>');
                            $.each(value.children,function(key,val){
                                $(".brand_box_body"+i).append('<li><a onclick="searchResource(\'keyword\',\''+(val.code?val.code:val.text)+'\',\''+value.text+'\')">'+val.text+'</a></li>');
                            });
                            i++;
                        });
                        $(".brand-box").show();
                    } else {
                        if (data.msg)
                            layer.msg(data.msg);
                        else
                            layer.msg("未知错误,返回消息格式不正确!需要异步提交");
                    }
                },
                error: function () {
                    layer.msg("系统错误，请联系管理员");
                }
            });
        }

        function gotoIndex() {
            var keyword = $("#textt").val().trim();
            var type = $(".w .search ul .select").attr('data-type');
            if (type == 'indentureType'){
                //window.location.href="${ctx}/mall.html?flag=true&keyword="+encodeURI(keyword);
                virtualSumbitForm("${ctx}/mall.html?flag=true&searchType="+type,keyword);
            }else if (type == 'resourceType'){
                //window.location.href="${ctx}/goods_stock.html?flag=true&keyword="+encodeURI(keyword);
                virtualSumbitForm("${ctx}/goods_stock.html?flag=true&searchType="+type,keyword);
            }else{
                //window.location.href="${ctx}/mall.html?flag=true&keyword="+encodeURI(keyword);
                virtualSumbitForm("${ctx}/mall.html?flag=true&searchType="+type,keyword);

            }
        }

        function virtualSumbitForm(url,keyword)
        {
            // 创建一个 form
            var form1 = document.createElement("form");
            form1.id = "virtualForm";
            form1.name = "virtualForm";
            // 添加到 body 中
            document.body.appendChild(form1);
            // 创建一个输入
            var input = document.createElement("input");
            // 设置相应参数
            input.type = "text";
            input.name = "keyword";
            input.value = keyword;
            // 将该输入框插入到 form 中
            form1.appendChild(input);
            // form 的提交方式
            form1.method = "POST";
            // form 提交路径
            form1.action = url;
            // 对该 form 执行提交
            form1.submit();
            // 删除该 form
            document.body.removeChild(form1);
        }

        function queryIndeAndStock() {
            var keyword = $("#textt").val().trim();
            searchResource('search_like_skeyword',keyword);
        }
    </script>
    <sitemesh:head></sitemesh:head>
</head>
<body>
<!-- 头部-->
<jsp:include page="page/_head.jsp"/>
<!-- 中间logo及菜单-->
<jsp:include page="page/_menu.jsp"/>
<sitemesh:body></sitemesh:body>
<!-- 尾部-->
<jsp:include page="page/_buttom.jsp"/>
<%--<!-- 右侧菜单-->--%>
<%--<jsp:include page="page/_right.jsp"/>--%>
</body>
</html>
