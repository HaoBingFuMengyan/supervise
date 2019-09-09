<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>

<c:choose>
    <c:when test="${list.totalElements > 0}">
        <ul class="p-list">
            <c:forEach items="${list.content}" var="obj">
                <li class="fore1">
                    <div class="p-img">
                        <c:choose>
                            <c:when test="${obj.ispottype == 0}">
                                <a href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}" target="_blank">
                                    <img data-lazy-img="done" width="130" height="130" src="${obj.sbigpic}" class="">
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${ctx}/zy/marginstock/goods_stock_view.html?id=${obj.id}"
                                   target="_blank">
                                    <img data-lazy-img="done" width="130" height="130" src="${obj.sbigpic}"
                                         class="">
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="p-info">
                        <div class="p-name">
                            <c:choose>
                                <c:when test="${obj.ispottype == 0}">
                                    <a href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}" target="_blank">
                                            ${obj.scommodityname} ${obj.sspec} ${obj.smaterial}
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${ctx}/zy/marginstock/goods_stock_view.html?id=${obj.id}" target="_blank">
                                            ${obj.scommodityname} ${obj.sspec} ${obj.smaterial}
                                    </a>
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div class="p-price" data-lazyload-fn="done">
                            <c:choose>
                                <c:when test="${obj.fprice eq 0}">价格面议</c:when>
                                <c:otherwise><i>¥</i><mw:format label="money" value="${obj.fprice}"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:if test="${obj.ispottype == 0}">
                           <img src="${ctx}/images/view-icon.png" class="opencamera"
                                                                      onclick="camera('${obj.sstockno}')" data-id="${obj.sstockno}"/>
                        </c:if>
                    </div>
                </li>
            </c:forEach>

        </ul>
        <div class="pager_content">
            <mw:page pageobj="list"/>
        </div>
    </c:when>
    <c:otherwise>
        <div class="pager_content">
            <input style="color: #da7e35;cursor: none;" value="抱歉，没有找到相关数据!" type="button"
                   class="no-border no-bg ac font14"/>
        </div>
    </c:otherwise>
</c:choose>