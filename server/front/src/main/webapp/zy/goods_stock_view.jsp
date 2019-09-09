<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>煤亮子-商品详情</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style>
        .view-content th,.view-content td{
            text-align: center;
            padding: 5px 2px!important;
        }
        .addDiff{
            width: 750px;
            margin: 0 auto
        }
        .addDiff .yn-list{
            width: 49%;
            display: inline-block!important;
            font-size: 14px;
            padding-left: 135px;
            box-sizing: border-box;
            position: relative;
            vertical-align: top;
        }
        .addDiff .yn-list label{
            position: absolute;
            left:0;
            top:0;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".mei-view-le .view-rg .view-tab ul li").click(function () {
                var index = $(this).index();
                $(this).addClass('cur').siblings().removeClass('cur');
                $('.mei-view-le .view-rg .view-content .detial').removeClass('display');
                $('.mei-view-le .view-rg .view-content .detial').eq(index).addClass('display');
            });
            $("#btn-talk").click(function () {
                window.open('http://webchat.b.qq.com/webchat.htm?sid=2188z8p8p8q808z8R8z8z', 'newwindow', 'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no') //这句要写成一行                          return false;
                return false;
            });

            if (${obj.fprice == 0}) {
                $("#amount").prop("readonly", "readonly");
                $("#add,#de").css("pointer-events", "none");
                $("#byBuyer,#addCart").prop("disabled", "disabled");
            };
            // 产品详情里表格设置
            $(".detial table").attr({"border":"1","align":"center"})
        });
        //生成合同
        function contractByBuyer(saleresourceid, thisObj,favailableweight) {
            if (parseInt(favailableweight) == 0 || parseInt(favailableweight) < 0){
                layer.msg("库存不足，不能购买");
                return;
            }
            $.post("${ctx}/sp/commodity/addcart.json", {'saleresourceid': saleresourceid}, function (result) {
                if (result.success) {
                    var iamount = $("#amount").val();
                    if (iamount == null || iamount == "")
                        $("#amount").val(1);//默认购买件数为1
                    window.location.href = "${ctx}/zy/marginstock/buybalance.shtml?stockid=" + saleresourceid + "&iavailablepackage=" + $("#amount").val();
                } else {
                    layer.msg(result.msg);
                }
            });

        }
        //增加 1
        function addPackage(iavailablepackage) {
            var iamount = new Number($("#amount").val());
            if (iamount < iavailablepackage) {
                $("#amount").val(iamount + 1);
            } else
                return;
        }
        //减少 1
        function subPackage(iavailablepackage) {
            var iamount = new Number($("#amount").val());
            if (iamount > 1) {
                $("#amount").val(iamount - 1);
            } else
                return;
        }

        //判断输入的购买件数是否大于可用件数
        function Calculation(thisObj, favailableweight) {
            //可用重量  favailableweight
            var buypackage = $(thisObj).val();
            if (buypackage != null && buypackage != "") {
                if (parseInt(buypackage) > parseInt(favailableweight))
                    $(thisObj).val(parseInt(favailableweight));
                else if (parseInt(buypackage) < 1)
                    $(thisObj).val(1);
            } else
                $(thisObj).val(1);
        }
        /**
         * 进入店铺
         */
        function enterShop(id) {
            $.post("${ctx}/hy/member/bisopenshop.json", {'id': id}, function (result) {
                if (result.success) {
                    window.location.href = "${ctx}/shop.html?id=" + result.obj;
                } else {
                    layer.msg(result.msg);
                }
            });
        }
    </script>
</head>
<body>
<div class="mei-view">
    <div class="mycon">
        <sys:message content="${message}"/>
        <div class="address">当前位置：首页 » 商品详情 » ${obj.scommodityname}</div>
        <div class="right-extra">
            <div class="clearfix">
                <div id="preview" class="spec-preview left">
                    <span class="jqzoom"><img jqimg="${obj.stinypic}" src="${obj.stinypic}"/></span>
                </div>
                <div class="goods-mid left">
                    <div class="Pro_title bottom10">
                        <h2><img class="resource" src="${ctx}/images/metriel.png">${obj.scommodityname}</h2>
                    </div>
                    <div class="Pro_bot">
                        <div class="Pro_infor">
                            <div class="Pro_list">
                                <label>促销价：</label>
                                <c:choose>
                                    <c:when test="${obj.fprice eq 0}"><span>价格面议</span></c:when>
                                    <c:otherwise><span>¥&nbsp;<mw:format label="money" value="${obj.fprice}"/></span>元／${obj.sweightunit}</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="Pro_list">
                                <label>合作商家：</label>
                                <c:choose><c:when test="${obj.imembertype eq 2}">煤亮子商城</c:when><c:otherwise>${obj.smembername}</c:otherwise></c:choose>
                            </div>
                        </div>
                        <div class="Pro_inforjg">
                            <div class="Pro_list">
                                <i>规格参数：</i>${obj.sspec}
                            </div>
                            <div class="Pro_list">
                                <i>生产厂商：</i>${obj.sproducer}
                            </div>
                            <div class="Pro_list">
                                <i>库&nbsp;&nbsp;存&nbsp;&nbsp;量：</i>${jj:weight(obj.fstockweight)}${obj.sweightunit}
                            </div>
                            <div class="Pro_list">
                                <i>交货周期：</i>${obj.ideliverydays}&nbsp;&nbsp;天
                            </div>
                        </div>
                        <div class="view-btn" id="contractByBuyer">
                            <span>
                                <input type="text" value="1" size="6" class="cc_inp" id="amount" onkeyup="Calculation(this,'${obj.favailableweight}')">
                                <a id="add" class="add" onclick="addPackage('${obj.favailableweight}')">+</a>
                                <a id="de" class="de" onclick="subPackage('${obj.favailableweight}')">-</a>
                            </span>
                            <button id="byBuyer" class="buy" onclick="contractByBuyer('${obj.id}',this,'${obj.favailableweight}')" style="background: #ffeded;color: #e73426">
                                立即购买
                            </button>
                            <c:if test="${bisopen == '1'}"><button id="enterShop" class="buy" onclick="enterShop('${obj.smemberid}')">进入店铺</button></c:if>
                        </div>
                    </div>
                </div>
                <div class="plat right">
                    <div class="Pro_merchant">
                        <div class="Pro_sj"><img src="${ctx}/images/xq-tit-img.png"/></div>
                        <div class="Pro_form">
                            <h2><i class="icon icon-telepphone right5 left10"></i>400-086-0101</h2>
                            <label></label>
                            <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=87967450&site=qq&menu=yes"><h3><img
                                    src="${ctx}/images/qq-chat1.png"/>在线咨询</h3></a>
                            <p><img src="${ctx}/images/xq-rg-icon1.png"/>物资齐全，技术全面</p>
                            <p><img src="${ctx}/images/xq-rg-icon2.png"/>实时响应，高效快捷</p>
                            <p><img src="${ctx}/images/xq-rg-icon3.png"/>诚信合作，精益服务</p>
                            <p><img src="${ctx}/images/xq-rg-icon4.png"/>省时省心，畅选无忧</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-ban top10">
            <img src="${ctx}/images/view-ban-img.jpg"/>
        </div>
        <div class="mei-view-le">
            <div class="mycon clearfix">
                <div class="view-le left">
                    <h2>热门产品</h2>
                    <div class="Product_hot">
                        <c:forEach items="${list}" var="hotobj">
                            <a href="${ctx}/zy/marginstock/goods_stock_view.html?id=${hotobj.id}&iresource=${hotobj.iresource}" target="_blank">
                                <div class="L_hot_list">
                                    <img src="${hotobj.stinypic}">
                                    <div class="L_hot_a">${hotobj.scommodityname}</div>
                                    <div class="p-price"><c:choose><c:when
                                            test="${hotobj.fprice eq 0}">价格面议</c:when><c:otherwise><i>¥</i><mw:format
                                            label="money"
                                            value="${hotobj.fprice}"/></c:otherwise></c:choose>
                                    </div>
                                  <%--   <c:if test="${hotobj.igoodstype eq 0}">
                                    <a href="${hotobj.sremark}" target="_blank"><img class="view-icon"
                                                                                     src="${ctx}/images/view-icon.png"></a>
                                     </c:if>--%>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <div class="view-rg right">
                    <div class="view-tab">
                        <ul class="clearfix">
                            <li class="cur">商品详情</li>
                        </ul>
                    </div>
                    <div class="view-content">
                        <div class="detial display">
                            <%--<table align="center" border="1" cellpadding="0" cellspacing="0" style="width:98%;margin: 20px auto">--%>
                                <%--<thead>--%>
                                    <%--<tr>--%>
                                        <%--<th colspan="7">产品参数</th>--%>
                                    <%--</tr>--%>
                                <%--</thead>--%>
                                <%--<tbody>--%>
                                    <%--<c:forEach items="${commodity.prodattr}" var="obj">--%>
                                        <%--<tr>--%>
                                            <%--<td colspan="3">${obj.attrName}：${obj.attrValue}</td>--%>
                                            <%--<td colspan="3">${obj.attrName}：${obj.attrValue}</td>--%>
                                        <%--</tr>--%>
                                    <%--</c:forEach>--%>
                                <%--</tbody>--%>
                            <%--</table>--%>
                            <c:if test="${not empty commodity.prodattr}">
                                <c:if test="${obj.iresource == 1 || obj.iresource == 2 || obj.iresource == 3}">
                                    <div class="yanan addDiff">
                                        <div style="color:#333;font-size: 22px;padding: 10px 0;margin-bottom: 20px">产品参数</div>
                                        <c:forEach items="${commodity.prodattr}" var="obj">
                                            <div class="yn-list" title="${obj.attrValue}">
                                                <label><i class="icon icon-details none"></i>${obj.attrName}：</label>
                                                ${obj.attrValue}
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </c:if>
                            <c:if test="${empty commodity.sdescription}">
                                <div class="yanan addDiff">
                                    <div style="color:#333;font-size: 22px;padding: 10px 0;margin-bottom: 20px">产品参数</div>
                                    <div class="yn-list" title="${commodity.sname}">
                                        <label><i class="icon icon-details none"></i>名称：</label>
                                        ${commodity.sname}
                                    </div>
                                    <div class="yn-list" title="${commodity.sspec}">
                                        <label><i class="icon icon-details none"></i>规格型号/件号：</label>
                                        ${commodity.sspec}
                                    </div>
                                    <div class="yn-list" title="${commodity.sproducer}">
                                        <label><i class="icon icon-details none"></i>生产厂家：</label>
                                        ${commodity.sproducer}
                                    </div>

                                    <div class="yn-list" title="${hostname}">
                                        <label><i class="icon icon-details none"></i>所属设备：</label>
                                        ${hostname}
                                    </div>
                                    <div class="yn-list" title="${hostbrand}">
                                        <label><i class="icon icon-details none"></i>所属设备厂商：</label>
                                        ${hostbrand}
                                    </div>
                                    <div class="yn-list" title="${hostmodel}">
                                        <label><i class="icon icon-details none"></i>所属设备型号：</label>
                                        ${hostmodel}
                                    </div>
                                    <div class="yn-list" title="${shostpart}">
                                        <label><i class="icon icon-details none"></i>所属设备部件：</label>
                                        ${shostpart}
                                    </div>

                                    <c:if test="${not empty technical}">
                                        <div class="yn-list" title="${technical}">
                                            <label><i class="icon icon-details none"></i>技术参数：</label>
                                            ${technical}
                                        </div>
                                    </c:if>

                                </div>
                            </c:if>
                            ${commodity.sdescription}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
