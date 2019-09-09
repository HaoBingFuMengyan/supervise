package com.frogsing.heart.utils;


import java.util.Date;

/**
 * 当前交易日期工具类
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */

public class TradeDateUtils {
	
	
	/**
	 * 取得当前的交易日期
	 * @return
	 */
	public static Date getCurrentTradeDate() {
		return DateUtils.getCurrentDateTime();
	}
	
	
}
