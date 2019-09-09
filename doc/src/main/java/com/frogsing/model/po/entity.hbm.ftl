<#include  "/function.ftl">
<#include "type.ftl"><#t>
<#macro entityM entity>
<?xml version="1.0" encoding="UTF-8" ?>
<hibernate-mapping xmlns="urn:nhibernate-mapping-2.2">
	<class name="frogsing.${toJavaName(entity.code)},model" table="${entity.code?lower_case}">
		<id name="sguid" >
		  <generator class="uuid.hex">
          </generator>
		</id>
	<#list entity.columns as field>
	<#if (field.code?upper_case=="IVERSIONNO" )>
		${"<"}version column="${field.code?lower_case}" <#if field.type=="String"> length="${field.length?string("0")}"</#if> name="${field.code?lower_case}" type="<@fieldToHiberateType field=field/>" ${"/>"}
		<#break/>
	</#if>
	</#list>
	<#list entity.columns as field>
	<#if (field.code?upper_case!="SGUID" && field.code?upper_case!="IVERSIONNO")>
		${"<"}property column="${field.code?lower_case}" <#if field.type=="String"><#if (field.dataType=="longtext")> <#else> length="${field.length?string("0")}"</#if></#if> name="${field.code?lower_case}" type="<@fieldToHiberateType field=field/>" ${"/>"}
	</#if>
	</#list>
	 ${frogsingcode[0]!""}
	</class>
</hibernate-mapping>
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