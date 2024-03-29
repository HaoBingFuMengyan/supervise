<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
<#assign fname=flower1(toJavaName(object())) />
<#assign oname=toJavaName(object()) />
package ${pack()}.${toPackageName(entity.code)}.service.;
import ${pack()}.${toPackageName(entity.code)}.dao.${oname}Dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import ${pack()}.${toPackageName(entity.code)}.po.${toPackageName(entity.code)}.${oname};
import ${pack()}.heart.exception.ServiceException;
import ${pack()}.heart.po.Page;
import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Criterion;
@Component
@Transactional

public class ${oname}Service {

	private ${oname}Dao ${fname}Dao;
	@Autowired
	public void set${oname}Dao(${oname}Dao ${fname}Dao) {
		this.${fname}Dao = ${fname}Dao;
	}
		/**
	 * 根据参数查询${entity.name}列表
	 * Page<${oname}>
	 */
	@Transactional(readOnly = true)
	public Page<${oname}> getPage(Page<${oname}> page, final Criterion... criterions){
		${fname}Dao.find(criterions);
		return ${fname}Dao.findPage(page, criterions);
	}
	
	/**
	 * 根据id查询${entity.name}对象
	 * ${oname}
	 */
	@Transactional(readOnly = true)
	public ${oname} getById(String id){
		return ${fname}Dao.get(id);
	}
	
	/**
	 * 保存${entity.name}对象
	 * void
	 */
	public void save (${oname} ${fname},String id){
	
		if(B.Y(id)){
			${fname}.setId(null);
		}
		${fname}Dao.save(${fname});
		
		
			
		
	}
	
	/**
	 * 删除${entity.name}
	 * void
	 */
	public void delete(String [] ids) throws ServiceException {
		try{
			for (String id : ids) {
				if(B.N(id)){
					if(${fname}Dao.get(id)!=null){
						${fname}Dao.delete(id);
					}	
				}
			}
		}catch (Exception ex){
			ex.printStackTrace();
			throw new ServiceException("删除${entity.name}失败");
		}
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