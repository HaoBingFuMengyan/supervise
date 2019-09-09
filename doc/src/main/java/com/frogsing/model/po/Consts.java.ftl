<#include  "/function.ftl">
<#include  "type.ftl">
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace frogsing
{

public class Consts {

private static Dictionary<String, Dictionary<String, String>> map = new Dictionary<String, Dictionary<String, string>>();
  static Consts(){
<#list pdm.domains as t>
<#if t.consts??>
	map.Add("${t.code}", ${t.code}.buildMap());
</#if>
</#list>
 }
public static String getLabel(String type,String val)
{
	
	String va;
	Dictionary<String, String> v=map[type];
	if(v==null)
		return  "未知";
	va=v[val];
	if(va==null)
		va= "未知";
	return va;
	
}
public static Dictionary<String,String> getLabelMap(String type)
{

	Dictionary<String,String> v=map[type];
	return v;
	
}
public static bool isImage(String suffix)
{
	String rightSuffix = "@jpg@jpeg@bmp@gif@png@";
	if(rightSuffix.IndexOf("@"+suffix+"@")!=-1)
		return true;
	else
		return false;

}
//判断是否为真
public static bool isTrue(int i)
{
	if(i==0)
		return false;
	else
		return true;

}
//判断是否为假
public static bool isFalse(int i)
{
	if(i==0)
		return true;
	else
		return false;

}
public      const   int  YES=1;
public      const   int  NO=0;
public 	    const   int  NOTHING=-1;
}
<#list pdm.domains as t>
<#if t.consts??>
public static class ${t.code} {
	
<#list t.consts as row>
	public      const   int  ${row.name}=${row.value};//${row.comment}
</#list>

    internal static Dictionary<String,String> buildMap()
   {
      Dictionary<String,String> m=new Dictionary<String,String>();

	 <#list t.consts as row>
	  m.Add("${row.value}", "${row.comment?js_string}");
	 </#list>
	   return m;
   }
 
   public static String labelOf(int i){
    	switch(i)
    	{
 <#list t.consts as row>
    		case ${row.value}:
    			return "${row.comment?js_string}";
</#list>
    	default:
    		return "";
    	}
    }
	
}
</#if>
</#list>
}