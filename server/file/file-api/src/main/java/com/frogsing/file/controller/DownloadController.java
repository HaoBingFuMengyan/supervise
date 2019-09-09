/** 
 * Filename DownloadController.java
 * Create on 2014年11月4日
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.file.controller;

import com.frogsing.file.utils.FtpUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.DL;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
@Controller
public class DownloadController {
	
	@RequestMapping("/download.html")
	public void download(
			@RequestParam(value="path",defaultValue="") String path,
			@RequestParam(value="filename",defaultValue="") String filename,
			HttpServletResponse response){
		ServletOutputStream out = null;
		InputStream inputStream = null;
		try {
			if (B.N(path)) {
				response.setCharacterEncoding("UTF-8");
				if(B.Y(filename))
					filename = path.substring(path.lastIndexOf("/")+1, path.length());
				
				response.setHeader("Content-disposition","attachment;filename=" +filename );
				String postfix = path.substring(path.lastIndexOf(".")+1, path.length());
				response.setContentType(DL.getContentType(postfix));
				
				out = response.getOutputStream();
				if(path.startsWith("/"))
					path=path.substring(1, path.length());
				inputStream=FtpUtils.downloadFile(path);
				byte[] buf = new byte[2048];
				int bufsize = 0;
				while ((bufsize = inputStream.read(buf, 0, buf.length)) != -1) {
					out.write(buf, 0, bufsize);
				}
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(inputStream != null)
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(out != null)
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return; 
	}
	
	@RequestMapping("/export.shtml")
	public void export(
			@RequestParam(value="filecontent",defaultValue="") String filecontent,
			@RequestParam(value="filename",defaultValue="") String filename,
			HttpServletResponse response){
		ServletOutputStream out = null;
		InputStream inputStream = null;
		try {
			if (B.N(filecontent)) {
				response.setCharacterEncoding("UTF-8");
				if(B.Y(filename))
					filename = "export.txt";
				
				response.setHeader("Content-disposition","attachment;filename=" +filename );
				String postfix = filename.substring(filename.lastIndexOf(".")+1, filename.length());
				postfix=postfix.toLowerCase();
				String imgpostfix = "@jpg@jpeg@bmp@gif@png@";
				String docpostfix = "@doc@docx@";
				String txtpostfix = "@txt@";
				String excelpostfix = "@xls@xlsx@";
				String pdfpostfix ="@pdf@";  
				if(imgpostfix.indexOf("@"+postfix+"@") != -1) {
					response.setContentType("image/jpeg");
				} else if (docpostfix.indexOf("@"+postfix+"@") != -1) {
					response.setContentType("application/msword");
				} else if (txtpostfix.indexOf("@"+postfix+"@") != -1) {
					response.setContentType("text/plain");
				} else if (excelpostfix.indexOf("@"+postfix+"@") != -1) {
					response.setContentType("text/xml");
				} else if(pdfpostfix.indexOf("@"+postfix+"@")!=-1){
					response.setContentType("application/pdf");
				}else  {
					response.setContentType("application/octet-stream");
				}
				
				out = response.getOutputStream();
				out.write(filecontent.getBytes("UTF-8"));
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(inputStream != null)
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(out != null)
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return; 
	}

//	@RequestMapping("/clearCache.json")
//	public void clearCache(@RequestParam(value="key",defaultValue="") String key,HttpServletResponse response){
//		if(B.N(key) && key.equals(Props.get("clearkey"))){
//			DisplayUtils.clearcache();
//			ParaUtils.clearcache();
//			K.clearcache();
//		}
//		try {
//			response.setContentType("text/html;charset=UTF-8");
//			response.setCharacterEncoding("UTF-8");
//			response.getWriter().println("清除成功");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
