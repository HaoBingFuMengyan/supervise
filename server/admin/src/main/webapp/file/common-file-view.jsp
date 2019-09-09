<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>

<table class="layui-table top10" lay-size="sm">
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
    <c:forEach items="${flist}" var="file">
        <tr>
            <td>${file.sname}</td>
            <td>${file.sremark }</td>
            <td><a class="layui-abtn" href="${ctx}/download.html?path=${file.surl}&filename=${file.sname}">下载</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>