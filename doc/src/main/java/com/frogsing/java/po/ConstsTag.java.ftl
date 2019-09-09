<#include  "/function.ftl">
<#assign packageName="com.frogsing.${pack()?lower_case}.utils" />
package  ${packageName};
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class ${pack()}Tag{

<#list pdm.domains as t>
<#if t.consts?? && t.code?lower_case != "booltype">
	public static class Tag${t.code} extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return ${packageName}.${pack()}.${t.code}.get(val);
		}
		<#list t.consts as row>
		public void set${row.name?lower_case?cap_first?trim}(int val) {
			setCurrentconst(${packageName}.${pack()}.${t.code}.${row.name},val);
		}
		</#list>
		@Override
		public IConst[] GetVals() {
			return ${packageName}.${pack()}.${t.code}.values();
		}
	}
<#else>
<#if t.type?lower_case=="double">
	public static class Tag${t.code} extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return ${t.precision!0};
		}
		@Override
		public int getLength() {
			return ${t.length!11};
		}
	}
</#if>
</#if>
</#list>
}