<#include  "/function.ftl">
<#include "type.ftl">
<#t><#macro entityM entity>
package ${pack()}.${toPackageName(entity.code)};
import javax.persistence.Lob;
import javax.persistence.Basic;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.bone.po.BaseEntity;
import javax.persistence.FetchType;
import java.math.BigDecimal;
/// <summary>
/// ${object()}
/// </summary>
/*
	<#list entity._complexType._attribute as field>
		<#assign tp=fToJavaType(field)>
	   <#if (field.@name?upper_case!="SGUID" )>
	   <#if field.@type=="VersionNo"><#else>
		$.set<@upper1 str="${field.@name?lower_case}" />();//${field.@label} ${tp}
		</#if> 
		</#if>
	</#list>
	
	<#list entity._complexType._attribute as field>
		<#assign tp=fToJavaType(field)>
	   <#if (field.@name?upper_case!="SGUID" )>
	   <#if field.@type=="VersionNo"><#else>
		$.set<@upper1 str="${field.@name?lower_case}" />(#.get<@upper1 str="${field.@name?lower_case}" />());//${field.@label} ${tp}
		</#if> 
		</#if>
	</#list>
*/
/*
@Entity
${"@Table(name = \""}${object()?lower_case}")
@Cache(usage = CacheConcurrencyStrategy.NONE)
*/
@MappedSuperclass
public class ${toJavaName(object())}Base  extends  BaseEntity{
	<#list entity._complexType._attribute as field>
	   <#if (field.@name?upper_case!="SGUID" )>
	   <#assign tp=fToJavaType(field)>
	   <#assign desc=fToDesc(field.@type)>
	    <#if tp=="String">
	    <#else>
	    /*
	    ${desc} 
	      */
	    </#if>
	   //${field.@label}
		private ${tp} ${field.@name?lower_case}<@typeDefaultValue field=field/>;
		<#if field.@type=="VersionNo">
		@javax.persistence.Version
		</#if>
		<#if field.@type=="File">
		@Lob
		@Basic(fetch = FetchType.LAZY)
		@Column(name="${field.@name?lower_case}",columnDefinition = "BLOB")
		<#else>
		@Column(name="${field.@name?lower_case}"<#if tp=="String"&&desc?trim!="">,length=${desc}</#if>)
		</#if>
		public ${tp} get<@upper1 str="${field.@name?lower_case}" />() {
			return  ${field.@name?lower_case};
		}
		public void set<@upper1 str="${field.@name?lower_case}" />(${tp}  ${field.@name?lower_case}) {
			this.${field.@name?lower_case} =  ${field.@name?lower_case};
		}
		</#if>
	</#list>
}
</#macro>
<#macro LL node>
<#list node.tables  as entity>
<#if entity.code==object()>
<@entityM entity=entity/>
<#break/>
<#else>
<@LL node=entity._complexType />
</#if>
</#list>
</#macro>
<@LL node=pdm />