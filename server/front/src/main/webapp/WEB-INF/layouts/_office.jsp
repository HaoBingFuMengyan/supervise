<%@ page import="com.frogsing.member.vo.LoginUser" %>
<%@ page import="com.frogsing.heart.security.shiro.ShiroUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<sitemesh:usePage id="thePage"/>
<!-- 把当前页面赋值给thePage这个变量-->

<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <META http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <title>会员中心-基金协同监管系统沟通</title>
    <link type="image/x-icon" href="${ctx}/images/favicon.png" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="${ctx }/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/of/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/of/icon/iconfont.css"/>
    <link href="${ctx}/of/css/centercss.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <link href="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.css" rel="stylesheet" type="text/css">
    <link href="${ctxStatic}/jj/jj.css?v=1" rel="stylesheet" type="text/css"/>

    <script src="${ctxStatic}/jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jquery/jquery.collapse.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
    <script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>
    <script src="${ctx}/js/jquery-validation-1.17.0/dist/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/localization/messages_zh.js"
            charset="UTF-8"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-validation-1.17.0/dist/add.js" charset="UTF-8"></script>
    <link href="${ctx}/js/jquery-validation-1.17.0/demo/css/cmxform.css" rel="stylesheet" type="text/css">
    <script src="${ctxStatic}/jquery/jquery.cookie.js"></script>
    <script src="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jj/jj.js" type="text/javascript"></script>
    <script type="text/javascript">
        var g_ctx = "${ctx}";
        var g_onsubmit = false;

        layui.use(['layer', 'laydate'], function () {
            var laydate = layui.laydate;
            layer = layui.layer;


        });

        $().ready(function () {
            function close_TipDiv(id, divId) {
                $("#" + id).click(function () {
                    $("#" + divId).slideUp("slow");
                })
            }

            //关闭提示层
            $(function () {
                if (typeof close_TipDiv != "undefined")
                    close_TipDiv('closeTipID', 'tipDivID');
            });

            var o = $.cookie('_openmenu') || {};
            for (var i in o) {
                if (o[i]) {
                    if ($(this).attr("data-flag") == "close") {
                        $(this).attr("data-flag", "open");
                        $(this).find("i").html("&#xe636;");
                        $(this).parent().find("div.left_middle").show();
                    }
                }
            }

            $("#leftbar").find("div.menu").find("div.trade").click(function () {
                var o = {};
                try {
                    o = JSON.parse($.cookie('_openmenu'));
                } catch (e) {
                }

                if ($(this).attr("data-flag") == "close") {
                    o[$(this).text().trim()] = 1;
                    $(this).attr("data-flag", "open");

                    $(this).find("i").html("&#xe636;");
                    $(this).parent().find("div.left_middle").show(600);
                } else {
                    o[$(this).text().trim()] = 0;
                    $(this).attr("data-flag", "close");
                    $(this).find("i").html("&#xe626;");
                    $(this).parent().find("div.left_middle").hide(600);
                }
                $.cookie('_openmenu', JSON.stringify(o));
            });
        })
    </script>
    <sitemesh:head></sitemesh:head>

    <%
        LoginUser user = ShiroUtils.getCurrentUser();
        int membertype = user.getMembertype();
        String loginName = user.getLoginName();
        int authtype = user.getAuthtype();

    %>
</head>

<body style="height: 100%;">
<div id="header">
    <jsp:include page="page/_office_top.jsp"/>
</div>
<div class="mycontainer <%if(membertype==1){%>jy-container<%}%>">

    <!-- 左边菜单分类导航开始 -->
    <div id="leftbar">
        <div class="menu" style="border-bottom:none;">
            <div class="trade" data-flag="open">
                <span class="icon icon-ren"></span><strong>企业服务</strong><i class="icon fr">&#xe636;</i>
            </div>

            <div class="left_middle">
                <ul>
                    <li>
                        <i></i>
                        <a href="${ctx}/index.shtml"><i class="icon icon-guanli"></i>发起申请</a></li>

                    <li>
                    <li>
                        <i></i>
                        <a href="${ctx}/hy/authapply/list.shtml?type=0"><i class="icon icon-guanli"></i>申请企业入驻</a>
                    </li>
                    <li>
                        <i></i>
                        <a href="${ctx}/hy/authapply/list.shtml?type=1"><i class="icon icon-guanli"></i>入驻企业管理</a>
                    </li>
                    <%--<li>--%>
                        <%--<i></i>--%>
                        <%--<a href="${ctx}/hy/user/list.shtml"><i class="icon icon-xinxi1"></i>站内信</a></li>--%>

                </ul>

            </div>
        </div>

    </div>
    <div class="leftfill"></div>
    <!-- 左边菜单分类导航结束 -->

    <div id="right">
        <sitemesh:body></sitemesh:body>
    </div>
</div>

</body>
</html>
