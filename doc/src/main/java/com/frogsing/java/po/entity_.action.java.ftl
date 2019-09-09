<#include  "/function.ftl">
<#t>
<#macro entityM entity>
<#assign fname=toJavaName(object())?lower_case />
<#assign oname=toJavaName(object()) />
package ${pack()}.${toPackageName(entity.code)};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.frogsing.po.entity.${toPackageName(entity.code)}.${toJavaName(entity.code)};
import com.frogsing.service.${toPackageName(entity.code)}.${toJavaName(entity.code)}Service;
import com.frogsing.admin.web.ExtBaseController;
import com.frogsing.heart.jpa.BaseService;
@Controller
@RequestMapping(value = "/${toPackageName(entity.code)}/${fname}")
public class ${toJavaName(entity.code)}Controller extends ExtBaseController<${toJavaName(entity.code)},${toJavaName(entity.code)}> {
	
	
	@Override
	protected String getPackName() {
		
		return "${toPackageName(entity.code)}";
	}
	@Override
	protected String getObjectName() {
		return "${fname}";
	}
	@Override
	protected BaseService<${toJavaName(entity.code)}> getBaseService() {
		
		return ${fname}Service;
	}

	
	@Autowired
	private ${toJavaName(entity.code)}Service ${fname}Service;
	
	

	
	

	
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
