<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
<#assign fname=flower1(toJavaName(object())) />
<#assign oname=toJavaName(object()) />
package ${pack()}.${toPackageName(entity.code)}.web;
import org.springframework.beans.factory.annotation.Autowired;
import com.frogsing.heart.action.BaseAction;
import ${pack()}.${toPackageName(entity.code)}.po.${toJavaName(object())};
import ${pack()}.${toPackageName(entity.code)}.service.${toJavaName(object())}Service;


public class ${toJavaName(object())}Action extends BaseAction<${toJavaName(object())}> {

	private ${oname}Service ${fname}Service;// 会员service
	@Autowired
	public void set${oname}Service(${oname}Service ${fname}Service) {
		this.${fname}Service = ${fname}Service;
	}
}
</#macro>
<#macro LL node>
<#list node.tables  as entity>
<#if entity.code==object()>
<@entityM entity=entity/>
<#break/>
<#else>
<@LL node=entity._complexType />
</#if>
</#list>
</#macro>
<@LL node=pdm />
