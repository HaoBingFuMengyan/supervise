/** 
 * Filename PageTag.java
 * Create on 2013-11-18
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.web.taglib;

import com.frogsing.common.utils.FrogUtils;
import com.frogsing.heart.web.vo.FrogVo;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class FrogTag extends SimpleTagSupport {
	private String name;

	
	


	public void setName(String name) {
		this.name = name;
	}





	@Override
	public void doTag() throws JspException, IOException {
		//String frog="category";
		List<FrogVo> list=FrogUtils.getAllFrog(name);		
		Configuration cfg = new Configuration(Configuration.VERSION_2_3_0);
        //获得模板地址  
        cfg.setClassForTemplateLoading(getClass(), "template");
        cfg.setObjectWrapper(new DefaultObjectWrapper(Configuration.VERSION_2_3_0));
        Template template = cfg.getTemplate("frog-"+name+".ftl");  
        Map<String, Object> map = new HashMap<String, Object>();  
        map.put("list", list);  
        JspWriter out = this.getJspContext().getOut();  
        try {
			template.process(map, out);
		} catch (TemplateException e) {
			
			e.printStackTrace();
		}  
        out.flush();  
	}

}
