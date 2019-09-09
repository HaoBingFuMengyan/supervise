package com.frogsing.heart.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;

import com.frogsing.heart.security.utils.MD5;
import com.google.common.collect.Lists;

/**
 * 授权文件加载
 * @author wesson
 *
 */
public class AuthFileUtils {
	
	public static List<String> auth=Lists.newArrayList();
	public final static String FILE_NAME="/authfile/auth.key";
	
	public static void init(){
		String path=AuthFileUtils.class.getClassLoader().getResource("").getPath();
		File file=new File(path+FILE_NAME);
		if(file == null || !file.isFile() || !file.exists()){
			auth.clear();
			return;
		}
		BufferedReader reader=null;
		String tempString="";
		try {
			reader=new BufferedReader(new FileReader(file));
			while ((tempString = reader.readLine()) != null) {
				auth.add(tempString);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String encode(String... strs){
		String bf="";
		if(strs == null || strs.length == 0)
			return "";
		for(String s:strs)
			bf=bf+(B.Y(bf)?"":"~|~")+s;
		return MD5.encode(bf+"frogsingWaming911");
	}
	public static void main(String[] args) {
		System.out.println(encode("1000","常州源佳新材料有限公司","源佳库"));
	}

}
