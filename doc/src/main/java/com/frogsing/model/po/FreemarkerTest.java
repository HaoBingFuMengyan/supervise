package com.frogsing.model.po;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;


public class FreemarkerTest {


	public static void main(String[] args) throws Exception {
		
		String name="test";//模板的名称，随意
		StringTemplateLoader loader=new StringTemplateLoader();//从string模板数据
		loader.putTemplate(name,"${u.id}"); //加入模板文本（可以多个），例如包含文件）
		Configuration config=new Configuration();//默认配置
		config.setTemplateLoader(loader);//设置模板
	//	Template tmp=config.getTemplate(name);//获取格式化后的模板，
	//	StringWriter result = new StringWriter();//输出
		
	//	Map<Object,Object> map=new HashMap<Object,Object>();//设置root 模型
		
		//MemberBase u1=new MemberBase();//一个对象准备放入模型
		//u1.setId("sfdsdf");
		//u1.setScountry("中国");
		//map.put("u",u1);
		//tmp.process(map,result);
		//System.out.print(result.toString());
		
		
		
		
		
	}
}
