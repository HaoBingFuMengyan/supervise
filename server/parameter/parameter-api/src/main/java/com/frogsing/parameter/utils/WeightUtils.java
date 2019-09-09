package com.frogsing.parameter.utils;

import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.F;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.util.StringUtil;

import java.text.DecimalFormat;
import java.util.function.DoubleConsumer;
import java.util.function.IntConsumer;

@SuppressWarnings("unchecked")
public class WeightUtils {

	public static void  add(Integer x, Double y, Integer xx, Double yy, IntConsumer setI, DoubleConsumer setF){
		int i = (x==null?0:x)+(xx==null?0:xx);
		double f= F.add(y==null?0D:y,yy==null?0D:yy);
		setF.accept(f);
		setI.accept(i);
	}
	public static void  add( Double y, Double yy, DoubleConsumer setF){

		double f= F.add(y==null?0D:y,yy==null?0D:yy);
		setF.accept(f);

	}

	public static String  weight(Double value){
		DecimalFormat df = new DecimalFormat("##0");
		if (value == null)
			return "";
		else if (F.compareWeight(value,0) == 0)
			return "0";
		else
			return df.format(value);
	}

}
