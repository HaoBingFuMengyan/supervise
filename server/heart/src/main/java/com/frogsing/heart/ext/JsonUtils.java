package com.frogsing.heart.ext;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.frogsing.heart.json.JSONObject;

public class JsonUtils {

	public static <E> String RenderList(Iterable<E> collection, int level) {

		try {
			return  JSONObject.wrap(collection, level).toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "{error:to json error!}";
		}

	}
	public static <E> String RenderList(E[] collection, int level) {

		try {
			return  JSONObject.wrap(collection, level).toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "{error:to json error!}";
		}

	}
	public static String RenderObj(Object obj, int level) {
		return JSONObject.wrap(obj, level).toString();

	}
	
	public static <E> ResponseEntity<String> RenderListEx(Iterable<E> collection ,int... level) {

		try {
			int i=1;
			if(level.length>0)
				i=level[0];
			return toJsonRsponseEntity(JSONObject.wrap(collection, i).toString());
		} catch (Exception e) {
			e.printStackTrace();
			return toJsonRsponseEntity("{error:'to json error!'}");
		}

	}
	

//	public static ResponseEntity<String> RenderObj(Object obj) {
//		return buildRsponseEntity(new JSONObject(obj, 1).toString());
//
//	}

	public static <T> ResponseEntity<String> JsonPage(Page<T> page) {

		return toJsonRsponseEntity(new JSONObject(page, 1).toString());

	}
	public static <T> ResponseEntity<String> JsonPage(Page<T> page,int deep) {

		return toJsonRsponseEntity(new JSONObject(page, deep).toString());

	}
	private static ResponseEntity<String> toJsonRsponseEntity(String rs) {
		HttpHeaders hd = new HttpHeaders();
		hd.setContentType(MediaType.TEXT_PLAIN);
		return new ResponseEntity<String>(rs, hd, HttpStatus.OK);

	}

}
