<#include  "/function.ftl">
<#t>
<#macro entityM entity>
package ${pack()};
<#if frogsingcode[0]?? && (frogsingcode[0]?length>40)>
${frogsingcode[0]}
<#else>
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.${pdm.code}.po.${toJavaName(object())};


//frogsingcode//

</#if>
public interface ${toJavaName(object())}Dao extends BaseDao<${toJavaName(object())}, String>{
<#if frogsingcode[1]?? && (frogsingcode[1]?length>40)>
${frogsingcode[1]}
<#else>
<#t/>//frogsingcode//





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

