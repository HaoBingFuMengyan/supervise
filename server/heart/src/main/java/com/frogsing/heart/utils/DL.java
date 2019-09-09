/**
 * 
 */
package com.frogsing.heart.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * @author wesson
 *下载工具类
 */
public class DL {
	
	private static Map<String,String> map=new HashMap<String, String>();
	static{
		map.put("@BMP@","image/bmp");   
		map.put("@GIF@","image/gif");   
		map.put("@JPEG@JPG@","image/jpeg");   
		map.put("@TIFF@","image/tiff");   
		map.put("@DCX@","image/x-dcx");   
		map.put("@PCX@","image/x-pcx");   
		map.put("@HTML@","text/html");   
		map.put("@TXT@","text/plain");   
		map.put("@XML@","text/xml");   
		map.put("@AFP@","application/afp");   
		map.put("@PDF@","application/pdf");   
		map.put("@RTF@","application/rtf");   
		map.put("@DOC@DOCX@","application/msword");   
		map.put("@XLS@XLSX@","application/vnd.ms-excel");   
		map.put("@PPT@PPTX@","application/vnd.ms-powerpoint");   
		map.put("@WORDPERFECT@","application/wordperfect5.1");   
		map.put("@WORDPRO@","application/vnd.lotus-wordpro");   
		map.put("@VISIO@","application/vnd.visio");   
		map.put("@FTL@","application/vnd.framemaker");   
		map.put("OTHER","application/octet-stream");   
	}
	
	public static String getContentType(String type){
		for(Entry<String,String> entry:map.entrySet()){
			if(entry.getKey().contains("@"+type.toUpperCase()+"@"))
				return entry.getValue();
		}
		return map.get("OTHER");
	}
}
