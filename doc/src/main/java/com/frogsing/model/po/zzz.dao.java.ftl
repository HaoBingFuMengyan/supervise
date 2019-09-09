<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
package ${pack()}.dao.${toPackageName(entity.code)};

import org.springframework.stereotype.Component;
import com.frogsing.heart.dao.HibernateDao;
import ${pack()}.po.${toPackageName(entity.code)}.${toJavaName(object())};
@Component
public class ${toJavaName(object())}Dao extends HibernateDao<${toJavaName(object())}, String> {


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

