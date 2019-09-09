<#include  "/function.ftl">
<#t>
<#function toMyType field>
<#if field.domain.consts??><#return field.type /><#else><#return  field.type /></#if>
</#function>
<#macro entityM entity>
package ${pack()}.${toPackageName(entity.code)};
<#if frogsingcode[0]?? && (frogsingcode[0]?length>40)>
${frogsingcode[0]}
<#else>
//frogsingcode//
import javax.persistence.Entity;
import javax.persistence.Table;
//frogsingcode//
</#if>
@Entity
${"@Table(name = \""}${object()?lower_case}")
<#if frogsingcode[1]?? && (frogsingcode[1]?length>40)>
${frogsingcode[1]}
<#else>
//frogsingcode//
//frogsingcode//
</#if>
public class ${toJavaName(object())}  extends  ${toJavaName(object())}Base{
	
	 
	
<#if frogsingcode[2]?? && (frogsingcode[2]?length>40)>
${frogsingcode[2]}
<#else>
	//frogsingcode//
	
	
	
	
	//frogsingcode//
</#if>
	
}
</#macro>
<#macro LL node>
<#list node.views  as entity>
<#if entity.code==object()>

<@entityM entity=entity/>
<#break/>
</#if>
</#list>
</#macro>
<@LL node=pdm />