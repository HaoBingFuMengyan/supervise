<#include  "/function.ftl">
<#assign kp=['cs_city',
'cs_country',
'cs_currenttradedate',
'cs_darkdictionary',
'cs_exchange',
'cs_hotkey',
'cs_nottradedate',
'cs_province',
'cx_infoconfig',
'cx_infoconfigdetail',
'cx_membertypetransfer',
'hy_purview',
'hy_role',
'hy_rolepurview',
'jk_interfaceset',
'sp_category',
'sp_commodity',
'sp_material',
'sp_productor',
'sp_specs',
'sys_businessparameter',
'sys_errormessage',
'sys_menu',
'sys_operator',
'sys_operatorrole',
'sys_parameter',
'sys_parametergroup',
'sys_parametergroupdetail',
'sys_purview',
'sys_role',
'sys_rolepurview',
'sys_sequence',
'xw_navigation',
'hy_bank',
'hy_member',
'membertypepurview']/>
<#list pdm.tables as table>
<#if kp?seq_contains(table.code?lower_case) >
/*保留 ${table.code?lower_case}*/
<#else>
/*XXXXXXXXXXXXXXXXXXXXXXXXXX	 ${table.code?lower_case}*/
</#if>
</#list>
<#list pdm.tables as table>
<#if kp?seq_contains(table.code?lower_case) >
/*保留 ${table.code?lower_case}*/
<#else>
/*${table.name}*/ 
drop table ${table.code?lower_case} cascade constraints;
create table ${table.code?lower_case} 
(
  <#list table.columns as column>
   ${column.code?lower_case}    ${column.domain.dataType}     <#if column.defaultValue??>default ${column.defaultValue}</#if>  <#if (column.mandatory>0)>   not null</#if>,
  </#list>
  <#list table.keys as key>
  <#if key.code?lower_case!=table.primaryKey.code?lower_case>
   constraint ${key.code?lower_case}_${table.code?lower_case} unique (<#list key.columns as key>${key.code?lower_case}<#if key_has_next>,</#if></#list>);
   </#if>
  </#list>
  <#assign aa=table.code?lower_case />
  <#if (aa?length>27) ><#assign aa=aa[0..26]></#if>
   constraint pk_${aa} primary key(<#list table.primaryKey.columns as key>${key.code?lower_case}<#if key_has_next>,</#if></#list>)
);
<#list table.columns as column>
comment on column ${table.code?lower_case}.${column.code?lower_case} is
'${column.name}
${column.comment!""}
${column.domain.comment!""}';
</#list>
</#if>
</#list>