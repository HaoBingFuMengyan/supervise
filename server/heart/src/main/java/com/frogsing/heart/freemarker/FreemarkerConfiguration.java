/** 
 * Filename FreemarkerConfiguration.java
 * Create on 2014年12月2日
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.freemarker;

import freemarker.template.Configuration;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class FreemarkerConfiguration {

	private static Configuration config = null;  
    
    /** 
     * Static initialization. 
     *  
     * Initialize the configuration of Freemarker. 
     */  
    static{  
        config = new Configuration();  
        config.setClassForTemplateLoading(FreemarkerConfiguration.class, "template");  
    }  
      
    public static Configuration getConfiguation(){  
        return config;  
    }  

}
