<#include  "/function.ftl">
<#include "type.ftl"><#assign a="">
<#t><#macro entityM entity>
	<#list entity.columns as field>
COMMENT ON COLUMN 	${entity.code?lower_case}.${field.code?lower_case} is '${field.name}/${field.domain.comment!""}/${field.comment!""}';
	</#list>
</#macro>
<#macro LL node>
<#list node.tables  as entity>
<@entityM entity=entity/>
</#list>
</#macro>
<@LL node=pdm />

}
