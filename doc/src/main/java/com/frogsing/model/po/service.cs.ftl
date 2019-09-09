<#include  "/function.ftl">
<#include "type.ftl">
<#t><#macro entityM entity>
    /// <summary>
    /// Summary description for ${entity.name} Service
    /// </summary>
    public  partial  class ${toJavaName(entity.code)}Service :CommonService
    {
       private static ${toJavaName(entity.code)}Service service ;
       private static Object serviceLock=new Object();
       public static ${toJavaName(entity.code)}Service Service {
            get
            {
                if (service == null)
                {
                    lock (serviceLock)
                    {
                        if (service == null)
                            service = (${toJavaName(entity.code)}Service)SpringContext.Context.GetObject("${toJavaName(entity.code)}Service");
                    }
                }
                return service;
            }
        }
       virtual public void Add(${toJavaName(entity.code)} entity)
       {
           Dao.${toJavaName(entity.code)}Dao.Add(entity);
       }
       virtual public void Update(${toJavaName(entity.code)} entity)
       {
           Dao.${toJavaName(entity.code)}Dao.Update(entity);
       }
       virtual public void Delete(${toJavaName(entity.code)} entity)
       {
           Dao.${toJavaName(entity.code)}Dao.Delete(entity);
       }
       virtual public ${toJavaName(entity.code)} Get(String id)
       {
          return  Dao.${toJavaName(entity.code)}Dao.get(id);

       }
       virtual  public Object Get(String id, params String[] cols)
        {
             return  Dao.${toJavaName(entity.code)}Dao.get(id,cols);
        }
       //索引函数begin
      <#list entity.indexs as key>
      <#if key.bisunique >
       public ${toJavaName(entity.code)} getBy<#list key.columns as f>${f.code?lower_case?cap_first}</#list>(<#list key.columns as f>${f.type} ${f.code?lower_case}<#if f_has_next>,</#if></#list>){
	           
	     return  Dao.${toJavaName(entity.code)}Dao.getBy<#list key.columns as f>${f.code?lower_case?cap_first}</#list>(<#list key.columns as f>${f.code?lower_case}<#if f_has_next>,</#if></#list>);
	 	}
	  </#if>
      </#list>
       //索引函数end
       virtual public IList<${toJavaName(entity.code)}> FindAll()
       {
           return Dao.${toJavaName(entity.code)}Dao.Find();
       }
       virtual public IList<${toJavaName(entity.code)}> FindList(DetachedCriteria dc){
            return Dao.${toJavaName(entity.code)}Dao.Find(dc);
        }
       virtual public IList<${toJavaName(entity.code)}> FindAllDesc(params String[] sortColums)
        {
            return Dao.${toJavaName(entity.code)}Dao.Find();
        }
       virtual  public IList<${toJavaName(entity.code)}> FindAllAsc(params String[] sortColums)
        {
            IList<${toJavaName(entity.code)}> list;
            if (sortColums.Length == 0)
                list = Dao.${toJavaName(entity.code)}Dao.Find();
            else
            {
                DetachedCriteria dc= Dao.${toJavaName(entity.code)}Dao.Dc;
                foreach(String s in sortColums){
                    dc.AddOrder(Order.Asc(s));
                }
                list = Dao.${toJavaName(entity.code)}Dao.Find(dc);
            }
            return list;
        }
        //判断列col等于val的记录(除了id为sguid的记录)是否存在
        virtual  public bool IsExits(String col, Object val, String sguid)
        {

            return Dao.${toJavaName(entity.code)}Dao.IsExits(col, val, sguid);
        }
    }
</#macro>
<#function entityfieldtotype entity fieldname>
<#list entity._complexType._attribute as field>
<#if fieldname?lower_case==field.@name?lower_case>
<#return fToJavaType(field)/>
<#break>
</#if>
</#list>
</#function>
<#macro LL node>
<#list node.tables  as entity>
<@entityM entity=entity/>
</#list>
</#macro>
<#function cut1 str>
<#assign len=str?length>
<#return str?substring(1,len) >
</#function>
<#function cut2 str>
<#assign len=str?length>
<#return str?substring(2,len)?cap_first >
</#function>
<#macro keys entity>
<#list doc._schema._element._key  as key>
<#if "${key._selector.@xpath}"=="${entity.code}" >
<#assign p=false>
<#list key._field as field><#if cut1(field.@xpath?lower_case)=="sguid" ><#assign p=true/></#if></#list>
<#if p>
<#else>
	 public ${toJavaName(entity.code)} getBy<#list key._field as field>${cut2(field.@xpath?lower_case)}</#list>(<#list key._field as field>${entityfieldtotype(entity,cut1(field.@xpath?lower_case))} ${cut1(field.@xpath?lower_case)}<#if field_has_next>,</#if></#list>){
	           
	     return  Dao.${toJavaName(entity.code)}Dao.findUniqe(<#list key._field as field>Restrictions.Eq(${entity.code?lower_case}.${cut1(field.@xpath?lower_case)},${cut1(field.@xpath?lower_case)})<#if field_has_next>,</#if></#list>);
	 }
 </#if>
</#if>
</#list>
</#macro>
using System;
using Spring.Data.NHibernate.Support;
using Spring.Data.NHibernate;
using NHibernate; 
using NHibernate.Criterion;
using System.Collections.Generic;
using System.Collections;
namespace frogsing.service
{
<@LL node=pdm />
}