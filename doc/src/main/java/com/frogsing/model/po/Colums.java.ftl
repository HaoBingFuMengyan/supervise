<#include  "/function.ftl">
<#include "type.ftl">
<#assign a="">
<#macro entityM1 entity>
	{
		Dictionary<String,ColumnTag> poMap=new Dictionary<String,ColumnTag>();
	<#list entity.columns as field>
	   	poMap.Add("${field.code?lower_case}" ,
	   			new ColumnTag("${field.code?lower_case}","${field.name}",check.${field.domain.code?lower_case}Check,check.${field.domain.code?lower_case}ToString,check.${field.domain.code?lower_case}Width));
	</#list>
		map.Add("${toJavaName(entity.code)}" ,poMap);      
	}
</#macro>
<#macro entityM entity>
//public static  String ${entity.code?lower_case}="${entity.code?lower_case}" ;//${entity.name}
public static class ${entity.code?lower_case} {
	public static  String tablename="${entity.code?lower_case}";
	<#list entity.columns as field>
	public static  String ${field.code?lower_case}="${field.code?lower_case}" ;//${field.name}
	</#list>
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
<#macro LL1 node>
<#list node.tables  as entity>
<@entityM1 entity=entity/>
</#list>
</#macro>

using System;
using System.Collections.Generic;
namespace frogsing {
public abstract class IDomainCheck
	    {
	   		public abstract Object check_int(ColumnTag tag, string val);
		    public abstract Object check_datetime(ColumnTag tag,string val);
		    public abstract Object check_date(ColumnTag tag,string val);
		    public abstract Object check_base64binary(ColumnTag tag, string val);
		    public abstract Object check_string(ColumnTag tag,string val,int length);

		    public abstract Object check_long(ColumnTag tag, string val);
		    public abstract Object check_double(ColumnTag tag, string val);
			public abstract Object check_json(ColumnTag tag, string val);


<#list pdm.domains as t>
			virtual public Object ${t.code?lower_case}Check(ColumnTag tag,String val)
			{
					<#if t.type=="String" >
						return	check_${t.type?lower_case}(tag,val, ${t.length?string("0")});
					<#else>
						return	check_${t.type?lower_case}( tag,val);
					</#if>
			}
			virtual public String ${t.code?lower_case}ToString(Object val)
			{
						if(val==null)
							return "";
						return <@domainToString domain=t/>;
			}
			virtual public int ${t.code?lower_case}Width()
			{
						return <@domainToWidth domain=t/>;
			}
			</#list>
	    }
public partial class ColumnUtils
{
		<#list pdm.domains as t>
			public static String ${t.code?lower_case?cap_first}ToString(Object val)
			{
						return Converts.${t.code?lower_case}ToString(val);
			}
		</#list>
}
public partial class DomainDictionarys
    {
     	
        public DomainDictionarys (IDomainCheck check){
          map = new Dictionary<String, Dictionary<String,ColumnTag>>();
         	<@LL1 node=pdm />
        }
    }
<@LL node=pdm />

}
