/** 
 * FreeMarkerUtils.java
 * create on 2012-3-30
 * Copyright 2020 Todaysteel All Rights Reserved.
 */
package com.frogsing.heart.freemarker;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

/**
 * freemarker工具类
 * 
 * @author <a href=" mailto:haifeng.cauc@gmail.com">chain</a>
 * @since version1.0
 */
public class FreeMarkerUtils {
	/**
	 * 使用freemarker模版替换技术
	 * 
	 * @param params
	 *            , 参数集合, params中可以包含对象及多级对象
	 * @param content
	 *            , 要替换的文本
	 * @return
	 * @throws IOException
	 * @throws TemplateException
	 */
	public static String renderModel(Map<String, Object> params,
			String content) throws IOException, TemplateException {
		StringTemplateLoader loader = new StringTemplateLoader(); // 模版加载器
		loader.putTemplate("chain", content);
		Configuration config = new Configuration(Configuration.VERSION_2_3_0);
		config.setTemplateLoader(loader);
		Template template = config.getTemplate("chain", "UTF-8");
		StringWriter out = new StringWriter();

		template.process(params, out);
		return out.toString();
	}
}
