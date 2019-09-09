<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>煤亮子-商品详情</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style>
        .secList {
            border: 1px solid #ebebeb;
        }
        .dd-inner{
            display: none!important;
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
            }
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
                    window.location.href = "${ctx}/zy/marginstock/buybalance.shtml?stockid=" + saleresourceid + "&iavailablepackage=" + parseInt($("#amount").val());
                } else {
                    layer.msg(result.msg);
                }
            });

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

        //联系客服
        function contactCustomer(){
            layer.msg("客服热线：400-086-0101");
        }
        $(function () {
            $("#btn2").click(function () {
                $(".commit-mask").css({"display":"flex"});
                $(".commit-mask .commit-con1").show();
            });
            $("#btn3").click(function () {
                $(".commit-mask").css({"display":"flex"});
                $(".commit-mask .commit-con2").show();
            });
            $(".commit-con .btns button.close").click(function () {
                $(".commit-mask").hide();
                $(".commit-mask .commit-con").hide();
            });

            $("#done1").click(function () {
                if($("#messageForm input[name='sname']").val()!='' && $("#messageForm input[name='slinkmobile']").val()!='' && $("#messageForm textarea").val()!=''){
                    success ();
                }
                else {
                    layer.msg("请完善信息");
                }
            });
        });
        function success () {
            var id = $("#btn2").data('id');
            $("#messageForm").append('<input type="hidden" name="id" value="'+id+'" />');
            $.post("${ctx}/zy/messagebrand/save.json",$("#messageForm").serialize(),function(result){
                if(result.success){
                    $(".commit-mask").hide();
                    $(".commit-mask .commit-con").hide();
                    layer.msg("您的信息已发布成功，待平台审核。");
                }else{
                    layer.msg(result.msg);
                }
            });
        };
    </script>
</head>
<body>
<div class="mei-view">
    <div class="mycon">
        <sys:message content="${message}"/>
        <div class="address">当前位置：首页 » 二手设备</div>
        <div class="right-extra">
            <div class="clearfix">
                <div class="goods-mid left" style="width: 710px">
                    <div class="Pro_title bottom10">
                        <h2>
                            <c:if test="${secequip.irealtype eq 10}"> <label class="else">出租</label></c:if>
                            <c:if test="${secequip.irealtype eq 20}"> <label >出售</label></c:if>
                            <c:if test="${secequip.irealtype eq 30}"> <label class="else">求租</label></c:if>
                            <c:if test="${secequip.irealtype eq 40}"> <label >求购</label></c:if>
                            ${secequip.stitle}</h2>
                    </div>
                    <div class="Pro_bot">
                        <div class="Pro_infor" style="width: 60%;float: inherit;">
                            <div class="Pro_list">
                                <label>价格：</label>
                                <c:choose>
                                    <c:when test="${empty secequip.fprice|| secequip.fprice eq 0}"><span>价格面议</span></c:when>
                                    <c:otherwise><span>¥&nbsp;<mw:format label="money" value="${secequip.fprice}"/></span>元</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="Pro_list"><label>型号：</label>${secequip.sspec}</div>
                        </div>
                        <div class="Pro_inforjg">
                            <div class="Pro_list">
                                <i>数量：</i>${secequip.inumber}&nbsp;&nbsp;${secequip.sunit}
                            </div>
                            <div class="Pro_list" style="height: auto;">
                                <i>技术要求：</i>${secequip.srequirements}
                            </div>

                        </div>
                        <div class="view-btn" id="contractByBuyer">
                            <button class="buy" id="btn2" data-id="${secequip.id}"  style="background: #ffeded;color: #e73426">我有此设备</button>
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
            <img src="${ctx}/images/sec-banner.png"/>
        </div>
        <div class="mei-view-le">
            <div class="mycon clearfix">
                <%--<div class="view-le left">--%>
                    <%--<h2>热门产品推荐</h2>--%>
                    <%--<div class="Product_hot">--%>

                    <%--</div>--%>
                <%--</div>--%>
                <div class="view-rg" style="width: 100%">
                    <div style="padding: 11px 0;font-size: 16px;">热门求租购推荐</div>
                    <div class="cp-list">
                        <c:forEach items="${tuijian}" var="obj">
                        <div class="secList">
                            <div class="sec-name">
                                <c:choose>
                                    <c:when test="${obj.ioldtype eq 50}">
                                        <span class="else">求租</span><span>求购</span>
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
                                <div class="sec-more"><a href="${ctx}/zy/secequip/secequipbuy_view.html?id=${obj.id}">查看详情</a></div>
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="commit-mask">
    <div class="commit-con commit-con1">
        <div class="title">
            <h2>我有此设备</h2>
            <p>预留信息，我们会第一时间与您取得联系!</p>
        </div>
        <div class="body">
            <form id="messageForm" method="post">
                <div class="infor">
                    <textarea name="scontentinfo" id="scontentinfo" placeholder="请简单描述你的设备信息..." required></textarea>
                    <input class="input" name="sname" id="sname" placeholder="请输入您的真实姓名" required>
                    <input name="slinkmobile" id="slinkmobile" placeholder="您的联系方式" required>
                </div>
            </form>
        </div>
        <div class="btns">
            <button class="close">关闭</button>
            <button class="done" id="done1">我有此设备</button>
        </div>
    </div>
</div>
</body>
</html>
