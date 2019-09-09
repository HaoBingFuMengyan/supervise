<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
<#assign fname=flower1(toJavaName(object())) />
<#assign oname=toJavaName(object()) />
<#assign pname=toPackageName(object()) />
package ${pack()}.${pname};


import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.dao.${toPackageName(entity.code)}.${oname}Dao;
import com.frogsing.po.entity.${toPackageName(entity.code)}.${oname};
import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.heart.jpa.BaseService;

@Component
@Transactional
public class ${oname}Service extends BaseService<${oname}>{
	
	@Autowired
	private ${oname}Dao ${fname}Dao;

	@Override
	protected BaseDao<${oname}, String> getBaseDao(){
		return ${fname}Dao;
	}
	@Override
	protected void BaseSaveCheck(${oname} obj){
	
		
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