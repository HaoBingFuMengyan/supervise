<#include  "/function.ftl">
<#assign packageName="com.frogsing.${pack()?lower_case}.utils" />
<#include  "/function.ftl">
<#function toMyType field>
	<#assign t=field.type />
	<#if field.domain?? && field.domain.consts??><#assign t=field.type /> <#else><#assign  t=field.type /></#if>
	<#if field.type="int">
		<#return "Integer">
	<#else>
		<#if field.type="long">
			<#return "Long">
		<#else>
			<#if field.type="double">
				<#return "Double">
			</#if>
			<#if field.type="json">
				<#return "String">
			</#if>
			<#return field.type>
		</#if>
	</#if>

</#function>
<#include "type.ftl"><#assign a="">
<#t><#macro entityM entity>
/**${entity.name}**/
//public static final String ${entity.code?lower_case}="${entity.code?lower_case}" ;
public static class ${entity.code?lower_case} {
public static XSpec<com.frogsing.${pack()?lower_case}.po.${toJavaName(entity.code)}> xspec() {
    return new XSpec<com.frogsing.${pack()?lower_case}.po.${toJavaName(entity.code)}>(com.frogsing.${pack()?lower_case}.po.${toJavaName(entity.code)}.class);
    }
    public static final String tablename="${entity.code?lower_case}";
	<#list entity.columns as field>
		<#if (field.code?upper_case!="SGUID" )>
            /**${field.name}**/
            public static final String ${field.code?lower_case}="${field.code?lower_case}" ;
		</#if>
	</#list>
	<#list entity.columns as field>
		<#if (field.code?upper_case!="SGUID" )>
            /**${field.name}**/
            public static  Path<${toMyType(field)}> ${field.code?lower_case}(Root<?> root){return root.get("${field.code?lower_case}");}
		</#if>
	</#list>

    }
</#macro>
    package  ${packageName};
    import com.frogsing.heart.persistence.XSpec;
    import javax.persistence.criteria.Path;
    import javax.persistence.criteria.Root;
    import java.sql.Date;
    public class ${pack()}Col {
    public static final String id="id" ;
    public static final String sguid="sguid" ;
<#macro LL node>
	<#list node.tables  as entity>
		<@entityM entity=entity/>
	</#list>
	<#list node.views  as entity>
		<@entityM entity=entity/>
	</#list>
</#macro>
<@LL node=pdm />

    }
