<#include  "/function.ftl">
<#assign packageName="com.frogsing.java.po" />
<#include  "/function.ftl">
<#include "type.ftl"><#assign a="">
<#t><#macro entityM entity>
public  static class _${entity.code?lower_case} {
	public void _set(){
	
	<#list entity.columns as field>
		  <#if (field.code?upper_case!="SGUID" )>
		//$$.set${field.code?lower_case?cap_first}( ##.get${field.code?lower_case?cap_first}());
		</#if> 
	</#list>
	
}
}
</#macro>
package  com.frogsing.java.po;
public class Getset {

<#macro LL node>
<#list node.tables  as entity>
//delete from ${entity.code?lower_case}
</#list>
<#list node.tables  as entity>
<@entityM entity=entity/>
</#list>
</#macro>
<@LL node=pdm />

}
