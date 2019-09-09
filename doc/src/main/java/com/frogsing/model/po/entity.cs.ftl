<#include  "/function.ftl">
<#include "type.ftl">
<#t><#macro entityM entity>
using System;
#region
/*
 <#list entity.columns as field>
  _${toJavaName(entity.code)?lower_case}.${field.code?lower_case}=
</#list>
*/
#endregion
namespace frogsing
{
    /// <summary>
    /// Summary description for ${entity.name}
    /// </summary>
    public partial class ${toJavaName(entity.code)}
    {
        public  ${toJavaName(entity.code)}()
        {
        }
        virtual public ${toJavaName(entity.code)} Clone()
        {
            return (${toJavaName(entity.code)})this.MemberwiseClone();
        }
        <#list entity.columns as field>
         /*${field.domain.code}
         ${field.domain.comment!""}*/
        virtual public ${typeToCsharpType(field)}<#if field.type=="double"||field.type=="long"|| field.type=="DateTime">?</#if> ${field.code?lower_case}{get;set;}//${field.name}
        //alter table ${entity.code?lower_case} add ${field.code?lower_case} ${field.dataType} <#if field.mandatory!=0>not null</#if> <#if field.defaultValue??>default '${field.defaultValue}'</#if>;
        </#list>
        ${frogsingcode[0]!""}
    }
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