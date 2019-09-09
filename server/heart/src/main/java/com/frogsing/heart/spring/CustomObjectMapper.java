package com.frogsing.heart.spring;

import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.ser.DefaultSerializerProvider;
import com.fasterxml.jackson.databind.ser.DefaultSerializerProvider.Impl;
import com.fasterxml.jackson.databind.ser.SerializerFactory;

public class CustomObjectMapper extends ObjectMapper {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CustomObjectMapper() {
    	configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false); 
        setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",java.util.Locale.CHINA));
		//setSerializationInclusion(Include.USE_DEFAULTS);
		getSerializerProvider().setNullValueSerializer(new NullToEmptyJsonSerializer());
	}


}

