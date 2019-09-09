<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mw" uri="http://www.frogsing.com/tags/frogsing" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="data-spm" content=""/>
    <title>煤亮子--二手设备</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
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
        }
        #guessyou .p-img{
            margin-top: 10px;
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
    <form id="mainForm" action="${ctx}/zy/secequip/secEquipBuy.html" method="post">
        <input type="hidden" id="pageNo" name="pageNo" value="0" />

        <input name="search_eq_ioldtype" value="${search_eq_ioldtype}" hidden>
        <input name="search_like_scategoryname" value="${search_like_scategoryname}" hidden>
        <input name="search_like_sspec" value="${search_like_sspec}" hidden>

    </form>
    <div class="sec-ban">
        <div class="window clearfix">
            <div class="window-le">
                <div class="tit">我要买设备<label>></label></div>
                <%--<div class="sear">--%>
                <%--<input placeholder="品牌/设备名称/规格型号"/>--%>
                <%--<button><i class="icon icon-faxian1"></i></button>--%>
                <%--</div>--%>
                <div class="trondition">
                    <div class="tro-list">
                        <label>方式</label>
                        <ul class="clearfix">
                            <li><a <c:if test="${search_eq_ioldtype eq 40}">style="color: red"</c:if> onclick="searcher('search_eq_ioldtype',40)">求购</a></li>
                            <li><a <c:if test="${search_eq_ioldtype eq 30}">style="color: red"</c:if> onclick="searcher('search_eq_ioldtype',30)">求租</a></li>
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
                    <a class="btn1" href="${ctx}/zy/secequip/add.html?type=40">我要求购</a>
                </div>
                <div class="window-btn">
                    <a class="btn2" href="${ctx}/zy/secequip/add.html?type=30">我要求租</a>
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

<div class="addMall mei-view-le">
    <div class="w clearfix">

        <div class="view-rg" style="width: 100%">
            <div class="sec-list" style="margin: 0">
                <div class="tit" style="">求租购列表<a href="${ctx}/zy/secequip/secEquip.html" style="font-size: 14px;color:#d0111b">发布求租求购</a></div>
            </div>
            <div class="cp-list" style="margin-top: 0">
                <c:forEach items="${list.content}" var="obj">
                    <div class="secList">
                        <div class="sec-name">
                            <c:choose>
                                <c:when test="${obj.ioldtype eq 50}">
                                    <span>求购</span><span class="else">求租</span>
                                </c:when>
                                <c:when test="${obj.ioldtype eq 40}">
                                    <span>求购</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="else">求租</span>
                                </c:otherwise>
                            </c:choose>
                            ${obj.stitle}</div>
                        <div class="sec-detial clearfix">
                            <div class="sec-no"><label>型号:</label>${obj.sspec}</div>
                            <div class="sec-text"><label>技术要求:</label>${obj.srequirements}</div>
                            <div class="sec-num"><label>${obj.inumber}</label>${obj.sunit}</div>
                            <div class="sec-date"><mw:format label="date" value="${obj.dadddate}"/></div>
                            <div class="sec-more"><a target="_blank" href="${ctx}/zy/secequip/secequipbuy_view.html?id=${obj.id}">查看详情</a></div>
                        </div>
                    </div>
                </c:forEach>
                <div class="mpage top30">
                    <mw:page pageobj="list" />
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
