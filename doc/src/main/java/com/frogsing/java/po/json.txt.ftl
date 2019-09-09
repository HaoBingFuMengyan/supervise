<#include  "/function.ftl">
<#function fv field>
<#assign t=field.type />
	<#if field.domain.consts??><#assign t=field.type /> <#else><#assign  t=field.type /></#if>
	
	<#if field.type="int">
		<#return "$"+"{obj."+field.code?lower_case+"!'0'}">
	<#else>
		<#if field.type="long">
			<#return "$"+"{obj."+field.code?lower_case+"!'0'}">
		<#else>
			<#if field.type="double">
				<#return "$"+"{obj."+field.code?lower_case+"!'0'}">
			</#if>
		</#if>
	</#if>	
	<#return "'$"+"{obj."+field.code?lower_case+"?js_string}'" >
</#function>
<#macro entityM entity>
	<${'#'}macro ${entity.code?lower_case} obj>
		'id':'$${''}{obj.id}',
		<#list entity.columns as field>
		<#if (field.code?upper_case!="SGUID" )>
		'${field.code?lower_case}':${fv(field)}<#if field_has_next>,</#if>
		<${'@'}desc s='${field.name?js_string}'>
		 ${field.domain.comment!""}  
		 </${'@'}desc>
		</#if>
		</#list>
	</${'#'}macro>
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