<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
<#assign fname=flower1(toJavaName(object())) />
<#assign oname=toJavaName(object()) />
package ${pack()}.${toPackageName(entity.code)}.web;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import com.frogsing.heart.action.ExtBaseAction;
import com.frogsing.bone.common.po.${toPackageName(entity.code)}.${toJavaName(object())};
import com.frogsing.bone.common.service.${toPackageName(entity.code)}.${toJavaName(object())}Service;
import com.frogsing.heart.utils.web.Struts2Utils;
import org.apache.commons.lang.StringUtils;

@Namespace("/manage/${toPackageName(entity.code)}")
public class ${toJavaName(object())}Action extends ExtBaseAction<${toJavaName(object())}> {

	private ${oname}Service ${fname}Service;// 会员service
	@Autowired
	public void set${oname}Service(${oname}Service ${fname}Service) {
		this.${fname}Service = ${fname}Service;
	}
	private ${oname} ${fname}=new ${oname}();

	public void set${oname}(${oname} ${fname}) {
		this.${fname} = ${fname};
	}

	@Override
	public ${oname} getModel() {
		return ${fname};
	}
	
	/**
	 * ${entity.name}列表
	 * String
	 */
	public void getAll(){

		try { 
			page.setPageNo(pageNo());
			page= ${fname}Service.getPage(page);
			outPageJSONArray(page.getTotalCount(),page.getResult());
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改或添加${entity.name}
	 * void
	 */
	public void save(){
		try {
			
			${fname}Service.save(${fname},id);
			Struts2Utils.render("text/html;charset=utf-8", "{success:true}", "no-cache:false");
		} catch (Exception e) {
			e.printStackTrace();
			Struts2Utils.render("text/html;charset=utf-8", "{success:false,msg:'"
					+ e.getMessage() + "'}", "no-cache:false");
		}
	}
	
	/**
	 * 删除${entity.name}
	 * void
	 * @throws IOException 
	 */
	public void delete (){
		try{
			${fname}Service.delete(checkboxId);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			failure(e.getMessage());
		}
	}
	
	public void prepareSave() throws Exception {
		if(B.N(id)){
			${fname} = ${fname}Service.getById(id);
		}
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
