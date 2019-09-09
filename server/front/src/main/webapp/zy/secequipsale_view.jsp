<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>煤亮子-商品详情</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style>
        .dd-inner{
            display: none!important;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#textEdit table").attr("border","1");
            $("#textEdit table").css({"width":"90%","margin":"0 auto"});
            $("#textEdit table td").css({"padding":"10px 0"});
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

            if (${secequip.fprice == 0}) {
                $("#amount").prop("readonly", "readonly");
                $("#add,#de").css("pointer-events", "none");
                $("#addCart").prop("disabled", "disabled");
            }


            $(".commit-con .btns button.close").click(function () {
                $(".commit-mask").hide();
                $(".commit-mask .commit-con").hide();
            });

            $("#done0").click(function () {
                if($("#messageForm input[name='sname']").val()!='' && $("#messageForm input[name='slinkmobile']").val()!='' && $("#messageForm textarea").val()!=''){
                    success ();
                }
                else {
                    layer.msg("请完善信息");
                }
            });


            $("#byBuyer").click(function () {
                $(".commit-con0 input").val('');
                $(".commit-con0 textarea").val('');

                $(".commit-mask").css({"display":"flex"});
                $(".commit-mask .commit-con0").show();
            });
        });
        function success () {
            var id = $("#byBuyer").data('id');
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


        //联系客服
        function contactCustomer(){
            layer.msg("客服热线：400-086-0101");
        }
    </script>
</head>
<body>
<div class="mei-view">
    <div class="mycon">
        <sys:message content="${message}"/>
        <div class="address">当前位置：首页 » 二手设备</div>
        <div class="right-extra">
            <div class="clearfix">
                <div id="preview" class="spec-preview left">
                    <span class="jqzoom"><img src="<cs:SysParaType imgurl="1" op="syspara"/>/${secequip.simage}" /></span>
                </div>
                <div class="goods-mid left">
                    <div class="Pro_title bottom10">
                        <h2><img class="resource" src="${ctx}/images/metriel.png">${secequip.stitle}</h2>
                    </div>
                    <div class="Pro_bot">
                        <div class="Pro_infor">
                            <div class="Pro_list">
                                <label><resource:SecondEquipType val="${secequip.irealtype}"/>价：</label>
                                <c:choose>
                                    <c:when test="${empty secequip.fprice or secequip.fprice eq 0}"><span>价格面议</span></c:when>
                                    <c:otherwise><span>¥&nbsp;<mw:format label="money" value="${secequip.fprice}"/></span>元</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="Pro_list">
                                <label>合作商家：</label>
                                <em>煤亮子商城</em>
                            </div>
                        </div>
                        <div class="Pro_inforjg">
                            <div class="Pro_list"><i>规格参数：</i>${secequip.sspec}</div>
                            <div class="Pro_list"><i>生产厂商：</i>${secequip.sproducer}</div>
                            <c:if test="${secequip.ioldtype eq 60}">
                                <div class="Pro_list"><i>${secequip.irealtype eq 10 ?'出售':'出租'}价：</i><c:choose><c:when test="${secequip.fotherprice eq 0}">面议</c:when><c:otherwise>${secequip.fotherprice}&nbsp;&nbsp;元</c:otherwise></c:choose></div>
                            </c:if>
                            <div class="Pro_list"><i>数&nbsp;&nbsp;量：</i>${secequip.inumber}&nbsp;&nbsp;${secequip.sunit}</div>
                            <div class="Pro_list"><i>货物类型：</i>二手</div>
                            <div class="Pro_list"><i>设备状态：</i><resource:MachineState op="label" val="${secequip.imachinestate}"/></div>
                        </div>
                        <div class="view-btn" id="contractByBuyer">
                            <button id="byBuyer" class="buy" data-id="${secequip.id}"  style="background: #ffeded;color: #e73426">
                                立即购买
                            </button>
                            <button class="buy" onclick="contactCustomer()" style="background: #ffeded;color: #e73426">
                                联系客服
                            </button>
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
            <img src="${ctx}/images/equipview-ban-img.jpg"/>
        </div>
        <div class="mei-view-le">
            <div class="mycon clearfix">
                <div class="view-le left">
                    <h2>热门<resource:SecondEquipType val="${secequip.irealtype}"/></h2>
                    <div class="Product_hot">
                        <c:forEach items="${hots}" var="hot">
                            <a href="${ctx}/zy/secequip/secequipbuy_view.html?id=${hot.id}" target="_blank">
                                <div class="L_hot_list">
                                    <img src="<cs:SysParaType imgurl="1" op="syspara"/>/${hot.simage}">
                                    <div class="L_hot_a">${hot.stitle}</div>
                                    <div class="p-price"><c:choose><c:when
                                            test="${empty hot.fprice or hot.fprice eq 0}">价格面议</c:when><c:otherwise><i>¥</i><mw:format
                                            label="money"
                                            value="${hot.fprice}"/></c:otherwise></c:choose>
                                    </div>
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
                        <div id="textEdit">
                            ${secequip.scontent}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="commit-mask">
    <div class="commit-con commit-con0">
        <div class="title">
            <h2>预约看设备</h2>
            <p>预留信息，我们会第一时间与您取得联系。</p>
        </div>
        <div class="body">
            <form id="messageForm" method="post">
                <div class="infor">
                    <input class="input" name="sname" id="sname" placeholder="请输入您的真实姓名" required>
                    <input class="input" name="slinkmobile" id="slinkmobile" placeholder="请输入您的联系方式" required>
                    <textarea class="input" name="scontentinfo" id="scontentinfo" placeholder="请描述您的需求..." required></textarea>
                </div>
            </form>
        </div>
        <div class="btns">
            <button class="close">关闭</button>
            <button class="done" id="done0">免费预约</button>
        </div>
    </div>
</div>
</body>
</html>
