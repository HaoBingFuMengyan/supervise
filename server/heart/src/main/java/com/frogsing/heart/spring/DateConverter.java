package com.frogsing.heart.spring;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.frogsing.heart.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

public class DateConverter implements Converter<String, Date> {    
@Override    
public Date convert(String source) {    
    SimpleDateFormat dateFormat;

    return DateUtils.stringToDate(source);
} 
}