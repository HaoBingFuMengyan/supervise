<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>


<c:choose>
    <c:when test="${list.totalElements > 0}">
        <ul>
            <c:forEach items="${list.content}" var="obj">
                <li class="fore1">
                    <div class="p-img">
                        <a href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}" target="_blank">
                            <img data-lazy-img="done" width="130" height="130" src="${obj.stinypic}" class="">
                        </a>
                    </div>
                    <div class="p-info">
                        <div class="p-name">
                            <a href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}" target="_blank">

                                    ${obj.scommodityname} ${obj.sspec} ${obj.smaterial}
                            </a>
                        </div>
                        <div class="p-price" data-lazyload-fn="done">
                            <c:choose>
                                <c:when test="${obj.fprice eq 0}">价格面议</c:when>
                                <c:otherwise><i>¥</i><mw:format label="money" value="${obj.fprice}"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:if test="${obj.ispottype == 0}">
                            <c:if test="${obj.ispottype eq 0}"><img src="${ctx}/images/view-icon.png"
                                                                    class="opencamera"
                                                                    onclick="camera('${obj.sstockno}')"
                                                                    data-id="${obj.sstockno}"/></c:if>
                        </c:if>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <div class="pager_content">
            <input style="color: #da7e35;cursor: none;" value="抱歉，没有找到相关数据!" type="button"
                   class="no-border no-bg ac font14"/>
        </div>
    </c:otherwise>
</c:choose>


<script type="text/javascript">
    listTotalPages = '${list.totalPages}';//总页数
    number = '${list.number}';//当前页码
    $(document).ready(function () {
        var page_current = parseInt($("#page_current").text());
        if (page_current == parseInt(listTotalPages)) {//最后一页
            $("#next_page").attr('onclick', 'up_page($("#page_current").text())');
            $("#next_page").text("上一页");
        } else if (page_current == parseInt(1)) {//首页
            $("#next_page").attr('onclick', 'next_page($("#page_current").text())');
            $("#next_page").text("下一页");
        }
    });
</script>

