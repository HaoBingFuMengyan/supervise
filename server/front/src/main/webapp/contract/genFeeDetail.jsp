<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wm" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/project" %>

<c:choose>
    <c:when test="${empty error}">
        <c:forEach items="${projectSettle.inputmap}" var="obj">
            <tr>
                <td>
                    <consts:ProjectSettleSubject val="${projectSettle.inputmap[obj.key].isubject}"></consts:ProjectSettleSubject>
                </td>
                <td>
                    <%--<c:if test="${projectSettle.inputmap[obj.key].isubject==10--%>
            <%--||projectSettle.inputmap[obj.key].isubject==30--%>
            <%--||projectSettle.inputmap[obj.key].isubject==40}">--%>
                        <wm:format label="date" value="${projectSettle.inputmap[obj.key].dstart}"/>至<wm:format label="date" value="${projectSettle.inputmap[obj.key].dend}"/>
                    <%--</c:if>--%>
                </td>
                <td><wm:format label="money" value="${projectSettle.inputmap[obj.key].fsettleamount}"/></td>
                <td>
                    <input name="inputmap['${obj.key}'].fsettleamount" data-name="fsettleamount" class="layui-input" type="hidden" value="${projectSettle.inputmap[obj.key].fsettleamount}"/>
                    <input name="inputmap['${obj.key}'].isubject" class="layui-input" type="hidden" value="${projectSettle.inputmap[obj.key].isubject}"/>
                    <input name="inputmap['${obj.key}'].swarehousesettlefeeid" class="layui-input" type="hidden" value="${projectSettle.inputmap[obj.key].swarehousesettlefeeid}"/>
                    <input name="inputmap['${obj.key}'].dstart" class="layui-input" type="hidden" value="<wm:format label="date" value="${projectSettle.inputmap[obj.key].dstart}"/>"/>
                    <input name="inputmap['${obj.key}'].dend" class="layui-input" type="hidden" value="<wm:format label="date" value="${projectSettle.inputmap[obj.key].dend}"/>"/>
                    <input name="inputmap['${obj.key}'].fdiscount" data-name="fdiscount" class="layui-input" value="0"/></td>
                <td><input name="inputmap['${obj.key}'].sremark" class="layui-input" value="${projectSettle.inputmap[obj.key].sremark}"/></td>
            </tr>

        </c:forEach>

    </c:when>
    <c:otherwise>
        <tr>
            <input data-name="fsettleamount" class="layui-input" type="hidden" value="0"/>
            <input data-name="fdiscount" class="layui-input" type="hidden" value="0"/></td>
            <td colspan="5" style="color: #FF0000" align="center">${error}</td>
        </tr>

    </c:otherwise>
</c:choose>

