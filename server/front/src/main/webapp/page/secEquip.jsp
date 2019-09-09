<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mw" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="data-spm" content=""/>
    <title>煤亮子--二手设备</title>
    <script type="text/javascript" src="${ctx}/js/jquery-scroll/scroll.js"></script>
    <style>
        body {
            background: #f2f2f2
        }
        .layout-top {
            background: #fff;
        }
        #guessyou ul {
            padding-top: 0 !important;
        }

        #guessyou li {
            width: 232px !important;
            padding-bottom: 48px !important;
            margin-bottom: 10px !important;
            background: #fff !important;
            margin-right: 10px !important;
        }

        #guessyou li:nth-child(5) {
            margin-right: 0 !important;
        }

        #guessyou .list1 {
            border: none !important;
        }
        #guessyou li{
            padding-bottom: 20px!important;
            position:relative ;
        }
        #guessyou .p-img{
            margin-top: 10px;
        }
        /*#guessyou li .tags{*/
            /*position: absolute;*/
            /*right: 10px;*/
            /*top:10px;*/
            /*padding: 3px 5px;*/
            /*font-size: 12px;*/
            /*color: #fff;*/
            /*background: #4A8BED;*/
            /*border-radius: 3px;*/
        /*}*/
        /*#guessyou li .tags.else{*/
            /*background: #F8AF37;*/
        /*}*/
        #guessyou li .biaoqian .tagss{
            display: inline-block;
            background-color: #f00;
            color: #fff;
            line-height: 16px;
            padding: 0px 5px;
            margin-right: 15px;
            margin-bottom:10px;
        }
        #guessyou .p-info {
            padding: 0 15px!important;
        }
        #guessyou .p-price span{
            font-size: 13px;
            color: #E4393C;
            width: 60%;
            float: left;
        }
        #guessyou .p-price span.num{
            width: 40%;
        }
        #guessyou .p-price span text{
            color:#999
        }
        #guessyou .p-img{
            /*margin-top: 0!important;*/
        }
        #guessyou .p-img .img{
            width: 90% !important;
            height: 200px!important;
        }
        .dd-inner{
            display: none!important;
        }
    </style>
    <script>

        $(function () {
            $(".trondition .tro-list button").click(function () {
                if($(this).hasClass('open')){
                    $(this).removeClass('open');
                    $(this).html("展开");
                    $(this).parents('.tro-list').find("ul").css({"height":"50px"});
                }
                else{
                    $(this).addClass('open');
                    $(this).html("收起");
                    $(this).parents('.tro-list').find("ul").css({"height":"auto"});
                }

            });

            $('#qiugou').myScroll({
                speed: 50, //数值越大，速度越慢
                rowHeight: 26 //li的高度
            });


        });

        function searcher(where,val) {
            var elemen = $("input[name='" + where + "']");
            if ($(elemen).length > 0) {
                $(elemen).val(val);
            }else{
                $("#mainForm").append("<input name='"+where+"' value='"+val+"' hidden />");
            }
            $("#mainForm").submit();
        };
    </script>
</head>
<body>
<div class="w">
    <form id="mainForm" action="${ctx}/zy/secequip/secEquip.html" method="post">
        <input type="hidden" id="pageNo" name="pageNo" value="0" />

        <input name="search_eq_ioldtype" value="${search_eq_ioldtype}" hidden>
        <input name="search_like_scategoryname" value="${search_like_scategoryname}" hidden>
        <input name="search_like_sspec" value="${search_like_sspec}" hidden>
    </form>
    <div class="sec-ban">
        <div class="window clearfix">
            <div class="window-le">
                <div class="tit">我要卖设备<label>></label></div>
                <%--<div class="sear">--%>
                    <%--<input placeholder="品牌/设备名称/规格型号"/>--%>
                    <%--<button><i class="icon icon-faxian1"></i></button>--%>
                <%--</div>--%>
                <div class="trondition">
                    <div class="tro-list">
                        <label>方式</label>
                        <ul class="clearfix">
                            <li><a <c:if test="${search_eq_ioldtype eq 20}">style="color: red"</c:if> onclick="searcher('search_eq_ioldtype',20)">出售</a></li>
                            <li><a <c:if test="${search_eq_ioldtype eq 10}">style="color: red"</c:if> onclick="searcher('search_eq_ioldtype',10)">出租</a></li>
                        </ul>
                        <span onclick="location.replace(location.href);">重置</span>
                    </div>
                    <div class="tro-list">
                        <label>分类</label>
                        <ul class="clearfix">
                            <c:forEach items="${categories}" var="category">
                                <li><a <c:if test="${search_like_scategoryname eq category}">style="color: red"</c:if>  onclick="searcher('search_like_scategoryname','${category}')">${category}</a></li>
                            </c:forEach>
                        </ul>
                        <button>展开</button>
                    </div>
                    <div class="tro-list else">
                        <label>型号</label>
                        <ul class="clearfix">
                            <c:forEach items="${sspec}" var="spec">
                                <li><a  <c:if test="${search_like_sspec eq spec}">style="color: red"</c:if> onclick="searcher('search_like_sspec','${spec}')">${spec}</a></li>
                            </c:forEach>
                        </ul>
                        <button>展开</button>
                    </div>
                </div>
            </div>
            <div class="window-rg">
                <div class="tit">业务操作<label>></label></div>
                <div class="window-btn">
                    <%--<a href="${ctx}/zy/secequip/文字滚屏.html" class="btn1" id="btn1">我要出售</a>--%>
                    <a href="${ctx}/zy/secequip/add.html?type=20" class="btn1">我要出售</a>
                </div>
                <div class="window-btn">
                    <a href="${ctx}/zy/secequip/add.html?type=10" class="btn2">我要出租</a>
                </div>
                <%--<div class="window-btn">--%>
                    <%--<a class="btn3" id="btn3">设备求租</a>--%>
                <%--</div>--%>
                <%--<div class="window-btn">--%>
                    <%--<a class="btn3" id="btn4">设备求售</a>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>

</div>
<div class="w">
    <div class="sec-infor">
        <a class="more" href="${ctx}/zy/secequip/secEquipBuy.html">更多></a>
        <div class="tit">信息<br/>专栏</div>
        <div class="infor-group">

            <div id="qiugou" class="notice">
                <ul>
                    <c:forEach items="${zhuanlans}" var="obj">
                        <li><a href="${ctx}/zy/secequip/secequipbuy_view.html?id=${obj.id}"><label><resource:SecondEquipType val="${obj.ioldtype}"/></label>${obj.stitle}<span><mw:format label="date" value="${obj.dadddate}"/></span></a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="w">
    <div class="sec-list">
        <div class="tit">热销二手设备<%--<a>查看更多<font>></font></a>--%></div>
    </div>
    <div id="guessyou">
        <div class="list1" id="indentureContent">
            <ul>
                <c:forEach items="${list.content}" var="obj">
                    <li class="fore1">


                        <a href="${ctx}/zy/secequip/secequipbuy_view.html?id=${obj.id}" target="_blank">
                            <div class="p-img">
                                <img class="img" width="100%" src="<cs:SysParaType imgurl="1" op="syspara"/>/${obj.simage}" >
                            </div>
                            <div class="p-info">
                                <div class="p-name">
                                        ${obj.stitle}&nbsp;&nbsp;${obj.sspec}
                                </div>
                                <div class="biaoqian">
                                    <c:choose>
                                        <c:when test="${obj.ioldtype eq 60}">
                                            <label class="tagss ">出售</label><label class="tagss else">出租</label>
                                        </c:when>
                                        <c:when test="${obj.ioldtype eq 10}">
                                            <label class="tagss else">出租</label>
                                        </c:when>
                                        <c:otherwise>
                                            <label class="tagss ">出售</label>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div class="p-price clearfix">
                                    <c:choose>
                                        <c:when test="${empty obj.fprice or obj.fprice eq 0}">
                                            <span><label>价格：</label>价格面议</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>
                                                <label>价格：</label><i>¥</i><mw:format label="money" value="${obj.fprice}"/><label>元</label>
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="num"><label>数量：</label>${obj.inumber}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>
    <div class="mpage top30">
        <mw:page pageobj="list" />
    </div>
</div>

</body>
</html>
