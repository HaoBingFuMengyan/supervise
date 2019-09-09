<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mw" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="css/side.css"/>
    <meta name="data-spm" content=""/>
    <title>煤亮子--非现货资源(www.meiliangzi.cn)</title>
    <script src="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.css" rel="stylesheet" type="text/css">
    <style>

    </style>
    <script type="text/javascript">
        $(function () {
           /* $("#search_like_scommodityname").bigAutocomplete({
                url: "${ctx}/sp/commodity/searchcomodity.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#search_like_scommodityname").val(data.sname);
                    $("#search_like_sspec").val(data.sspec);
                    $("#search_like_sproducer").val(data.sproducer);
                }
            });*/
        });

        function doResetSearchForm() {
            $(':input','#mainForm').not(':button,:submit,:reset,:hidden').val('').removeAttr('checked').removeAttr('checked');
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

        function doQuery() {
            $("#mainForm").submit();
        }

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
    <script type="text/javascript">
        var ctx="${ctx}";
        var smemberid = '${membershop.smemberid}';
    </script>
</head>
<body>
<form id="mainForm" name="mainForm" method="post" action="${ctx}/goods_stock.html" enctype="multipart/form-data">
    <input type="hidden" id="pageNo" name="pageNo" value="0" />
    <input type="hidden" id="keyword" name="keyword" value="${keyword}" />
    <input type="hidden" name="order" value="${param.order}">
    <input type="hidden" name="search_blike_scategorysystemcode" value="${search_blike_scategorysystemcode}">
    <input type="hidden" id="search_like_scategory" name="search_like_scategory" value="${search_like_scategory}" />
    <div class="market-head top10">
        <div class="w">
            <a href="${ctx}/register.html" style="display: block;">
                <img src="${ctx}/images/page/mall-head2.png">
            </a>
        </div>
    </div>
    <div class="w addMall">
        <div class="searchBox">
            <div class="searchFilter">
                <div class="labelFilter">
                    <label>货物名称</label>
                    <input id="search_like_scommodityname" value="${search_like_scommodityname}" name="search_like_scommodityname" placeholder="输入查询的品名" autocomplete="off" >
                </div>
                <div class="labelFilter">
                    <label>规格型号</label>
                    <input autocomplete="off" id="search_like_sspec" name="search_like_sspec" value="${search_like_sspec}">
                </div>
                <div class="labelFilter">
                    <label>生产厂家</label>
                    <input autocomplete="off" id="search_like_sproducer" name="search_like_sproducer" value="${search_like_sproducer}">
                </div>
                <%--<div class="labelFilter">--%>
                    <%--<label>交货周期</label>--%>
                    <%--<select name="search_lte_ideliverydays" style="width: 100px;">--%>
                        <%--<option value="" <c:if test="${empty search_lte_ideliverydays }"> selected</c:if>>全部</option>--%>
                        <%--<option value="0" <c:if test="${search_lte_ideliverydays eq '0' }"> selected</c:if>>现货</option>--%>
                        <%--<option value="7" <c:if test="${search_lte_ideliverydays eq '7'}"> selected</c:if>>一周内</option>--%>
                        <%--<option value="14" <c:if test="${search_lte_ideliverydays eq '14'}"> selected</c:if>>两周内</option>--%>
                        <%--<option value="30" <c:if test="${search_lte_ideliverydays eq '30' }"> selected</c:if>>一个月内</option>--%>
                        <%--<option value="60" <c:if test="${search_lte_ideliverydays eq '60'}"> selected</c:if>>两个月内</option>--%>
                        <%--<option value="90" <c:if test="${search_lte_ideliverydays eq '90' }"> selected</c:if>>三个月内</option>--%>

                    <%--</select>--%>
                <%--</div>--%>

                <div class="labelFilter">
                    <label>货品类型</label>
                    <resource:GoodsType op="select" option="class='layui-input' style='width:100px;'"  val="${search_eq_igoodstype}" defname="全部" defval="" name="search_eq_igoodstype"/>
                </div>

                <button type="submit" class="search">搜索</button>
                <button class="delete" type="button" onclick="doResetSearchForm()">清空</button>
            </div>
        </div>
    </div>
    <div class="w addMall">
        <div class="cp-list">
            <%--<div class="operation">--%>
                <%--<ul class="clearfix">--%>
                    <%--<li>默认</li>--%>
                    <%--&lt;%&ndash;<li>价格<i class="icon icon-weibiaoti35"></i></li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li>上架时间<i class="icon icon-weibiaoti35"></i></li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li>--%>
                        <%--<input type="checkbox" name="search_eq_imembertype" value="2" <c:if test="${search_eq_imembertype eq '2'}">checked</c:if> onclick="doQuery()">--%>
                        <%--<span>自营</span>--%>
                    <%--</li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<input type="checkbox" name="search_eq_bisopenshop" value="1" <c:if test="${search_eq_bisopenshop eq '1'}">checked</c:if> onclick="doQuery()">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span>品牌商家</span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</li>&ndash;%&gt;--%>

                <%--</ul>--%>
            <%--</div>--%>
            <c:choose>
                <c:when test="${list.totalElements > 0}">
                        <c:forEach items="${list.content}" var="obj">
                            <div class="tableList">
                                <div class="cpName">
                                    <div class="name" title="${fn:replace(fn:replace(obj.scommodityname,'西域/EHSY', ''),'西域推荐','')}&nbsp;&nbsp;${obj.sspec}">${fn:replace(fn:replace(obj.scommodityname,'西域/EHSY', ''),'西域推荐','')}&nbsp;&nbsp;${obj.sspec}</div>

                                    <div class="company"><span>合作厂商</span><label>
                                        <c:choose>
                                            <c:when test="${obj.imembertype eq 2}">
                                                煤亮子商城
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${obj.bisopenshop eq 1}">
                                                    <a href="javascript:enterShop('${obj.smemberid}')">${obj.smembername}</a>
                                                </c:if>
                                                <c:if test="${obj.bisopenshop eq 0}">
                                                    ${obj.smembername}
                                                </c:if>
                                            </c:otherwise>

                                        </c:choose>
                                        </label>
                                    </div>
                                    <a onclick="var that = this;setTimeout(function(){that.removeAttribute('href');that.onclick=that=null;}, 0);return true;" href="${ctx}/zy/marginstock/goods_stock_view.html?id=${obj.id}&iresource=${obj.iresource}"><img class="mallImg" src="${obj.sbigpic}"></a>
                                </div>
                                <div class="price">
                                    <div class="value">
                                        <c:choose>
                                            <c:when test="${obj.fprice eq 0}">
                                                <font color="red">价格面议</font>
                                            </c:when>
                                            <c:otherwise>
                                            <span>
                                            <i>¥</i><mw:format label="money" value="${obj.fprice}"/><label>元/${obj.sweightunit}</label>
                                            </c:otherwise></c:choose>
                                    </div>
                                    <div class="kucun">库存:<span>${obj.fstockweight}${obj.sweightunit}</span></div>
                                </div>
                                <div class="rule">
                                    <div class="value">云仓</div>
                                    <div class="Mcamera"><resource:GoodsType val="${obj.igoodstype}" /> </div>
                                </div>
                                <div class="tags">
                                    <div class="baioqian">
                                        <span>
                                            <span><img class="baioqianImg" src="http://ftp.front.zhaogang.com/online/shoplabel/1.png">企业认证</span>
                                        </span>
                                    </div>
                                    <div class="baioqian">
                                        <span></span>
                                    </div>
                                </div>
                                <div class="more">
                                    <a onclick="var that = this;setTimeout(function(){that.removeAttribute('href');that.onclick=that=null;}, 0);return true;" href="${ctx}/zy/marginstock/goods_stock_view.html?id=${obj.id}&iresource=${obj.iresource}">查看详情</a>
                                </div>
                            </div>
                        </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="tableList" style="text-align: center;margin-top: 30px;font-size: 20px;">
                        紧急求购请拨4000860101-1
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="mpage top30">
                <mw:page pageobj="list" />
            </div>
        </div>
    </div>
</form>
</body>
</html>
