<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>



<c:if test="${ not empty list }">
	 <c:forEach items="${list}" var="obj">
		<div class="newslist clearfix" data-id="${obj.id}">
			<%--<div class="news_img left"><img src="${obj.stitleimage }" width="195" height="160"/></div>--%>
			<div class="news_wz left">
				<font><mw:format label='date' value='${obj.dpublishdate}'></mw:format></font>
				<a class="wz_tit" target="_blank" href="${ctx}/news_detial.html?id=${obj.id}">${obj.stitle}</a>
				<a target="_blank" href="${ctx}/news_detial.html?id=${obj.id}"><p>${obj.sabstract}</p></a><%--摘要--%>
				<a class="more" target="_blank" href="${ctx}/news_detial.html?id=${obj.id}">[更多]</a>
			</div>
		</div>
	</c:forEach>
</c:if>
							       