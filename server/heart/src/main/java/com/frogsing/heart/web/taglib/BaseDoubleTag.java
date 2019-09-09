package com.frogsing.heart.web.taglib;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public abstract class BaseDoubleTag extends SimpleTagSupport implements IBaseDoubleTag {

	private Double val;
	private String op;
	
	public Double getVal() {
		return val;
	}

	public void setVal(Double val) {
		this.val = val;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	@Override
	public void doTag() throws JspException, IOException {
		String z="0";
		for(int i=1;i<this.getPrecision();i++)
			z+="0";
		DecimalFormat df = new DecimalFormat("0."+z);
		String rs;
		if(val!=null)
			rs=df.format(val);
		else
			rs="";
		this.getJspContext().getOut().write(rs);
	}

}
