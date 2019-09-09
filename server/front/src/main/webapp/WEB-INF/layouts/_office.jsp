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
    <title>会员中心-煤亮子</title>
    <link type="image/x-icon" href="${ctx}/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="${ctx }/of/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/of/icon/iconfont.css"/>
    <link href="${ctx}/of/css/centercss.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css"/>
    <link type="image/x-icon" href="${ctx}/images/favicon.ico" rel="shortcut icon"/>
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
            //全局查询回车事件
            $("#textt").keydown(function (even) {
                if (even.keyCode == 13)
                    queryIndeAndStock();
//                    gotoIndex();
            });

            $(".search input[type='button']").click(function () {
                queryIndeAndStock();
//                gotoIndex();
            });

            $(".hotwords a").click(function () {
                $(this).siblings().removeClass('red');
                $(this).addClass('red');
                $('#textt').val($(this).text().trim());

                queryIndeAndStock();
//                gotoIndex();
            });

            //$('input,textarea').placeholder();
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


            $('form').submit(function () {
                if ($(this) && $(this).valid) {
                    var r = $(this).valid();
                    if (r) {
                        $(this).find('input[type=submit]').attr('disabled', true);
                        //$(this).find('input[type=submit]').val('提交中...');
                        $(this).find('input[type=button]').attr('disabled', true);
                        //$(this).find('input[type=button]').val('提交中...');
                    }
                }

            });
            $("#nav ul li[data-flag='<%=thePage.getProperty("meta.decorator")%>']")
                .attr("class", "focus");
            $('.left_middle li')
                .each(
                    function (i) {
                        var a = $(this).find('a');

                        if ($(window).attr('location').href
                                .indexOf(a.attr('href')) > 0) {
                            selectThis(this);
                            return;
                        }
                    });
        });
        function focusmenu(txt, tag) {
            $('.left_middle li').each(function (i) {
                if (typeof tag != "undefined" && tag) {
                    var a = $(this).find('a');
                    if (a.data("tag") != null && a.data("tag") != "" && a.data("tag") != "null" && a.data("tag").indexOf(txt) >= 0) {
                        selectThis(this);
                        return;
                    }
                } else {
                    var a = $(this).find('a');
                    if (a.text().indexOf(txt) >= 0) {
                        selectThis(this);
                        return;
                    }
                }
            });

        }

        function selectThis(obj) {
            $(obj).addClass('cur');
            $(obj).parents("div.menu").find("div.trade").attr("data-flag", "open");
            $(obj).parents("div.menu").find("div.trade").find("i").html("&#xe636;");
            $(obj).parents("div.menu").find("div.left_middle").show();
        }

        function close_TipDiv(id, divId) {
            $("#" + id).click(function () {
                $("#" + divId).slideUp("slow");
            })
        }
        function showError(msg) {
            if ($('#tipDivID').find("p.msg"))
                $('#tipDivID').find("p.msg").remove();
            $('#tipDivID').append("<p class=\"msg error\">" + msg + "</p>").slideDown();
        }
        function closeError() {
            $('#tipDivID').hide();
        }
        //关闭提示层
        $(function () {
            if (typeof close_TipDiv != "undefined")
                close_TipDiv('closeTipID', 'tipDivID');
        });

        $.ajaxSetup({
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            complete: function (XMLHttpRequest, textStatus) {
                var sessionmsg = XMLHttpRequest.getResponseHeader("frog");
                if (typeof sessionmsg == "undefined" || sessionmsg == null
                    || sessionmsg == "")
                    return;
                else {
                    var obj = $.parseJSON(sessionmsg);
                    if (1 == obj.status) {
                        window.location.replace("${ctx}/login.html");
                    } else if (2 == obj.status) {
                        alert(obj.msg);
                    }
                }
            }
        });

        function gotoIndex() {
            var keyword = $("#textt").val().trim();
            var type = $("#resourceType").val();
            if (type == 'indentureType') {
                //window.location.href="${ctx}/mall.html?flag=true&keyword="+keyword;
                virtualSumbitForm("${ctx}/mall.html?flag=true", keyword);
            } else if (type == 'resourceType') {
                //window.location.href="${ctx}/goods_stock.html?flag=true&keyword="+keyword;
                virtualSumbitForm("${ctx}/goods_stock.html?flag=true", keyword);
            } else {
                //window.location.href="${ctx}/mall.html?flag=true&keyword="+keyword;
                virtualSumbitForm("${ctx}/mall.html?flag=true", keyword);
            }
        }

        function virtualSumbitForm(url, keyword) {
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
            var val = $("#textt").val().trim() ;
            $('#searchResourceForm').append('<input name="keyword" value='+val+' />').submit();
        }
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
<shiro:hasRole name="user">
    <div id="header">
        <jsp:include page="page/_office_top.jsp"/>
    </div>
    <div class="mycontainer <%if(membertype==1){%>jy-container<%}%>">

        <!-- 左边菜单分类导航开始 -->
        <div id="leftbar">
            <!--交易会员-->
            <%if (membertype == 1 && authtype == 20) {%>

            <shiro:hasAnyPermission name="buycontract:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-guanli"></span><strong>我的订单</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <li>
                                <i></i>
                                <a href="${ctx}/contract/gplist.shtml"><i class="icon icon-jinrongkeyuan"
                                                                          style="font-size: 14px"></i>预采购订单</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>

            <shiro:hasAnyPermission name="projectstock:query,projectadvance:query,projectproxy:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-ziyuan"></span><strong>项目管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <shiro:hasAnyPermission name="projectstock:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectstock/buy-list.shtml"><i
                                            class="icon icon-qiandai-zhanghu-zichan"
                                            style="font-size: 14px"></i>库存项目</a>

                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="projectadvance:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectadvance/buy-list.shtml"><i class="icon icon-guanli"
                                                                                      style="font-size: 14px"></i>预付项目</a>
                                </li>
                            </shiro:hasAnyPermission>

                            <shiro:hasAnyPermission name="projectadvance:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectreceivable/buy-list.shtml"><i class="icon icon-qiandai"></i>应收项目</a>
                                </li>
                            </shiro:hasAnyPermission>

                            <shiro:hasAnyPermission name="projectproxy:query">
                                <li>
                                    <i></i>

                                    <a href="${ctx}/projectproxy/list.shtml"><i class="icon icon-jinrongkeyuan"
                                                                                style="font-size: 14px"></i>代理销售</a>
                                </li>
                            </shiro:hasAnyPermission>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="buycontract:query,salecontract:query,buymargincontract:query,salemargincontract:query">
            <div class="menu">
                <div class="trade" data-flag="close">
                    <span class="icon icon-guanli"></span><strong>合同管理</strong><i class="icon fr">&#xe626;</i>
                </div>
                <div class="left_middle none">
                    <ul>
                        <shiro:hasAnyPermission name="buycontract:query">
                            <li>
                                <i></i>
                                <a href="${ctx}/contract/buylist.shtml"><i class="icon icon-guanli"></i>项目采购合同</a>
                            </li>
                        </shiro:hasAnyPermission>
                        <shiro:hasAnyPermission name="salecontract:query">
                            <li>
                                <i></i>
                                <a href="${ctx}/contract/salelist.shtml"><i class="icon icon-dingdan"></i>项目销售合同</a>
                            </li>
                        </shiro:hasAnyPermission>
                        <shiro:hasAnyPermission name="buycontract:query">
                            <li>
                                <i></i>
                                <a href="${ctx}/contract/dxlist.shtml"><i class="icon icon-icon2"></i>定向采购合同</a>
                            </li>
                        </shiro:hasAnyPermission>
                        <shiro:hasAnyPermission name="buymargincontract:query">
                            <li>
                                <i></i>
                                <a href="${ctx}/margincontract/buylist.shtml"><i class="icon icon-icon2"></i>现货采购合同</a>
                            </li>
                        </shiro:hasAnyPermission>
                        <shiro:hasAnyPermission name="salemargincontract:query">
                            <li>
                                <i></i>
                                <a href="${ctx}/margincontract/salelist.shtml"><i class="icon icon-icon2"></i>现货销售合同</a>
                            </li>
                        </shiro:hasAnyPermission>
                    </ul>
                </div>
            </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="projectsettle:query">
                <shiro:hasAnyPermission name="stock:query">
                    <div class="menu">
                        <div class="trade" data-flag="close">
                            <span class="icon icon-cangkuleixing"></span><strong>仓单管理</strong><i class="icon fr">&#xe626;</i>
                        </div>
                        <div class="left_middle none">
                            <ul>
                                <li>
                                    <i></i>
                                    <a href="${ctx}/zy/stock/list.shtml"><i class="icon icon-dingdan"></i>未挂牌仓单</a>
                                </li>
                                <li>
                                    <i></i>
                                    <a href="${ctx}/zy/saleresource/list.shtml"><i class="icon icon-cangkuleixing"></i>已挂牌仓单</a>
                                </li>
                                <li>
                                    <i></i>
                                    <a href="${ctx}/zy/marginstock/list.shtml"><i class="icon icon-cangkuleixing"></i>未挂牌资源</a>
                                </li>
                                <li>
                                    <i></i>
                                    <a href="${ctx}/zy/marginsaleresource/list.shtml"><i
                                            class="icon icon-cangkuleixing"></i>已挂牌资源</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </shiro:hasAnyPermission>
                <div class="menu">
                <div class="trade" data-flag="close">
                <span class="icon icon-ziyuan1"></span><strong>结算单管理</strong><i class="icon fr">&#xe626;</i>
                </div>
                <div class="left_middle none">
                <ul>
                    <li><i></i><a href="${ctx}/projectsettle/buy-index.shtml"><i class="icon icon-guanli1"></i>结算单管理</a></li>
                </ul>
                </div>
                </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="deliveryorderandind:query">

                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-fahuozaitu01" style="font-size: 20px"></span><strong>提货单管理</strong><i
                            class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <li>
                                <i></i>
                                <a href="${ctx}/deliveryorderandind/buy-list.shtml"><i class="icon icon-ziyuan3"
                                                                                       style="font-size: 14px"></i>提货单管理</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="ticket:open,ticket:receive">
            <div class="menu">
                <div class="trade" data-flag="close">
                    <span class="icon icon-shangcheng"></span><strong>发票管理</strong><i class="icon fr">&#xe626;</i>
                </div>
                <div class="left_middle none">
                    <ul>
                        <shiro:hasAnyPermission name="ticket:open">

                            <li>
                                <i class="layui-icon layui-icon-spread-left"></i>
                                <a href="${ctx}/ht/receiptInfo/list.shtml">开票管理</a>
                            </li>
                        </shiro:hasAnyPermission>
                        <shiro:hasAnyPermission name="ticket:receive">
                            <li>
                                <i class="layui-icon layui-icon-shrink-right"></i>
                                <a href="${ctx}/ht/receiptInfo/collectlist.shtml">收票管理</a>
                            </li>
                        </shiro:hasAnyPermission>
                    </ul>
                </div>
            </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="billpay:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-u60"></span><strong>收付款管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>

                            <li>
                                <i></i>
                                <a href="${ctx}/fund/billpay/buyBillPayList.shtml"><i
                                        class="layui-icon layui-icon-rmb"></i>我的付款单</a>
                            </li>


                            <li>
                                <i></i>
                                <a href="${ctx}/fund/billpay/saleBillPayList.shtml"><i
                                        class="layui-icon layui-icon-senior"></i>我的收款单</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <div class="menu">
                <div class="trade" data-flag="close">
                    <span class="icon icon-u60"></span><strong>店铺管理</strong><i class="icon fr">&#xe626;</i>
                </div>
                <div class="left_middle none">
                    <ul>
                        <li>
                            <a href="${ctx}/hy/membershopapply/baseinfo.shtml"><i class="layui-icon layui-icon-rmb"></i>基本信息</a>
                        </li>
                        <li>
                            <a href="${ctx}/hy/shopproduct/index.shtml"><i
                                    class="layui-icon layui-icon-rmb"></i>产品分类</a>
                        </li>
                        <li>
                            <a href="${ctx}/hy/membershopapply/shopdecorate.shtml"><i
                                    class="layui-icon layui-icon-rmb"></i>店铺装修</a>
                        </li>
                    </ul>
                </div>
            </div>
            <%}%>
            <!--供应链会员-->
            <%if (membertype == 2) {%>
            <shiro:hasAnyPermission name="project:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-dingdan"></span><strong>项目管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                                <%--<li>
                                    <i></i>
                                    <a href="${ctx}/project/index.shtml"><i class="icon icon-guanli2"></i>发起项目</a>
                                </li>--%>
                            <shiro:hasAnyPermission name="projectstock:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectstock/chain-list.shtml"><i
                                            class="icon icon-qiandai-zhanghu-zichan"></i>库存项目</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="projectadvance:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectadvance/chain-list.shtml"><i class="icon icon-jinrong"></i>预付项目</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="projectreceivable:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectreceivable/chain-list.shtml"><i
                                            class="icon icon-qiandai"></i>应收项目</a>
                                </li>
                            </shiro:hasAnyPermission>

                            <shiro:hasAnyPermission name="projectproxy:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectproxy/chain-list.shtml"><i class="icon icon-jinrongkeyuan"
                                                                                      style="font-size: 14px"></i>代理销售</a>
                                </li>
                            </shiro:hasAnyPermission>

                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>

            <shiro:hasAnyPermission name="contract:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-guanli1"></span><strong>合同管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <shiro:hasAnyPermission name="buycontract:query">

                                <li>
                                    <i></i>
                                    <a href="${ctx}/contract/buylist.shtml"><i class="icon icon-guanli"></i>项目采购合同</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="salecontract:query">

                                <li>
                                    <i></i>
                                    <a href="${ctx}/contract/salelist.shtml"><i class="icon icon-dingdan"></i>项目销售合同</a>
                                </li>

                                <li>
                                    <i></i>
                                    <a href="${ctx}/contract/gpsalelist.shtml"><i class="icon icon-icon2"></i>预销售订单</a>
                                </li>
                                <li>
                                    <i></i>
                                    <a href="${ctx}/contract/dxsalelist.shtml"><i class="icon icon-jinrongkeyuan"
                                                                                  style="font-size: 14px"></i>定向销售管理</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="buymargincontract:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/margincontract/buylist.shtml"><i class="icon icon-icon2"></i>现货采购合同</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="salemargincontract:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/margincontract/salelist.shtml"><i class="icon icon-icon2"></i>现货销售合同</a>
                                </li>
                            </shiro:hasAnyPermission>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
                <shiro:hasAnyPermission name="projectsettle:query">
                <div class="menu">
                <div class="trade" data-flag="close">
                <span class="icon icon-ziyuan1"></span><strong>结算单管理</strong><i class="icon fr">&#xe626;</i>
                </div>
                <div class="left_middle none">
                <ul>
                    <li><i></i><a href="${ctx}/projectsettle/chain-index.shtml"><i class="icon icon-guanli1"></i>结算单管理</a></li>
                </ul>
                </div>
                </div>
                </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="workflow:query,workflow:queryall,workflow:awitcheck">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-ziyuan1"></span><strong>审批管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <shiro:hasAnyPermission name="workflow:query,workflow:queryall">
                            <li>
                                <i></i>
                                <a href="${ctx}/wf/workflow/list.shtml"><i class="icon icon-guanli1"></i>工作流</a>
                            </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="workflow:awitcheck">
                            <li>
                                <i></i>
                                <a href="${ctx}/wf/workflow/awitcheck.shtml"><i
                                        class="icon icon-cangkuleixing"></i>待审核<%--<label>1</label>--%></a>
                            </li>
                            </shiro:hasAnyPermission>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="outandin:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-fahuozaitu01" style="font-size: 20px"></span><strong>出入库管理</strong><i
                            class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <shiro:hasAnyPermission name="stockinnotice:chain_query	">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/stockinnotice/chain-list.shtml"><i class="icon icon-fahuozaitu01"
                                                                                       style="font-size: 17px"></i>入库通知单</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="deliveryorderandind:query">

                                <li>
                                    <i></i>
                                    <a href="${ctx}/deliveryorderandind/sell-list.shtml"><i class="icon icon-ziyuan3"
                                                                                            style="font-size: 14px"></i>提货单管理</a>
                                </li>
                            </shiro:hasAnyPermission>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="stock:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-cangkuleixing"></span><strong>仓单管理</strong><i
                            class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <li>
                                <i></i>
                                <a href="${ctx}/zy/stock/list.shtml"><i class="icon icon-dingdan"></i>未挂牌仓单</a>
                            </li>
                            <li>
                                <i></i>
                                <a href="${ctx}/zy/saleresource/list.shtml"><i class="icon icon-cangkuleixing"></i>已挂牌仓单</a>
                            </li>
                            <li>
                                <i></i>
                                <a href="${ctx}/zy/marginstock/list.shtml"><i class="icon icon-cangkuleixing"></i>未挂牌资源</a>
                            </li>
                            <li>
                                <i></i>
                                <a href="${ctx}/zy/marginsaleresource/list.shtml"><i
                                        class="icon icon-cangkuleixing"></i>已挂牌资源</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="ticket:open,ticket:receive">
            <div class="menu">
                <div class="trade" data-flag="close">
                    <span class="icon icon-shangcheng"></span><strong>发票管理</strong><i class="icon fr">&#xe626;</i>
                </div>
                <div class="left_middle none">
                    <ul>
                        <shiro:hasAnyPermission name="ticket:open">
                            <li>
                                <i class="layui-icon layui-icon-spread-left"></i>
                                <a href="${ctx}/ht/receiptInfo/list.shtml">开票管理</a>
                            </li>
                        </shiro:hasAnyPermission>
                        <shiro:hasAnyPermission name="ticket:receive">

                            <li>
                                <i class="layui-icon layui-icon-shrink-right"></i>
                                <a href="${ctx}/ht/receiptInfo/collectlist.shtml">收票管理</a>
                            </li>
                        </shiro:hasAnyPermission>
                    </ul>
                </div>
            </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="billpay:query">

                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-u60"></span><strong>收付款管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <li>
                                <a href="${ctx}/fund/billpay/buyBillPayList.shtml"><i
                                        class="layui-icon layui-icon-rmb"></i>我的付款单</a>
                            </li>
                            <li>

                                <a href="${ctx}/fund/billpay/saleBillPayList.shtml"><i
                                        class="layui-icon layui-icon-senior"></i>我的收款单</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <shiro:hasAnyPermission name="repaymentplan:query">
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-u60"></span><strong>预警中心</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <li><a href="${ctx}/repaymentplan/warn-list.shtml"><i class="layui-icon layui-icon-rmb"></i>待还款预警</a></li>
                            <li><a href="${ctx}/overduebill/list.shtml"><i class="layui-icon layui-icon-rmb"></i>逾期单</a></li>
                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <%--<shiro:hasAnyPermission name="report:query">--%>
                <div class="menu">
                    <div class="trade" data-flag="close">
                        <span class="icon icon-u60"></span><strong>报表管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none">
                        <ul>
                            <li>
                                <a href="${ctx}/report/contractreport/list.shtml"><i class="layui-icon layui-icon-rmb"></i>财务报表</a>
                            </li>
                        </ul>
                    </div>
                </div>
            <%--</shiro:hasAnyPermission>--%>
            <%}%>
                <%--资方--%>
            <%if (membertype == 3) {%>
            <shiro:hasAnyPermission name="project:query">
                <div class="menu">
                    <div class="trade" data-flag="open">
                        <span class="icon icon-dingdan"></span><strong>贷款管理</strong><i class="icon fr">&#xe626;</i>
                    </div>
                    <div class="left_middle none" style="display: block">
                        <ul>
                            <shiro:hasAnyPermission name="projectstock:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectstock/chain-list.shtml"><i
                                            class="icon icon-qiandai-zhanghu-zichan"></i>库存融资项目</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="projectadvance:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectadvance/chain-list.shtml"><i class="icon icon-jinrong"></i>预付融资项目</a>
                                </li>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="projectproxy:query">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/projectproxy/chain-list.shtml"><i class="icon icon-jinrongkeyuan"
                                                                                      style="font-size: 14px"></i>代理融资项目</a>
                                </li>
                            </shiro:hasAnyPermission>

                        </ul>
                    </div>
                </div>
            </shiro:hasAnyPermission>
            <%}%>
            <div class="menu" style="border-bottom:none;">
                <div class="trade" data-flag="close">
                    <span class="icon icon-ren"></span><strong>会员信息</strong><i class="icon fr">&#xe626;</i>
                </div>

                <div class="left_middle none">
                    <ul>
                            <%-- <li><i class="iconfont">&#xe608;</i><a
                                href="${ctx}/index.shtml">会员中心</a></li> --%>
                        <li>
                            <i></i>
                            <a href="${ctx}/hy/member/authapply.shtml"><i class="icon icon-guanli"></i>会员认证</a></li>

                        <li>
                            <i></i>
                            <a href="${ctx}/hy/user/modifysmobile.shtml"><i class="icon icon-mima"></i>修改手机号</a></li>
                        <li>
                            <i></i>
                            <a href="${ctx}/hy/user/list.shtml"><i class="icon icon-ren"></i>员工账号</a></li>

                        <li>
                            <i></i>
                            <a href="${ctx}/hy/user/gopassword.shtml"><i class="icon icon-mima"></i>登录密码</a></li>

                        <shiro:hasPermission name="contract:sign">
                            <li><i></i><a href="${ctx}/hy/member/qmacount.shtml"><i class="icon icon-mima"></i>上上签账户</a>
                            </li>
                        </shiro:hasPermission>


                            <%--<shiro:hasPermission name="user:tradepassword">
                                <li>
                                    <i></i>
                                    <a href="${ctx}/hy/user/gotradepassword.shtml"><i class="icon icon-mima"></i>交易密码</a></li>
                            </shiro:hasPermission>--%>


                            <%--<shiro:hasPermission name="message:query">--%>

                            <%--<li>--%>
                            <%--<i></i>--%>
                            <%--<a href="${ctx}/hy/message/list.shtml"><i class="icon icon-xinxi1"></i>站内信息</a></li>--%>
                            <%--</shiro:hasPermission>--%>

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
    <%--<jsp:include page="page/_office_bottom.jsp"/>--%>
    <%if (membertype == 1 && authtype == 20) {%>
    <div class="w">
        <div class="reg-ban">
            <img src="${ctx}/images/page/duo.png" class="top10">
        </div>
    </div>
    <div class="w">
        <div id="footer-2014">
            <div class="copyright">
                <img src="${ctx}/images/page/56a0a994Nf1b662dc.png">&nbsp;&nbsp;© 2018 meiliangzi.cn 陕ICP备10000586号-2&nbsp;&nbsp;
            </div>

            <div class="authentication">
                <img width="103" height="32" alt="经营性网站备案中心" src="${ctx}/images/page/54b8871eNa9a7067e.png"
                     class="err-product">
                <img border="true" width="103" height="32" onclick="CNNIC_change('urlknet')"
                     oncontextmenu="return false;" name="CNNIC_seal" alt="可信网站"
                     src="${ctx}/images/page/54b8872dNe37a9860.png" class="err-product">
                <img width="103" height="32" alt="网络警察" src="${ctx}/images/page/56a89b8fNfbaade9a.jpg"
                     class="err-product">
                <img width="103" height="32" src="${ctx}/images/page/54b8875fNad1e0c4c.png" class="err-product">
                <img width="103" height="32" src="${ctx}/images/page/5698dc03N23f2e3b8.jpg">
                <img width="103" height="32" src="${ctx}/images/page/5698dc16Nb2ab99df.jpg">
            </div>
        </div>
    </div>
    <%}%>

</shiro:hasRole>
<shiro:lacksRole name="user">
    <script type="text/javascript">
        window.location.href = '${ctx}/login.html';
    </script>
</shiro:lacksRole>
<div id="forformsubmit" style="display: none;"></div>
<form id="searchResourceForm" action="${ctx}/resource.html" style="display: none;" method="post"></form>
</body>
</html>
