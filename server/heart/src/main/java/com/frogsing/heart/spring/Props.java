package com.frogsing.heart.spring;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.frogsing.heart.utils.B;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * Description:
 *
 * @author <a href="mailto:fanyijie@frogsing.com">ajie</a>
 * @since version1.0
 */
public class Props extends
        PropertyPlaceholderConfigurer {
    private static Map<String, String> ctxPropertiesMap;

    @Override
    protected void processProperties(
            ConfigurableListableBeanFactory beanFactoryToProcess,
            Properties props) throws BeansException {
        super.processProperties(beanFactoryToProcess, props);
        ctxPropertiesMap = new HashMap<String, String>();
        for (Object key : props.keySet()) {
            String keyStr = key.toString();
            String value = props.getProperty(keyStr);
            ctxPropertiesMap.put(keyStr, value);
        }
    }

    public static String get(String name) {
        return ctxPropertiesMap.get(name);
    }

    public static String get(String name,String defaultval) {
        String val=ctxPropertiesMap.get(name);
        return B.Y(val)?defaultval:val;
    }

    public static int getInt(String name) {
        return Integer.parseInt(ctxPropertiesMap.get(name));
    }

    public static int getInt(String name,int defval) {
        String val=ctxPropertiesMap.get(name);
        return B.Y(val)?defval:Integer.parseInt(val);
    }
}
