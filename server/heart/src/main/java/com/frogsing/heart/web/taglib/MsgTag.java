/** 
 * TipMessageTag.java
 * create on 2011-3-2
 * Copyright 2020 Todaysteel All Rights Reserved.
 */
package com.frogsing.heart.web.taglib;

import java.io.IOException;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.frogsing.heart.web.Msg;


/**
 * 前置页面提示消息标签
 * 
 * @author <a href="mailto:service@frogsing.com">frogsing</a>
 * @since version1.0
 */
public class MsgTag extends  RequestContextAwareTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2610696397392412205L;

	@Override
	protected int doStartTagInternal() throws Exception {
		Msg msg=(Msg)this.pageContext.getRequest().getAttribute("message");
		StringBuffer bf=new StringBuffer();
		if(msg!=null){
			
			bf.append("<div class=\"mtip_msg\" id=\"tipDivID\">");
			bf.append("<p class=\"mtip_x\" id=\"closeTipID\">&nbsp;</p>");
			switch (msg.getType()) {
			case 0:
				bf.append("<p class=\"ok\">"+msg.getTitle()+"</p>");
				break;
			case 1:
				bf.append("<p class=\"error\">"+msg.getTitle()+"</p>");
				break;
			case 2:
				bf.append("<p class=\"attention\">"+msg.getTitle()+"</p>");
				break;
			case 3:
				bf.append("<p class=\"tips\">"+msg.getTitle()+"</p>");
				break;
			default:
				break;
			}
			bf.append("</div>");
			
		}
		else{
			bf.append("<div class=\"mtip_msg\" style=\"display:none\" id=\"tipDivID\">");
			bf.append("<p class=\"mtip_x\" id=\"closeTipID\">&nbsp;</p>");
			bf.append("</div>");
		}
		try {
			this.pageContext.getOut().append(bf);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return 0;
	}
	
//	private String msg.getTitle();
//	private String type;
//	
//	
//
//	public void setMessage(String msg.getTitle()) {
//		this.msg.getTitle() = msg.getTitle();
//	}
//
//
//
//	public void setType(String type) {
//		this.type = type;
//	}


 

}
