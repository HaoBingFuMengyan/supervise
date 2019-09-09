<#include  "/function.ftl">
<#t>
<#function toMyType field>
<#assign t=field.type />
<#if field.domain.consts??><#assign t=field.type /> <#else><#assign  t=field.type /></#if>
<#if field.type="int">
<#return "Integer">
<#else>
<#if field.type="long">
<#return "Long">
<#else>
<#if field.type="double">
<#return "Double">
</#if>

<#return field.type>
</#if>
</#if>

</#function>
<#macro entityM entity>
package ${pack()};
<#if frogsingcode[0]?? && (frogsingcode[0]?length>40)>
${frogsingcode[0]}
<#else>

//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
</#if>
//@Entity
//${"@Table(name = \""}${object()?lower_case}")
<#if frogsingcode[1]?? && (frogsingcode[1]?length>40)>
${frogsingcode[1]}
<#else>
//frogsingcode//
//frogsingcode//
</#if>
@MappedSuperclass
public class ${toJavaName(object())}Base  extends  BaseEntity{
	
	  <#list entity.columns as field>
		<#assign tp=field.type>
	   <#if (field.code?upper_case!="SGUID" &&tp!="json" )>
	<#if field.domain.comment?? && field.domain.comment?starts_with("@") >
	<@compress single_line=true>${field.domain.comment}</@compress>//
	</#if>
	private   ${toMyType(field)} ${field.code?lower_case}<@typeDefaultValue field=field/>; //${field.name} ${field.domain.type}
		</#if>
	</#list>
	<#list entity.columns as field>
		<#assign tp=field.type>
	   <#if (field.code?upper_case!="SGUID" &&tp!="json")>
	   /**
		${field.name} ${field.domain.type}
		<#if field.domain.consts??>
	    ${field.domain.code}:
	    ${field.domain.comment} 
	    </#if>
		*/
		<#if field.domain.code=="VersionNo">
		@javax.persistence.Version
		</#if>
		<#if field.type=="byte[]">
		@javax.persistence.Lob
		@javax.persistence.Basic(fetch = javax.persistence.FetchType.LAZY)
		@Column(name="${field.code?lower_case}",columnDefinition = "BLOB")
		<#else>
		@Column(name="${field.code?lower_case}"<#if tp=="String">,length=${field.length?string("0")}</#if>)
		</#if>
		public ${toMyType(field)} get${field.code?lower_case?cap_first}() {
			return  ${field.code?lower_case};//${field.name} ${field.domain.type}
		}
		/**
		${field.name} ${field.domain.type}
		<#if field.domain.consts??>
	    ${field.domain.code}:
	    ${field.domain.comment} 
	    </#if>
		*/
		public void set${field.code?lower_case?cap_first}(${toMyType(field)}  ${field.code?lower_case}) {
			this.${field.code?lower_case} =  ${field.code?lower_case};//${field.name} ${field.domain.type}
		}
		</#if>
	</#list>
	
<#if frogsingcode[2]?? && (frogsingcode[2]?length>40)>
${frogsingcode[2]}
<#else>
	//frogsingcode//
	
	
	
	
	//frogsingcode//
</#if>
	
}
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