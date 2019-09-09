<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>煤亮子-商品详情</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style type="text/css">
        .Pro_list{
            overflow: visible;
        }
        .Pro_list > span.shop{
            color: #ff0000;
            margin-left: 10px;
            font-size: 14px;
            cursor: pointer;
            font-weight: bold;
            colot: black;
            border: 1px solid;
            padding: 6px 10px;
            border-radius: 15px;
        }
        .Pro_list > span.shop:before{
            font-size: 15px;
            margin-right: 3px;
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
    </style>
    <script type="text/javascript">
        var isAuthenticated = ${isAuthenticated};
        var isAuthtype = ${isAuthtype};
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
            }
        });

        //挂牌生成销售合同
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
                    window.location.href = "${ctx}/zy/stock/buybalance.shtml?saleresourceid=" + saleresourceid + "&iavailablepackage=" + parseInt($("#amount").val());
                } else {
                    layer.msg(result.msg);
                }
            });

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
        //加入购物车
        function addCart(saleresourceid, thisObj,favailableweight) {
            if (parseInt(favailableweight) == 0 || parseInt(favailableweight) < 0){
                layer.msg("库存不足，不能加入购物车");
                return;
            }
            if (!isAuthenticated)
                window.location.href = "${ctx}/login.html";
            else {
                if (!isAuthtype)
                    layer.msg("请先进行企业认证");
                else {
                    $.post("${ctx}/zy/cart/addcart.json", {
                        'saleresourceid': saleresourceid,
                        'ibuycount': $("#amount").val()
                    }, function (result) {
                        if (result.success) {
                            $("#addcart").text(parseInt(result.obj));
                            layer.open({
                                type: 1 //Page层类型
                                ,
                                area: ['500px', '200px']
                                ,
                                title: '温馨提示'
                                ,
                                shade: 0.6 //遮罩透明度
                                ,
                                maxmin: false //允许全屏最小化
                                ,
                                anim: 1 //0-6的动画形式，-1不开启
                                ,
                                content: '<div style="padding:50px;font-size: 14px;">商品已成功加入购物车！<a href="${ctx}/zy/cart/addcart.shtml" style="color: #f10214;">去购物车结算></a></div>'
                            });
                        } else {
                            layer.msg(result.msg);
                        }
                    });
                }
            }
        }
        //增加 1
        function addPackage(iavailablepackage) {
            var iamount = parseInt($("#amount").val());
            if (iamount < iavailablepackage) {
                $("#amount").val(iamount + 1);
            } else
                return;
        }
        //减少 1
        function subPackage(iavailablepackage) {
            var iamount = parseInt($("#amount").val());
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

        function camera(id) {
            //var id=$(this).data("id");
            layer.open({
                type: 2,
                title: '在线监控查看',
                shadeClose: true,
                shade: 0.8,
                offset: 'auto',
                area: ['80%', '80%'],
                content: '${ctx}/wms/warehouse/cameralist.html?storeid=' + id //iframe的url
            });
        }
    </script>
</head>
<body>
<div class="mei-view">
    <div class="mycon">
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
                                <label>促销价：</label><c:choose><c:when
                                    test="${obj.fprice eq 0}"><span>价格面议</span></c:when><c:otherwise><span>¥&nbsp;<mw:format
                                    label="money"
                                    value="${obj.fprice}"/></span>元／件</c:otherwise></c:choose>
                            </div>
                            <div class="Pro_list">
                                <label>合作商家：</label>
                                <c:choose><c:when test="${obj.imembertype eq 2}">煤亮子商城</c:when><c:otherwise>${obj.smembername}</c:otherwise></c:choose>
                                <%--<c:choose>--%>
                                    <%--<c:when test="${bisopen eq 1}">--%>
                                        <%--<em onclick="enterShop('${obj.sownerid}')">${obj.sownername}</em>--%>
                                        <%--<span class="icon icon-shangcheng shop" onclick="enterShop('${obj.sownerid}')">进店逛逛</span>--%>
                                    <%--</c:when>--%>
                                    <%--<c:otherwise>--%>
                                        <%--${obj.sownername}--%>
                                    <%--</c:otherwise>--%>
                                <%--</c:choose>--%>
                            </div>


                            <c:if test="${obj.bisauth == 1}">
                                <div class="Pro_list">
                                    <label>验证：</label>
                                    <span style="font-size: 12px;"><img class="lamp" width="18"
                                                                        src="${ctx}/images/lamp-green.png"
                                                                        title="煤亮子已对该商品认证审核"/>已认证</span>
                                </div>
                            </c:if>
                        </div>
                        <div class="Pro_inforjg">
                            <div class="Pro_list">
                                <i>规格参数：</i>${obj.sspec}
                            </div>

                            <div class="Pro_list">
                                <i>生产厂商：</i>${obj.sproducer}
                            </div>
                            <div class="Pro_list">
                                <i>库&nbsp;&nbsp;存&nbsp;&nbsp;量：</i>${jj:weight(obj.favailableweight)}${obj.sweightunit}
                            </div>
                            <div class="Pro_list">
                                <i>交货周期：</i>
                                <c:choose>
                                    <c:when test="${obj.ispottype eq 0}">
                                        24小时
                                    </c:when>
                                    <c:otherwise>
                                        ${obj.ideliverydays}&nbsp;&nbsp;天
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div class="Pro_list">
                                <i>新货/二手：</i>新货
                            </div>
                            <div class="Pro_list">
                                <i>仓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库：</i>
                                <c:choose>
                                    <c:when test="${obj.ispottype eq 0}">
                                        神木1号库
                                    </c:when>
                                    <c:otherwise>
                                        云仓
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <c:forEach items="${commodity.attr.extendList}" var="sublist">
                                <div class="Pro_list">
                                    <i>${sublist.key}：</i>${sublist.value}
                                </div>
                            </c:forEach>
                            <c:if test="${obj.ispottype  eq 0}">
                                <div class="Pro_list">
                                <i>监&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;控：</i>
                                 <a href="javascript:camera('${obj.sstockno}');" class="view-icon"><img class="lamp"  width="18" src="${ctx}/images/view-icon.png"/>产品状态实时查看>></a>
                                </div>
                            </c:if>
                        </div>
                        <div class="view-btn" id="contractByBuyer">
                            <span>
                                <input type="text" value="1" size="6" class="cc_inp" id="amount"
                                       onblur="this.value=this.value.replace(/^0/g,'')"
                                       onkeyup="this.value=this.value.replace(/\D/g,'');Calculation(this,'${obj.favailableweight}')">
                                <a id="add" class="add" onclick="addPackage('${obj.favailableweight}')">+</a>
                                <a id="de" class="de" onclick="subPackage('${obj.favailableweight}')">-</a>
                            </span>
                            <button id="byBuyer" class="buy" style="background: #ffeded;color: #e73426" onclick="contractByBuyer('${obj.ssalesourceid}',this,'${obj.favailableweight}')">
                                立即购买
                            </button>
                            <button id="addCart" class="buy" onclick="addCart('${obj.ssalesourceid}',this,'${obj.favailableweight}')">加入购物车
                            </button>
                            <%--<button id="enterShop" class="buy" onclick="enterShop('${obj.sownerid}')">进店逛逛</button>--%>
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
            <!--缩图开始-->
            <%--<div class="spec-scroll clearfix"> <a class="prev">&lt;</a> <a class="next">&gt;</a>--%>
            <%--<div class="items">--%>
            <%--<ul>--%>
            <%--<c:forEach items="${obj.commodityImgs}" var="imgobj">--%>
            <%--<li><img bimg="${imgobj.surl}" src="${imgobj.surl}" onmousemove="preview(this);"></li>--%>
            <%--</c:forEach>--%>
            <%--</ul>--%>
            <%--</div>--%>
            <%--</div>--%>
            <!--缩图结束-->
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
                            <a href="${ctx}/zy/stock/goods_view.html?id=${hotobj.ssalesourceid}" target="_blank">
                                <div class="L_hot_list">
                                    <img src="${hotobj.stinypic}">
                                    <div class="L_hot_a">${hotobj.scommodityname}</div>
                                    <div class="p-price"><c:choose><c:when
                                            test="${hotobj.fprice eq 0}">价格面议</c:when><c:otherwise><i>¥</i><mw:format
                                            label="money"
                                            value="${hotobj.fprice}"/></c:otherwise></c:choose>
                                    </div>
                                    <a href="javascript:camera('${hotobj.sstockno}');" target="_blank"><img class="view-icon"
                                                                                     src="${ctx}/images/view-icon.png"></a>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <div class="view-rg right">
                    <div class="view-tab">
                        <ul class="clearfix">
                        <%--    <c:if test="${not empty commodity.sdescription}">--%>
                            <li class="cur">商品详情</li>
                          <%--  </c:if>--%>
                        </ul>
                    </div>
                    <div class="view-content">
                        <div class="detial display">
                            <%--<img src="${ctx}/images/xq-lg.jpg"/>--%>
                                <c:if test="${empty commodity.sdescription}">
                            <div class="yanan addDiff">
                                <div style="color:#333;font-size: 22px;padding: 10px 0;margin-bottom: 20px">产品参数</div>
                                <div class="yn-list">
                                    <label><i class="icon icon-details none"></i>名称：</label>
                                    ${commodity.sname}
                                </div>
                                <div class="yn-list">
                                    <label><i class="icon icon-details none"></i>规格型号/件号：</label>
                                    ${commodity.sspec}
                                </div>
                                <div class="yn-list">
                                    <label><i class="icon icon-details none"></i>生产厂家：</label>
                                    ${commodity.sproducer}
                                </div>

                                <div class="yn-list">
                                    <label><i class="icon icon-details none"></i>所属设备：</label>
                                    ${hostname}
                                </div>
                                <div class="yn-list">
                                    <label><i class="icon icon-details none"></i>所属设备厂商：</label>
                                    ${hostbrand}
                                </div>
                                <div class="yn-list">
                                    <label><i class="icon icon-details none"></i>所属设备型号：</label>
                                    ${hostmodel}
                                </div>
                                <div class="yn-list">
                                    <label><i class="icon icon-details none"></i>所属设备部件：</label>
                                    ${shostpart}
                                </div>

                                <c:if test="${not empty technical}">
                                    <div class="yn-list">
                                        <label><i class="icon icon-details none"></i>技术参数：</label>
                                        ${technical}
                                    </div>
                                </c:if>

                            </div>
                            </c:if>
                            ${commodity.sdescription}
                        </div>
                        <%--<div class="detial">--%>
                            <%--<div class="zj-table">--%>
                                <%--<table>--%>
                                    <%--<thead>--%>
                                        <%--<tr>--%>
                                            <%--<th width="15%">所属设备</th>--%>
                                            <%--<th width="15%">所属设备型号</th>--%>
                                            <%--<th width="18%">所属设备厂商</th>--%>
                                            <%--<th width="25%">所属设备部件</th>--%>
                                            <%--<th width="22%">技术参数</th>--%>
                                        <%--</tr>--%>
                                    <%--</thead>--%>
                                    <%--<tbody>--%>
                                    <%--<c:forEach items="${cdlist}" var="cbboj">--%>
                                        <%--<tr>--%>
                                            <%--<td title="刮板输送机">${cbboj.shostname}</td>--%>
                                            <%--<td title="SGZ1000/2100">${cbboj.shostmodel}</td>--%>
                                            <%--<td title="中煤张家口煤矿机械有限责任公司">${cbboj.shostbrand}</td>--%>
                                            <%--<td title="机头传动部-部链轮组件、机尾传动-部链轮组件">${cbboj.shostparts}</td>--%>
                                            <%--<td title="">${cbboj.stechnicalparameter}</td>--%>
                                        <%--</tr>--%>
                                    <%--</c:forEach>--%>
                                    <%--</tbody>--%>
                                <%--</table>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
