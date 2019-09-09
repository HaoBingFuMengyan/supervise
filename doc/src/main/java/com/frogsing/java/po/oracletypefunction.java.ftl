<#include  "/function.ftl">
<#list pdm.domains as t>
<#if t._restriction.@base="xs:int" && t.code!="Bool">
<#assign desc="${t.desc}">
<#assign rows=desc?split("\n") >
create or replace function tp_${t.code?lower_case}(tp in int) return varchar2 is
  rs_ varchar2(1000);
begin
 rs_:='error_value';
<#list rows as row>
<#assign cols=row?split(":")>	
<#if (cols?size>1)>
   if tp=${cols[0]} then
      rs_:='${cols[2]!""?js_string}';
    end if;
</#if>	
</#list>
return rs_;
end tp_${t.code?lower_case};
/
</#if>
</#list>
