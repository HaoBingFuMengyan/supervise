<#include  "/function.ftl">
<#assign packageName="com.frogsing.${pack()?lower_case}.utils" />
package  ${packageName};
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class ${pack()} {



<#list pdm.domains as t>
<#if t.consts?? && t.code?lower_case != "booltype">
public static enum ${t.code} implements  IConst{
<#assign vals= []>
<#list t.consts as row>
	<#if vals?seq_contains(row.val)>
	repeat value {${row.name}(${row.value}}
	<#else>
	${row.name}(${row.value},"${row.comment?js_string}")<#if row_has_next>,<#else>;</#if>
	<#assign vals= vals+[row.value]>
	</#if>
</#list>
	public  static ${t.code} get(int i){
    	 switch(i)
    	 {
    	 <#list t.consts as row>
    	 case ${row.value}:
    		return ${t.code}.${row.name};
    	</#list>
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ${t.code} ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return ${t.code}.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ${t.code}.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(${t.code}.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
	<#if t.code=='SysParaType'>
	 public String sys(String dfvalue) {
		
		return com.frogsing.parameter.utils.ParaUtils.sys(this.nCode,dfvalue);
	}
	public Long sys(long dfvalue) {
		String rs=com.frogsing.parameter.utils.ParaUtils.sys(this.nCode,String.valueOf(dfvalue));
		return Long.parseLong(rs);
	}
	public Double sys(double dfvalue) {
		String rs=com.frogsing.parameter.utils.ParaUtils.sys(this.nCode,String.valueOf(dfvalue));
		return Double.parseDouble(rs);
	}
	</#if>
}
</#if>
</#list>
}