<#include  "/function.ftl">
<#include "type.ftl">
<#t><#macro entityM entity>
    /// <summary>
    /// Summary description for ${entity.name} dao
    /// </summary>
    public partial   class ${toJavaName(entity.code)}Dao :Dao<${toJavaName(entity.code)}>
    {
       
              //索引函数begin
      <#list entity.indexs as key>
      <#if key.bisunique >
       public ${toJavaName(entity.code)} getBy<#list key.columns as f>${f.code?lower_case?cap_first}</#list>(<#list key.columns as f>${f.type} ${f.code?lower_case}<#if f_has_next>,</#if></#list>){
	           
	     return  findUniqe(<#list key.columns as f>Restrictions.Eq(${entity.code?lower_case}.${f.code?lower_case},${f.code?lower_case})<#if f_has_next>,</#if></#list>);
	 	}
	  </#if>
      </#list>
       //索引函数end 
       
    }

</#macro>
<#macro LL node>
<#list node.tables  as entity>
<@entityM entity=entity/>
</#list>
<#list node.views  as entity>
<@entityM entity=entity/>
</#list>
</#macro>
using System;
using Spring.Data.NHibernate.Support;
using Spring.Data.NHibernate;
using NHibernate; 
using NHibernate.Criterion;
using System.Collections.Generic;
using System.Collections;
namespace frogsing
{
<@LL node=pdm />
}