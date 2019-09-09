/** 
 * Filename HtmlGenerator.java
 * Create on 2014年12月2日
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.freemarker;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.BufferedWriter;
import java.io.File;
import java.io.StringWriter;
import java.util.Locale;
import java.util.Map;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class HtmlGenerator {

	/** 
     * Generate html string. 
     *  
     * @param template   the name of freemarker teamlate. 
     * @param variables  the data of teamlate. 
     * @return htmlStr 
     * @throws Exception 
     */  
    public static String generate(String dir,String template, Map<String,Object> variables) throws Exception{  
        Configuration config = FreemarkerConfiguration.getConfiguation();
        config.setDirectoryForTemplateLoading(new File(dir));
        config.setEncoding(Locale.getDefault(), "UTF-8");
        return HtmlGenerator.build(config, template, variables);
    }  
    /** 
     * Generate html string. 
     *  
     * @param template   the name of freemarker teamlate. 
     * @param variables  the data of teamlate. 
     * @return htmlStr 
     * @throws Exception 
     */  
    public static String generate(Class clazz,String dir,String template, Map<String,Object> variables) throws Exception{  
    	Configuration config = FreemarkerConfiguration.getConfiguation();
    	//config.setClassForTemplateLoading(clazz, dir);
    	config.setDirectoryForTemplateLoading(new File(dir));
    	config.setEncoding(Locale.getDefault(), "UTF-8");
    	return HtmlGenerator.build(config, template, variables);
    } 
    
    private static String build(Configuration config,String template,Map<String,Object> variables) throws Exception{
    	Template tp = config.getTemplate(template);  
    	StringWriter stringWriter = new StringWriter();    
    	BufferedWriter writer = new BufferedWriter(stringWriter);    
    	tp.setEncoding("UTF-8");    
    	tp.process(variables, writer);    
    	String htmlStr = stringWriter.toString();  
    	writer.flush();    
    	writer.close();  
    	return htmlStr; 
    }

}
