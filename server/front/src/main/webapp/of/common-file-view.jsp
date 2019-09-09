<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>

<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="30%">
        <col>
        <col width="10%">
    </colgroup>
    <thead>
    <tr>
        <th >附件</th>
        <th >说明</th>
        <th >操作</th>
    </tr>
    </thead>
    <tbody >
    <c:forEach items="${files}" var="file">
        <tr>
            <td>${file.sname}</td>
            <td>${file.sremark }</td>
            <td>
                <a class="layui-abtn" href="${ctx}/download.html?path=${file.surl}&filename=${file.sname}">下载</a>
                <a class="layui-abtn" href="<cs:SysParaType imgurl="1" op="syspara"/>/${file.surl}" target="_blank">预览</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>