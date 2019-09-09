<#include  "/function.ftl">
<#--list pdm.tables as table>
INSERT INTO `sys_sequence` VALUES ('${table_index}', '${table.code?lower_case}', '${table.name}编号', '000000', '1', '1', '1', null, null, '6', null, '0', null, '1');
</#list -->
<#list pdm.tables as table>
#${table.code?lower_case} ${table.name}
<#list table.columns as col>
<#if col.domain.code?lower_case=="datetime">
<#-- alter table ${table.code?lower_case} modify ${col.code?lower_case} ${col.dataType} <#if col.mandatory!=0 || col.code?lower_case=="sguid">not null</#if> <#if col.defaultValue??><#if col.domain.code?lower_case=="datetime"><#else>default ${col.defaultValue}</#if></#if>;
update   ${table.code?lower_case} set ${col.code?lower_case}='2013-05-01 13:13:00';
-->
</#if>
<#if col.domain.code?lower_case=="sysdate">
alter table ${table.code?lower_case} modify ${col.code?lower_case} ${col.dataType} default ${col.defaultValue};
</#if>
</#list>
</#list>