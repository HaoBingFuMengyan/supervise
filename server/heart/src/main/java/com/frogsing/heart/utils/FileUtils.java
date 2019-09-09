/** 
 * Filename FileUtils.java
 * Create on 2014-3-7
 * Copyright 2014 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.utils;

import java.io.FileWriter;
import com.frogsing.heart.exception.E;

/**
 * Description:
 * 
 * @author <a href="mailto:zhanghaifeng@frogsing.com">chain</a>
 * @since version1.0
 */
public class FileUtils {

	/**
	 * 创建txt文件到临时目录并返回目录+文件名
	 * 
	 * @param filename
	 *            ,绝对路径
	 * @param content
	 *            ,文本内容
	 */
	public static void WriteTxtFile(String filename, String content) {
		try {
			FileWriter fw = new FileWriter(filename);
			fw.write(content);
			fw.flush();
			fw.close();
		} catch (Exception e) {
			E.S("资源单txt文件创建出错");
		}
	}
}