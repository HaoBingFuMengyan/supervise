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
<title>煤亮子--现货商城(www.meiliangzi.cn)</title>
<script src="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
<link href="${ctxStatic}/bigautocomplete/jquery.bigautocomplete.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(function () {
        <%--$("#search_like_scommodityname").bigAutocomplete({--%>
            <%--url: "${ctx}/sp/commodity/searchcomodity.json",--%>
            <%--click: 'true',--%>
            <%--select: true,--%>
            <%--callback: function (data) {--%>
                <%--$("#search_like_scommodityname").val(data.sname);--%>
                <%--$("#search_like_sspec").val(data.sspec);--%>
                <%--$("#search_like_sproducer").val(data.sproducer);--%>
            <%--}--%>
        <%--});--%>

    });

    function doResetSearchForm() {
        $(':input','#mainForm').not(':button,:submit,:reset,:hidden').val('').removeAttr('checked').removeAttr('checked');
        $('input[data-cleanable="true"]').val('');
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
</script>
</head>
<body>
<form id="mainForm" name="mainForm" method="post" action="${ctx}/resource.html" enctype="multipart/form-data">
    <input type="hidden" id="pageNo" name="pageNo" value="0" />
    <div class="market-head top10">
    <div class="w">
        <a href="${ctx}/register.html" style="display: block;">
            <img src="${ctx}/images/page/resource-head.png">
        </a>
    </div>
</div>
<div class="w addMall">
    <div class="searchBox">
        <div class="searchFilter">
            <div class="labelFilter">
                <label>货物名称</label>
                <input id="search_like_scommodityname" value="${search_like_scommodityname}" name="search_like_scommodityname" placeholder="输入查询的品名" data-cleanable="true" autocomplete="off" >
                <input name="search_like_skeyword" value="${search_like_skeyword}" data-cleanable="true" hidden>
                <input name="search_eq_scategoryid" value="${search_eq_scategoryid}" data-cleanable="true" hidden>
                <input name="search_like_sdetailkeyword" value="${search_like_sdetailkeyword}" data-cleanable="true" hidden>
            </div>
            <div class="labelFilter">
                <label>规格型号</label>
                <input autocomplete="off" id="search_like_sspec" name="search_like_sspec" value="${search_like_sspec}">
            </div>
            <div class="labelFilter">
                <label>合作厂商</label>
                <input autocomplete="off" id="search_like_sproducer" name="search_like_sproducer" value="${search_like_sproducer}">
            </div>

            <button type="submit" class="search">搜索</button>
            <button class="delete" type="button" onclick="doResetSearchForm()">清空</button>
        </div>
    </div>
</div>
<div class="w addMall">
    <div class="cp-list">
        <c:choose>
            <c:when test="${list.totalElements > 0}">
                <c:forEach items="${list.content}" var="obj">
                    <div class="tableList">
                        <div class="cpName">
                            <div class="name" title="${fn:replace(fn:replace(obj.scommodityname,'西域/EHSY', ''),'西域推荐','')}&nbsp;&nbsp;${obj.sspec}">${fn:replace(fn:replace(obj.scommodityname,'西域/EHSY', ''),'西域推荐','')}&nbsp;&nbsp;${obj.sspec}</div>
                                <div class="company"><span>合作商家</span><label>
                                    <c:choose>
                                        <c:when test="${obj.ispottype eq 0}">      <%--现货商城--%>
                                            <c:choose>
                                                <c:when test="${obj.bisopenshop eq 1}">
                                                    <a href="javascript:enterShop('${obj.sownerid}')">${obj.sownername}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    ${obj.sownername}
                                                </c:otherwise>

                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>          <%--物资集市--%>
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
                                        </c:otherwise>
                                </c:choose>



                                </label></div>


                                <a onclick="var that = this;setTimeout(function(){that.removeAttribute('href');that.onclick=that=null;}, 0);return true;" href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}"><img class="mallImg" src="${obj.stinypic}"></a>

                        </div>
                        <div class="price">
                            <div class="value">
                                <c:choose>
                                    <c:when test="${obj.fprice eq 0}">
                                        <font color="red">价格面议</font>
                                    </c:when>
                                    <c:otherwise>
                                        <i>¥</i><mw:format label="money" value="${obj.fprice}"/><label>元/${obj.sweightunit}</label>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="kucun">库存:<span>${obj.fweight}${obj.sweightunit}</span></div>
                        </div>
                        <div class="rule">
                            <c:choose>
                                <c:when test="${obj.ispottype eq 0}">
                                    <div class="value">${obj.swarehouse}</div>
                                    <c:if test="${obj.ispottype eq 0}"><div class="Mcamera">实时查看<a href="javascript:void(-1)" onclick="camera('${obj.sstockno}')"><img src="${ctx}/images/view-icon.png" ></a></div></c:if>
                                </c:when>
                                <c:otherwise>
                                    <div class="value">云仓</div>
                                    <div class="Mcamera"><resource:SpotType val="${obj.ispottype}" /> </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div class="tags">
                            <div class="baioqian">
                                <span><img class="baioqianImg" src="http://ftp.front.zhaogang.com/online/shoplabel/1.png">企业认证</span>
                            </div>
                            <div class="baioqian">
                                <c:if test="${obj.bisauth eq 1}"><span><img class="baioqianImg" src="http://ftp.front.zhaogang.com/online/shoplabel/2.png">放心购</span></c:if>
                            </div>
                        </div>
                        <div class="more">
                               <a onclick="var that = this;setTimeout(function(){that.removeAttribute('href');that.onclick=that=null;}, 0);return true;" href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}">查看详情</a>

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
