/** 
 * Filename FormatTag.java
 * Create on 2014-3-13
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.web.taglib;

import com.frogsing.heart.spring.Props;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.DateUtils;
import com.frogsing.heart.utils.F;
import com.frogsing.heart.utils.MoneyToChinese;

import org.apache.commons.lang3.StringUtils;
import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import java.io.IOException;
import java.util.Date;

/**
 * Description:
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class FormatTag extends RequestContextAwareTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String label;
	private Object value;
	private String def = ""; // 为空时的默认值
	private String format;
	private String el;

	public String getEl() {
		return el;
	}

	public void setEl(String el) {
		this.el = el;
	}

	public void setLabel(String label) {
		this.label = label;
	}


	public void setDef(String def) {
		this.def = def;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	enum datetype {
		flag, pasthours, aftertime, lefttime, money, percent, thpercent, date, cdate, utcdate, jpdate, time, datetime, monthdate, weight, weight2, price, price0, dateformat, bigmoney, yuannorm, low_yuannorm, big_yuannorm, round_yuannorm, inout, substrbefor, substrafter, monthlyrate, prop, servertime, longtime, toint,bigchinese
	}

	@Override
	protected int doStartTagInternal() throws Exception {

		String disValue = def;
		datetype d = datetype.valueOf(label);
		switch (d) {
		case prop: {
			if (this.value==null)
				break;
			disValue = Props.get(this.value.toString());
			break;
		}
		case inout: {
			if (this.value==null) {
				disValue = "";
			} else {
				Integer i = Integer.parseInt(this.value.toString());
				switch (i) {
				case 0:
				case 10:
				case 20:
				case 90:
					disValue = "-";
					break;
				case 1:
				case 31:
				case 100:
				case 21:
					disValue = "+";
					break;
				default:
					break;
				}
			}
			break;
		}
		case toint: {
			if (this.value==null) {
				disValue = "0";
			} else {
				double d2 = Double.parseDouble(this.value.toString());
				Integer i = (int) d2;
				disValue = String.valueOf(i);
				break;
			}
			break;
		}
		case aftertime: {
			try {
				if (B.N(el)) {

					Date d1 = (Date) ExpressionEvaluatorManager.evaluate("", "${" + el + "}", Date.class,
							this.pageContext);
					if (d1 != null)
						disValue = DateUtils.getAfterTime(d1);
					else
						disValue = "";
				} else if (value !=null)
					disValue = DateUtils.getAfterTime((Date)value);
			} catch (Exception ex) {

			}
			break;
		}
		case lefttime: {
			try {
				if (B.N(el)) {

					Date d1 = (Date) ExpressionEvaluatorManager.evaluate("", "${" + el + "}", Date.class,
							this.pageContext);
					if (d1 != null)
						disValue = DateUtils.getLeftTime(d1);
					else
						disValue = "";
				} else if (value !=null)
					disValue = DateUtils.getLeftTime((Date)value);
			} catch (Exception ex) {

			}
			break;
		}
		case pasthours: {
			try {
				if (value!=null)
					disValue = DateUtils.getTimeInterval((Date)value);
			} catch (Exception ex) {

			}
			break;
		}
		case money: {
			try {
				if (value==null) {
					if (B.Y(def))
						value = "0.00";
				}
				if (B.Y(format)) {

					disValue = F.toMoney(F.roundMoney(Double.valueOf(value.toString())));
				}
				else
					disValue = F.toMoney(Double.valueOf(value.toString()), format);
			} catch (Exception e) {
			}
			break;
		}
		case percent: {
			try {
				if (value!=null)
					disValue = String.format("%1$.2f", F.cutDouble(Double.valueOf(value.toString()), 2));
				else if (B.Y(def))
					disValue = "0";
			} catch (Exception e) {
			}
			break;
		}
		case thpercent: {
			try {
				if (B.Y(def))
					disValue = "error def";
				else {
					int i = Integer.parseInt(def);
					if (i > 3)
						disValue = "100";
					else
						disValue = String.format("%1$.0f", F.cutDouble(Double.valueOf(value.toString()) * 100, 0));
				}
			} catch (Exception e) {
			}
			break;
		}
		case date: {
			try {
				disValue = "";
				if (B.N(el)) {   

					Date d1 = (Date) ExpressionEvaluatorManager.evaluate("", "${" + el + "}", Date.class,
							this.pageContext);
					if (d1 != null){
						disValue = DateUtils.dateParseString(d1);
					}
				} 
				if(value!=null){
					
					if (value instanceof Date){
						disValue = DateUtils.dateToString((Date)value, "yyyy-MM-dd");
					}
					if( value instanceof String && StringUtils.isEmpty(value.toString())){  //这里的时间字符串必须是规范的时间字符串
						disValue = DateUtils.dateToString(DateUtils.convertToDate((String)value), "yyyy-MM-dd");
					}
				}
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		}
		case cdate: {
			try {
				if (B.N(el)) {

					Date d1 = (Date) ExpressionEvaluatorManager.evaluate("", "${" + el + "}", Date.class,
							this.pageContext);
					if (d1 != null)
						disValue = DateUtils.dateToString(d1, "yyyy年MM月dd日");
					else
						disValue = "";
				} else if (value!=null)
					disValue = DateUtils.dateToString((Date)value, "yyyy年MM月dd日");
			} catch (Exception e) {
			}
			break;
		}
		case utcdate: {
			try {
				if (value!=null)
					disValue = DateUtils.dateToUTCString((Date)value);
			} catch (Exception e) {
			}
			break;
		}
		case jpdate: {
			try {
				if (value!=null)
					disValue = DateUtils.dateToString((Date)value,B.Y(format) ? "yyyy年MM月dd日  HH:mm" : format);
			} catch (Exception e) {
			}
			break;
		}
		case time: {
			try {
				if (B.N(el)) {

					Date d1 = (Date) ExpressionEvaluatorManager.evaluate("", "${" + el + "}", Date.class,
							this.pageContext);
					if (d1 != null)
						disValue = DateUtils.dateToString(d1, "HH:mm:ss");
					else
						disValue = "";
				} else if (value!=null)
					disValue = DateUtils.dateToString((Date)value, "HH:mm:ss");
			} catch (Exception e) {
			}
			break;
		}
		case dateformat: {
			try {
				if (value!=null)
					disValue = DateUtils.dateToString((Date)value, format);
			} catch (Exception e) {
			}
			break;
		}
		case datetime: {
			try {
				if (B.N(el)) {

					Date d1 = (Date) ExpressionEvaluatorManager.evaluate("", "${" + el + "}", Date.class,
							this.pageContext);
					if (d1 != null)
						disValue = DateUtils.dateToString(d1, "yyyy-MM-dd HH:mm:ss");
					else
						disValue = "";
				} else if (value!=null)
					disValue = DateUtils.dateToString((Date)value, "yyyy-MM-dd HH:mm:ss");
			} catch (Exception e) {
			}
			break;
		}
		case monthdate: {
			try {
				if (value!=null)
					disValue = DateUtils.dateToString((Date)value, "MM-dd");
			} catch (Exception e) {
			}
			break;
		}
		case weight: {
			try {
				if (value!=null)
					disValue = F.toWeight(Double.valueOf(value.toString()));
				else if (B.Y(def))
					disValue = F.toWeight(0);
			} catch (Exception e) {
			}
			break;
		}
		case weight2: {
			try {
				if (value!=null)
					disValue = F.toWeight2(Double.valueOf(value.toString()));
				else if (B.Y(def))
					disValue = F.toWeight(0);
			} catch (Exception e) {
			}
			break;
		}
		case price: {
			try {
				if (value==null) {
					if (B.Y(def))
						value = "0.00";
				}
				if (B.Y(format))
					disValue = F.toMoney(Double.valueOf(value.toString()));
				else
					disValue = F.toMoney(Double.valueOf(value.toString()), format);
			} catch (Exception e) {
			}
			break;
		}
		case flag: {
			value=value==null?"":value;
			if (value.equals("1") || (value.equals("") && B.equals(def, "1"))) {
				disValue = "是";
			} else {
				disValue = "否";
			}
			break;
		}
		case price0: {
			try {
				if (value==null) {
					if (B.Y(def))
						value = "0";
				}
				if (B.Y(format))
					disValue = F.toMoney(Double.valueOf(value.toString()), "#,##0");
				else
					disValue = F.toMoney(Double.valueOf(value.toString()), format);
			} catch (Exception e) {
			}
			break;
		}
		case bigmoney: {
			try {
				if (value!=null)
					disValue = MoneyToChinese.NumToCNMoney(Double.valueOf(value.toString()));
			} catch (Exception e) {

			}
			break;
		}

		case bigchinese:{
			try {
				if (value!=null)
					disValue = MoneyToChinese.NumToCN(Double.valueOf(value.toString()));
			} catch (Exception e) {

			}
			break;
		}

		case yuannorm: {
			double yuannorm = 0;
			try {
				if (value!=null)
					yuannorm = F.divide(Double.valueOf(value.toString()), 10000);
			} catch (Exception e) {

			}
			yuannorm = Math.floor(yuannorm);
			disValue = String.valueOf(yuannorm);
			break;
		}
		case low_yuannorm: {
			double low_yuannorm = 0;
			try {
				if (value!=null)
					low_yuannorm = Math.floor(F.divide(Double.valueOf(value.toString()), 10000));
			} catch (Exception e) {
			}
			disValue = String.valueOf(low_yuannorm);
			break;
		}
		case big_yuannorm: {
			double big_yuannorm = 0;
			try {
				if (value!=null)
					big_yuannorm = Math.ceil(F.divide(Double.valueOf(value.toString()), 10000));
			} catch (Exception e) {
			}
			disValue = String.valueOf(big_yuannorm);
			break;
		}
		case round_yuannorm: {
			double round_yuannorm = 0;
			try {
				if (value!=null)
					round_yuannorm = Math.round(F.divide(Double.valueOf(value.toString()), 10000));
			} catch (Exception e) {
			}
			disValue = String.valueOf(round_yuannorm);
			break;
		}
		case substrafter: {
			try {
				disValue = value==null? "" : value.toString();
				if (value!=null && B.N(format)) {
					int b = value.toString().length() - Integer.valueOf(format);
					disValue = value.toString().substring(b = b < 0 ? 0 : b, value.toString().length());
				}
			} catch (Exception e) {
			}
			break;
		}
		case substrbefor: {
			try {
				disValue = value==null? "" : value.toString();
				if (value!=null && B.N(format)) {
					int b = value.toString().length() > Integer.valueOf(format) ? Integer.valueOf(format) : value.toString().length();
					disValue = value.toString().substring(0, b);
				}
			} catch (Exception e) {
			}
			break;
		}
		case monthlyrate: {
			try {
				disValue = value==null? "" : value.toString();
				if (value!=null) {
					disValue = String.valueOf(F.divide(Double.valueOf(value.toString()), 12, 2));
				}
			} catch (Exception e) {
			}
			break;
		}
		case longtime: {
			Date date = value==null?null:(Date)value;
			if (date != null)
				disValue = String.valueOf(date.getTime());
			break;
		}
		default: {
			disValue = value==null?"":value.toString();
			break;
		}
		}
		try {
			// JspWriter out = this.getJspContext().getOut();
			this.pageContext.getOut().append(disValue);
			// out.append(disValue);
		} catch (IOException e) {

			e.printStackTrace();
		}
		return 0;
	}



}
