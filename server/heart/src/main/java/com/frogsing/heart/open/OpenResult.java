package com.frogsing.heart.open;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;

import java.io.IOException;
import java.io.StringWriter;

public class OpenResult {
	private static ObjectMapper mapper;
	public static Logger log;

	private boolean success;

	public String getMsg() {
		return msg;
	}

	public Object getObj() {
		return obj;
	}

	private String msg;
	private Object obj;

	public boolean getSuccess() {
		return success;
	}

	private OpenResult(boolean flag, String msg, Object obj) {
		this.success = flag;
		this.msg = msg;
		this.obj = obj;
	}

	public static OpenResult success() {
		return new OpenResult(true, null, null);
	}

	public static OpenResult failure() {
		return new OpenResult(false, null, null);
	}

	public static OpenResult success(String msg) {
		return new OpenResult(true, msg, null);
	}

	public static OpenResult failure(String msg) {
		return new OpenResult(false, msg, null);
	}

	public static OpenResult failure(String msg, Object obj) {
		return new OpenResult(false, msg, obj);
	}

	public static OpenResult success(String msg, Object obj) {
		return new OpenResult(true, msg, obj);
	}

	public static OpenResult success(Object obj) {
		return new OpenResult(true, "操作成功", obj);
	}

	public String toJson() {
		return beanToJson(this);
	}

	// 对象tojson
	public static String beanToJson(Object obj) {
		StringWriter writer = null;
		JsonGenerator gen = null;
		try {
			ObjectMapper mapper = getMapperInstance(false);
			writer = new StringWriter();
			gen = new JsonFactory().createGenerator(writer);
			mapper.writeValue(gen, obj);
			gen.close();
			String json = writer.toString();
			writer.close();
			return json;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				if (gen != null && !gen.isClosed()) {
					gen.close();
				}
				if (writer != null) {
					writer.close();
				}
			} catch (IOException e) {
			}
		}
	}

	/**
	 * 获取一个ojectmapper
	 * 
	 * @param createNew
	 * @return
	 */
	public static synchronized ObjectMapper getMapperInstance(boolean createNew) {
		if (createNew) {
			return new ObjectMapper();
		} else if (mapper == null) {
			mapper = new ObjectMapper();
		}
		return mapper;
	}
}
