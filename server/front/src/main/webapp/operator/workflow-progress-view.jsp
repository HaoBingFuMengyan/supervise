<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="wf" uri="http://www.frogsing.com/tags/operator" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>审核进度</legend>
</fieldset>
<ul class="layui-timeline">
    <c:forEach items="${data.workFlowDetails}" var="detail">
        <li class="layui-timeline-item">
            <c:choose>
                <c:when test="${detail.bisactive == 0 && detail.istatus == 2}"><%--已审核--%>
                    <i class="layui-icon layui-timeline-axis pass"></i>
                </c:when>
                <c:when test="${detail.bisactive == 0 && detail.istatus == 3}"><%--审核拒绝--%>
                    <i class="layui-icon layui-timeline-axis color"></i>
                </c:when>
                <c:when test="${detail.bisactive == 1 && detail.istatus == 1}"><%--准备审核--%>
                    <i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>
            <div class="layui-timeline-content layui-text">
                <h4 class="layui-timeline-title">
                    <span style="display: inline-block;width: 100px">${detail.scheckoperator}</span>
                    <span style="margin-left: 150px">
                    <c:choose>
                        <c:when test="${detail.bisactive == 0 && detail.istatus == 2}">
                            通过
                        </c:when>
                        <c:when test="${detail.bisactive == 0 && detail.istatus == 3}">
                            拒绝
                        </c:when>
                        <c:when test="${detail.bisactive == 1 && detail.istatus == 1}"><%--准备审核--%>
                            未审核
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </span><span style="margin-left: 150px"><mw:format label="datetime"
                                                                   value="${detail.dmodifydate}"/></span></h4>
                <p>
                        ${detail.scheckinfo}
                </p>
            </div>
        </li>
    </c:forEach>
</ul>