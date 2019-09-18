package com.frogsing.heart.spring;

import org.springframework.web.context.ConfigurableWebApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.XmlWebApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

public class ContextLoaderListenerEx extends ContextLoaderListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
//        System.setProperty("dubbo.application.logger","slf4j");
		System.setProperty("druid.logType","slf4j");
		System.setProperty("org.jboss.logging.provider","slf4j");

		super.contextInitialized(event);

	}
	@Override
	protected void customizeContext(ServletContext sc, ConfigurableWebApplicationContext wac) {
		super.customizeContext(sc,wac);
		XmlWebApplicationContext context = (XmlWebApplicationContext) wac;
		context.setAllowBeanDefinitionOverriding(true);

	}

}
