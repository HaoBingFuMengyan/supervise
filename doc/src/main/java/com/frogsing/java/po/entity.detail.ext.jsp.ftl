<#include  "/function.ftl">
<#macro td_val field >
<#switch field.type>
<#case "int">
	<#if field.domain.consts??>
		<consts:${field.domain.code} val="${'$'}{model.${field.code?lower_case}}" op='label'/><#t/>
	 <#else>
		${'$'}{model.${field.code?lower_case}}<#t/>
	</#if>
	<#break>
<#case "double">
	<consts:${field.domain.code} val="${'$'}{model.${field.code?lower_case}}" op='label'/><#t/>
	<#break>
<#default>
	${'$'}{model.${field.code?lower_case}}<#t/>
	<#break>
</#switch>
</#macro>
<#macro entityM entity>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/exthead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${'$'}{ctx}/css/common.css" />
<title>${entity.name}详细信息</title>
</head>
<body>
<div class="bodybg">
	<div class="header">
		<h2>${entity.name}详细信息</h2>
	</div>
	
	 <table width="100%"  border="0" cellspacing="1" cellpadding="1" class="info">
	 <col align="left" width="13%"/>
	<col align="right"  width="20%"/>
	<col align="left" width="13%"/>
	<col align="right" width="20%" />
	<col align="left" width="13%"/>
	<col align="right" width="21%" />
	 <#assign i=0/>
	 <#list entity.columns as col>
	 <#if col.code?lower_case != "sguid">
		<#if (i % 3) == 0 >
		<#if (i!=0)>
		</tr>
		</#if>
		<tr>
		</#if>
				<td class="label">${col.name}</td>
	    		<td ><@td_val field=col/>&nbsp;</td>
		<#assign i=i+1/>
	</#if>
	</#list>
		</tr>
	 </table>
</div>
</body>
</html>
</#macro>
<#macro LL node>
<#list node.tables  as entity>
<#if entity.code==object()>
<@entityM entity=entity/>
<#break/>
</#if>
</#list>
</#macro>
<@LL node=pdm />
