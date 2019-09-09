\<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="default"/>
    <title>煤亮子-购物车列表</title>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style>
        .layui-layer {
            top: 40% !important;
        }

        .mei-view .balance-con {
            border: none;
            padding: 0;
        }

        .js-table table th {
            background: #f3f3f3;
            border: 1px solid #e9e9e9;
        }

        .js-table table tbody {
            border-left: 1px solid #f1f1f1;
            border-right: 1px solid #f1f1f1;
            border-bottom: 1px solid #f1f1f1;
        }

        .js-table table tbody tr {
            height: 140px;
            border-bottom: 1px solid #cecece;
        }

        .js-table table th.choose {
            position: relative;
        }

        .js-table table th.choose p {
            position: absolute;
            left: 10px;
            top: 10px
        }

        .js-table table th.choose p input {
            margin-right: 5px;
        }

        .js-table table td.infor .goods {
            left: 30px;
        }

        .js-table table td {
            padding-top: 10px;
            vertical-align: top;
        }

        .js-table table td.infor p {
            font-size: 12px;
            color: #333;
            font-weight: 400;
        }

        .options-box {
            position: relative;
            height: 50px;
            margin-top: 25px;
            border: 1px solid #f1f1f1;
        }

        .select-all {
            float: left;
            height: 18px;
            *width: 60px;
            line-height: 18px;
            padding: 16px 0 16px 9px;
            white-space: nowrap;
        }

        .cart-checkbox {
            position: relative;
            z-index: 3;
            float: left;
            margin-right: 5px;
        }

        .cart-checkbox .jdcheckbox {
            position: relative;
            float: none;
            vertical-align: middle;
            _vertical-align: -1px;
            margin: 0 3px 0 0;
            *left: -3px;
            padding: 0;
        }

        .operation {
            float: left;
            height: 50px;
            width: 310px;
            line-height: 50px;
        }

        .toolbar-wrap .operation a {
            float: left;
            margin-left: 10px;
            color: #666;
        }

        .toolbar-right {
            position: absolute;
            height: 52px;
            right: 0;
            top: -1px;
            width: 610px;
        }

        .toolbar-right .normal {
            height: 52px;
        }

        .toolbar-right .normal .comm-right {
            float: right;
            width: 650px;
            *width: 610px;
        }

        .btn-area {
            float: right;
        }

        .btn-area .submit-btn {
            display: block;
            position: relative;
            width: 130px;
            height: 52px;
            line-height: 52px;
            color: #fff;
            text-align: center;
            font-size: 18px;
            font-family: "Microsoft YaHei";
            background: #e54346;
            overflow: hidden;
        }

        .price-sum {
            float: right;
            height: 43px;
            line-height: 20px;
            margin: 17px 20px 0 10px;
            color: #666;
            width: auto;
            position: relative;
        }

        .price-sum .txt {
            float: left;
            width: 50px;
            text-align: right;
            color: #999;
        }

        .amount-sum {
            float: right;
            color: #999;
            height: 44px;
            line-height: 20px;
            margin: 17px 0 0;
            cursor: pointer;
        }

        .amount-sum em {
            color: #e4393c;
            font-family: verdana;
            font-weight: 700;
            margin: 0 3px;
        }

    </style>

    <script type="text/javascript">
        //增加 1
        function addPackage(id, favailableweight, fprice, istatus,thisObj) {
            if (istatus == 2) {
                var iamount = parseInt($("#favailableweight" + id).val());
                if (iamount < parseInt(favailableweight)) {
                    $(thisObj).attr('style','pointer-events:none');//设置不能点击
                    $.ajax({
                        url: '${ctx}/zy/cart/cartpackage.json',
                        data: {id: id, type: 'add'},
                        traditional: true,
                        success: function (data) {
                            if (data.success) {
//                                layer.msg(data.msg);
                                $("#favailableweight" + id).val(iamount + 1);
                                calculationAmount(id, parseInt($("#favailableweight" + id).val()), fprice);
                                addAndSubCal(id, fprice, true);
                                $(thisObj).removeAttr('style');
                            } else {
                                if (data.msg)
                                    layer.msg(data.msg);
                                else
                                    layer.msg("未知错误,返回消息格式不正确!需要异步提交");
                            }
                        },
                        error: function (data) {
                            layer.msg("系统错误，请联系管理员");
                        }
                    });
                } else
                    return;
            }
        }
        //减少 1
        function subPackage(id, fprice, istatus,thisObj) {
            if (istatus == 2) {
                var iamount = parseInt($("#favailableweight" + id).val());
                if (iamount > 1) {
                    $(thisObj).attr('style','pointer-events:none');//设置不能点击
                    $.ajax({
                        url: '${ctx}/zy/cart/cartpackage.json',
                        data: {id: id, type: 'sub'},
                        traditional: true,
                        success: function (data) {
                            if (data.success) {
//                                layer.msg(data.msg);
                                $("#favailableweight" + id).val(iamount - 1);
                                calculationAmount(id, parseInt($("#favailableweight" + id).val()), fprice);
                                addAndSubCal(id, fprice, false);
                                $(thisObj).removeAttr('style');
                            } else {
                                if (data.msg)
                                    layer.msg(data.msg);
                                else
                                    layer.msg("未知错误,返回消息格式不正确!需要异步提交");
                            }
                        },
                        error: function (data) {
                            layer.msg("系统错误，请联系管理员");
                        }
                    });
                } else
                    return;
            }
        }
        function addAndSubCal(id, fprice, flag) {
            if ($("#ftamount" + id).parent().parent().find("input[type='checkbox']").is(':checked')) {
                var str = $("#totalMoney").text().replace(/,/g, '');
                var totalMoney = parseFloat(str.substring(str.indexOf('¥') + 1, str.length));
                var totalNumber = parseInt($("#totalNumber").text());
                if (flag) {//加
                    totalAmount(parseInt(parseInt(totalNumber) + 1), parseFloat(totalMoney + parseFloat(fprice)), false);
                } else {//减
                    totalAmount(parseInt(parseInt(totalNumber) - 1), parseFloat(totalMoney - parseFloat(fprice)), false);
                }
            }
        }
        //判断输入的购买件数是否大于可用件数
        function Calculation(id, thisObj, favailableweight, fprice, istatus) {
            //可用重量  favailableweight
            if (istatus == 2) {
                var buypackage = $(thisObj).val();
                if (buypackage != null && buypackage != "") {
                    if (parseInt(buypackage) > parseInt(favailableweight))
                        $(thisObj).val(parseInt(favailableweight));
                    else if (parseInt(buypackage) < 1)
                        $(thisObj).val(1);
                } else
                    $(thisObj).val(1);
                $.ajax({
                    url: '${ctx}/zy/cart/cartpackage.json',
                    data: {id: id, type: 'cal', buycount: parseInt($(thisObj).val())},
                    traditional: true,
                    success: function (data) {
                        if (data.success) {
//                                layer.msg(data.msg);
                            calculationAmount(id, parseInt($(thisObj).val()), fprice);
                            var amount = 0;//数量
                            var money = 0.0;//小计
                            if ($("#ftamount" + id).parent().parent().find("input[type='checkbox']").is(':checked'))
                                $("tbody tr td[class='infor']").find("input[type='checkbox']").each(function () {
                                    if (this.checked) {
                                        var id = $(this).data('id');
                                        amount += parseInt($("#favailableweight" + id).val());
                                        var str = $("#ftamount" + id).text().replace(/,/g, '');
                                        money += parseFloat(str.substring(str.indexOf('¥') + 1, str.length));
                                        totalAmount(amount, money, false);
                                    }
                                });
                        } else {
                            if (data.msg)
                                layer.msg(data.msg);
                            else
                                layer.msg("未知错误,返回消息格式不正确!需要异步提交");
                        }
                    },
                    error: function (data) {
                        layer.msg("系统错误，请联系管理员");
                    }
                });
            }
        }
        //小计
        function calculationAmount(id, iamount, fprice) {
            var amount = getRoundValue(iamount * parseFloat(fprice), 2);
            var ftamount = fmt(amount, '#,#00.00');
            $("#ftamount" + id).text("¥ " + ftamount);
        }
        //计算金额
        function totalAmount(iamount, fmoney, flag) {
            if (flag) {
                var str = $("#totalMoney").text().replace(/,/g, '');
                var totalMoney = parseFloat(str.substring(str.indexOf('¥') + 1, str.length)) + fmoney;
                var totalNumber = parseInt($("#totalNumber").text()) + iamount;
                $("#totalMoney").text('¥ ' + fmt(totalMoney, '#,#00.00'));
                $("#totalNumber").text(totalNumber);
            } else {
                $("#totalMoney").text('¥ ' + fmt(fmoney, '#,#00.00'));
                $("#totalNumber").text(iamount);
            }
        }
        function whileAmount() {
            var amount = 0;//数量
            var money = 0.0;//小计
            $("tbody tr td[class='infor']").find("input[type='checkbox']:checked").each(function () {
                var id = $(this).data('id');
                amount += parseInt($("#favailableweight" + id).val());
                var str = $("#ftamount" + id).text().replace(/,/g, '');
                money += parseFloat(str.substring(str.indexOf('¥') + 1, str.length));
            });
            totalAmount(amount, money, false);
        }
        //全选
        function selected(thisObj, css) {
            if (thisObj.checked) {
                $("tbody tr td[class='infor']").find("input[type='checkbox']").each(function () {
                    if ($(this).data('istatus') == 2) {
                        this.checked = true;
                        $(this).parent().parent().attr('style', "background-color:#fff4e6");
                        $(this).after('<input type="hidden" id="'+$(this).data('id')+'ids" name="ids" value="'+$(this).data('id')+'"/>');
                    }
                });
                $("input[type='checkbox'][class='" + css + "']").each(function () {
                    var istatus = $(this).data('istatus');
                    if (istatus == 2 || istatus == undefined)
                        $(this).prop("checked", "checked");
                });
                whileAmount();
            } else {
                $("tbody tr td[class='infor']").find("input[type='checkbox']").each(function () {
                    this.checked = false;
                    if ($(this).data('istatus') == 2) {
                        $(this).parent().parent().removeAttr('style', "background-color:#fff4e6");
                        $("#"+$(this).data('id')+"ids").remove();
                    }
                });
                $("input[type='checkbox'][class='" + css + "']").removeAttr('checked');
                totalAmount(0, 0.0, false);
            }
        }
        //选中单个资源
        function selectBalance(thisObj, istatus) {
            if (istatus == 2) {
                var amount = 0;//数量
                var money = 0.0;//小计
                var id = $(thisObj).data('id');
                amount += parseInt($("#favailableweight" + id).val());
                var str = $("#ftamount" + id).text().replace(/,/g, '');
                money += parseFloat(str.substring(str.indexOf('¥') + 1, str.length));
                if (thisObj.checked) {
                    $(thisObj).parent().parent().prop('style', "background-color:#fff4e6");
                    $(thisObj).after('<input type="hidden" id="'+$(thisObj).data('id')+'ids" name="ids" value="'+$(thisObj).data('id')+'"/>');
                    var flag = false;
                    $("tbody tr td[class='infor']").find("input[type='checkbox']").each(function () {
                        if (!this.checked && $(this).data('istatus') == 2) {//有未选中复选框
                            flag = true;
                            return;
                        }
                    });
                    if (!flag) {
                        $("thead tr input[type='checkbox'][class='checkbox'],input[type='checkbox'][class='jdcheckbox']").prop("checked", "checked");
                        whileAmount();
                    } else {
                        totalAmount(amount, money, true);
                    }
                } else {
                    $(thisObj).parent().parent().removeAttr('style', "background-color:#fff4e6");
                    $("#"+$(thisObj).data('id')+"ids").remove();
                    var flag = false;
                    $("tbody tr td[class='infor']").find("input[type='checkbox']").each(function () {
                        if (!this.checked) {//有未选中复选框
                            flag = true;
                            return;
                        }
                    });
                    if (flag)
                        $("thead tr input[type='checkbox'][class='checkbox'],input[type='checkbox'][class='jdcheckbox']").removeAttr("checked");

                    var str = $("#totalMoney").text().replace(/,/g, '');
                    var totalMoney = parseFloat(str.substring(str.indexOf('¥') + 1, str.length)) - money;
                    var totalNumber = parseInt($("#totalNumber").text()) - amount;
                    totalAmount(totalNumber, totalMoney, false);
                }
            }
        }
        //删除购物车资源
        function deleteCart(id) {
            var ids = new Array();
            var flag = true;
            if (id == undefined || id == "") {
                $("tbody tr td[class='infor']").find("input[type='checkbox']:checked").each(function (i) {
                    ids[i] = $(this).data('id');
                });
                if (ids.length <= 0) {
                    layer.msg("至少选择一条资源！");
                    flag = false;
                }
            } else
                ids[0] = id;
            if (flag) {
                top.layer.confirm('确定要删除购物车资源吗?', {icon: 3, title: '系统提示'}, function (index) {
                    $.ajax({
                        url: '${ctx}/zy/cart/deletecart.json',
                        data: {ids: ids},
                        traditional: true,
                        success: function (data) {
                            if (data.success) {
                                layer.msg(data.msg);
                                for (var i = 0; i < ids.length; i++) {
                                    if ($("#" + ids[i] + "line").find("td input[type='checkbox']").is(':checked')) {
                                        var amount = parseInt($("#favailableweight" + ids[i]).val());
                                        var _str = $("#ftamount" + ids[i]).text().replace(/,/g, '');
                                        var money = parseFloat(_str.substring(_str.indexOf('¥') + 1, _str.length));

                                        var str = $("#totalMoney").text().replace(/,/g, '');
                                        var totalMoney = parseFloat(str.substring(str.indexOf('¥') + 1, str.length)) - money;
                                        var totalNumber = parseInt($("#totalNumber").text()) - amount;
                                        totalAmount(totalNumber, totalMoney, false);
                                    }
                                    $("#" + ids[i] + "line").remove();
                                    var count = parseInt($("#count").text()) - 1;
                                    $("#count").text(count);
                                    $("#addcart").text(parseInt($("#addcart").text()) - 1);
                                }
                            } else {
                                if (data.msg)
                                    layer.msg(data.msg);
                                else
                                    layer.msg("未知错误,返回消息格式不正确!需要异步提交");
                            }
                        },
                        error: function (data) {
                            layer.msg("系统错误，请联系管理员");
                        }
                    })
                    top.layer.close(index);
                });
            }
        }

        //购物车结算
        function cartBalance() {
            var ids = new Array();
            var flag = true;
            $("tbody tr td[class='infor']").find("input[type='checkbox']:checked").each(function (i) {
                ids[i] = $(this).data('id');
            });
            if (ids.length <= 0) {
                layer.msg("至少选择一条购物车资源结算！");
                flag = false;
            }
            if (flag) {
                $("#searchForm").submit();
            }
        }
    </script>
</head>
<body>
<div class="mei-view">
    <div class="mycon">
        <div class="address">当前位置：首页 » 商品详情 » 购物车列表</div>
        <sys:message content="${message}"/>
        <form id="searchForm" action="${ctx}/zy/cart/contractbycart.shtml" method="post">
            <div class="balance-con">
                <div class="js-block">
                    <h2>全部商品(<em id="count">${fn:length(list)}</em>)</h2>
                    <div class="js-table">
                        <table>
                            <thead>
                            <tr>
                                <th width="40%" class="choose">商品信息<p><input type="checkbox" class="checkbox"
                                                                             onclick="selected(this,'jdcheckbox')">全选
                                </p></th>
                                <th width="15%">价格</th>
                                <th width="15%">数量</th>
                                <th width="15%">小计</th>
                                <th width="15%">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="obj">
                                <c:choose>
                                    <c:when test="${obj.indenturesaleresource.istatus ne 2}">
                                        <tr id="${obj.id}line" style="background-color: #F3F3F3;">
                                    </c:when>
                                    <c:otherwise>
                                        <tr id="${obj.id}line">
                                    </c:otherwise>
                                </c:choose>
                                <td class="infor">
                                    <p>${obj.indenturesaleresource.sownername}</p>
                                    <p>${obj.indenturesaleresource.scommodityname}&nbsp;${obj.indenturesaleresource.sspec}&nbsp;${obj.indenturesaleresource.sproducer}</p>
                                    <p>${jj:weight(obj.indenturesaleresource.favailableweight)}&nbsp;${obj.indenturesaleresource.sweightunit}</p>
                                    <div class="goods">
                                        <img src="${obj.simageurl}"/>
                                    </div>
                                    <c:choose>
                                        <c:when test="${obj.indenturesaleresource.istatus ne 2}">
                                            <input type="checkbox" class="checkbox" data-id="${obj.id}"
                                                   data-istatus="${obj.indenturesaleresource.istatus}"
                                                   disabled>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" class="checkbox" data-id="${obj.id}"
                                                   data-istatus="${obj.indenturesaleresource.istatus}"
                                                   onclick="selectBalance(this,'${obj.indenturesaleresource.istatus}')">
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td align="center" class="red">¥&nbsp;${mw:money(obj.fprice)}</td>
                                <td align="center" class="num">
                                <span onclick="subPackage('${obj.id}','${obj.fprice}','${obj.indenturesaleresource.istatus}',this)">-</span>
                                <input id="favailableweight${obj.id}" value="${obj.ibuycount}"
                                       onblur="this.value=this.value.replace(/^0/g,'')"
                                       onkeyup="this.value=this.value.replace(/\D/g,'');Calculation('${obj.id}',this,'${obj.indenturesaleresource.favailableweight}','${obj.fprice}','${obj.indenturesaleresource.istatus}')"/>
                                <span class="rg"
                                      onclick="addPackage('${obj.id}','${jj:weight(obj.indenturesaleresource.favailableweight)}','${obj.fprice}','${obj.indenturesaleresource.istatus}',this)">+</span>
                                <p style="color: #aaa;font-size: 12px;margin-top: 5px">
                                <c:choose>
                                    <c:when test="${obj.indenturesaleresource.istatus ne 2}">
                                        无货
                                    </c:when>
                                    <c:otherwise>
                                        有货
                                    </c:otherwise>
                                </c:choose>

                                </p>
                                </td>
                                <td align="center" class="red" id="ftamount${obj.id}">
                                    ¥&nbsp;${mw:money(obj.ftamount)}</td>
                                <td align="center">
                                    <a onclick="deleteCart('${obj.id}')">删除</a>
                                </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="options-box">
                        <div class="select-all">
                            <div class="cart-checkbox">
                                <input type="checkbox" class="jdcheckbox" onclick="selected(this,'checkbox')"/>
                                <label>勾选全部商品</label>
                            </div>
                        </div>
                        <div class="operation">
                            <a class="remove-batch" onclick="deleteCart('')">删除选中的商品</a>
                        </div>
                        <div class="clr"></div>
                        <div class="toolbar-right">
                            <div class="normal">
                                <div class="comm-right">
                                    <div class="btn-area">
                                        <a onclick="cartBalance()" class="submit-btn">
                                            生成采购订单<b></b></a>
                                    </div>
                                    <div class="price-sum">
                                        <div>
                                            <span class="txt txt-new">总价：</span>
                                            <span class="price sumPrice"><em style="color: #c50004;font-size: 20px;"
                                                                             id="totalMoney">¥&nbsp;0.00</em></span>
                                            <b class="ml5 price-tips"></b>
                                            <div class="price-tipsbox" style="display: none; left: 159.85px;">
                                                <div class="ui-tips-main">不含运费及送装服务费</div>
                                                <span class="price-tipsbox-arrow"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="amount-sum">
                                        已选择<em id="totalNumber">0</em>件商品<b class="up"></b>
                                    </div>
                                    <div class="clr"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>