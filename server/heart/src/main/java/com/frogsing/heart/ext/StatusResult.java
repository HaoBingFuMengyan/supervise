package com.frogsing.heart.ext;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import com.frogsing.heart.json.JSONObject;


public class StatusResult {

		private int status;
		/*
		 * 0 请求成功!
		 * 1 没有权限
		 * 2其他故障 msg显示错误消息
		 */
		private int op=0;
		/**
		 * 0 普通操作
		 * 
		 */
		private String msg;
		
		public static StatusResult success(){
			StatusResult s=new StatusResult();
			s.status=0;
			s.msg="";
			return s;
		}
		public static StatusResult success(String msg){
			StatusResult s=new StatusResult();
			s.status=0;
			s.msg=msg;
			return s;
		}
		public static StatusResult fail(String msg)  {
			StatusResult s=new StatusResult();
			s.status=2;
			
			try {
				s.msg=java.net.URLEncoder.encode(msg,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				
				e.printStackTrace();
				s.msg=msg;
			}
			return s;
		}
		public static StatusResult fail(){
			StatusResult s=new StatusResult();
			s.status=2;
			s.msg="";
			return s;
		}
		public int getStatus() {
			return status;
		}

//		public void setStatus(int status) {
//			this.status = status;
//		}

		public int getOp() {
			return op;
		}

//		public void setOp(int op) {
//			this.op = op;
//		}

		public String getMsg() {
			return msg;
		}

//		public void setMsg(String msg) {
//			this.msg = msg;
//		}

		public void  toHead(HttpServletResponse response) {
			try{
				//response.setContentType("text/html");
				//response.getWriter().write( new JSONObject(this, 1).toString());
				
				response.setHeader("Content-type", "text/html;charset=UTF-8");
				response.setHeader("frog", new JSONObject(this, 1).toString());
			//	response.setHeader("Access-Control-Allow-Origin","*");
			 //	response.setHeader("Access-Control-Expose-Headers","frog");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
}
