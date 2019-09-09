package com.frogsing.parameter.utils;

import com.frogsing.heart.utils.F;

import java.util.function.DoubleConsumer;

@SuppressWarnings("unchecked")
public class MoneyUtils {


	public static void  add( Double y, Double yy, DoubleConsumer setF){

		double f= F.add(y==null?0D:y,yy==null?0D:yy);
		setF.accept(F.roundMoney(f));

	}
	public static void  substract( Double y, Double yy, DoubleConsumer setF){

		double f= F.substract(y==null?0D:y,yy==null?0D:yy);
		setF.accept(F.roundMoney(f));

	}

	public static String  money(Double value){
		if(value==null)
			return "";
		return F.toMoney(value);
	}

}
