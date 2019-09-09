/**
 * Filename FreemarkUtils.java
 * Create on 2014年4月3日
 * Copyright 2014 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * Description: freemark相关工具
 * 
 * @author <a href="mailto:zhanghaifeng@frogsing.com">chain </a>
 * @since version1.0
 */
public class FreemarkUtils {

	/**
	 * 渲染模板
	 * 
	 * @param content
	 *            ,模板
	 * @param params
	 *            ,参数集合
	 * @return
	 * @throws IOException
	 * @throws TemplateException
	 */
	public static String render(String content, Map<String, Object> params)
			throws IOException, TemplateException {
		StringTemplateLoader loader = new StringTemplateLoader(); // 模版加载器
		loader.putTemplate("chain", content);
		Configuration config = new Configuration();
		config.setTemplateLoader(loader);
		Template template = config.getTemplate("chain", "UTF-8");
		StringWriter out = new StringWriter();

		template.process(params, out);
		return out.toString();
	}
}
