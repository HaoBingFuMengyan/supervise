/** 
 * Filename PageTag.java
 * Create on 2013-11-18
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.web.taglib;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class PageTag extends SimpleTagSupport {
	private static Object o=new Object();
	private static Configuration s;
	private String pageobj;
	
	private String url="";

	public void setPageobj(String pageobj) {
		this.pageobj = pageobj;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public static Configuration getCfg(){
		if(s==null){
			synchronized (o) {
				if(s==null){
					s=new Configuration(Configuration.VERSION_2_3_0); 
			        //获得模板地址  
			        s.setClassForTemplateLoading(PageTag.class, "template");
			        s.setObjectWrapper(new DefaultObjectWrapper()); 
			        s.setEncoding(Locale.CHINESE, "utf-8");
				}
			}
			
		}
		return s;
	}
	@Override
	public void doTag() throws JspException, IOException {
		Object page=this.getJspContext().findAttribute(pageobj);
		
        Template template = getCfg().getTemplate("page.ftl");  
        Map<String, Object> map = new HashMap<String, Object>();  
        map.put("page", page);  
        map.put("url", url);
        JspWriter out = this.getJspContext().getOut();  
        try {
			template.process(map, out);
		} catch (TemplateException e) {
			
			e.printStackTrace();
		}  
        out.flush();  
	}

}
