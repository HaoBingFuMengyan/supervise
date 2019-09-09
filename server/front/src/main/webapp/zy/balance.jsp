<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="default"/>
    <title>煤亮子-商品详情</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style>
        .layui-layer{
            top:40%!important;
        }
    </style>

    <script type="text/javascript">
        var iauthtype = ${member.iauthtype};//会员认证类型
        var flag = true;
        if (iauthtype != 20)
            flag = false;
        var stockweight = '${obj.favailableweight}';//可用件数
        function makeBuycontract(){
            if (!flag){
                alertx("请先通过企业认证");
                return;
            }
//            if (!$("input[type='radio']").is(":checked")){
//                alertx("请先选择收货人地址");
//                return;
//            }
            $("#searchForm").submit();
        }
        //增加 1
        function addPackage(){
            var iamount = new Number($("#stockPackage").val());
            if(iamount < new Number(stockweight)){
                $("#stockPackage").val(iamount+1);
                $("#iavailablepackage").val(iamount+1);
            }else
                return;
        }
        //减少 1
        function subPackage() {
            var iamount = new Number($("#stockPackage").val());
            if(iamount > 1){
                $("#stockPackage").val(iamount-1);
                $("#iavailablepackage").val(iamount-1);
            }else
                return;
        }
    </script>
</head>
<body>
<div class="mei-view">
    <div class="mycon">
        <div class="address">当前位置：首页 » 商品详情  » 核对订单信息</div>
        <sys:message content="${message}"/>
            <c:choose>
                <c:when test="${type == 'fxhzy'}">
                <form id="searchForm" action="${ctx}/zy/marginstock/contractbybuyer.shtml" method="post">
                    <input type='hidden' name='stockid' id="stockid" value="${obj.id}"/><%--资源id--%>
                </c:when>
                <c:otherwise>
                <form id="searchForm" action="${ctx}/zy/stock/contractbybuyer.shtml" method="post">
                    <input type='hidden' name='saleresourceid' id="saleresourceid" value="${saleresourceid}"/><%--挂牌资源ID--%>
                </c:otherwise>
            </c:choose>
            <input type='hidden' name='iavailablepackage' id="iavailablepackage" value="${iavailablepackage}"/><%--购买件数--%>
            <div class="balance-con">
                <div class="js-tit">填写并核对订单信息</div>
                <div class="js-block">
                    <h2>商品信息</h2>
                    <div class="js-table">
                        <table>
                            <thead>
                                <tr>
                                    <th width="40%">商品信息</th>
                                    <th width="20%">价格</th>
                                    <th width="20%">数量</th>
                                    <th width="20%">库存状态</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="infor">
                                        <p>${obj.scommodityname}&nbsp;${obj.sspec}&nbsp;</p>
                                        <div class="goods">
                                            <img  src="${obj.sbigpic}"/>
                                        </div>
                                    </td>
                                    <td align="center" class="red">¥<mw:format label="money" value="${obj.fprice}"/></td>
                                    <td align="center" class="num">
                                        <span onclick="subPackage()">-</span>
                                        <input id="stockPackage" value="${iavailablepackage}" disabled/>
                                        <span class="rg" onclick="addPackage()">+</span>
                                    </td>
                                    <td align="center">有货</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="js-block">
                    <h2>备注</h2>
                    <textarea placeholder="送货地点要求、时间要求等其他在此处填写..." name="sremark"></textarea>
                </div>
                <div class="js-btn">
                    <input type="button" class="button" onclick="makeBuycontract()" value="提交订单"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
