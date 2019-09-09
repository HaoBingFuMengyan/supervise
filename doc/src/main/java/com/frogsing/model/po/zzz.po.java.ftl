<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
package ${pack()}.po.${toPackageName(entity.code)};

import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import com.frogsing.bone.po.${toPackageName(entity.code)}.${toJavaName(object())}Base;

@Entity
@Table(name = "${toPackageName(entity.code)}_${toJavaName(object())?lower_case}")
@Cache(usage = CacheConcurrencyStrategy.NONE)
public class ${toJavaName(object())} extends  ${toJavaName(object())}Base{

	
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