package com.frogsing.heart.web;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.F;

import java.io.Serializable;

public class TNumberWeight  implements Serializable{

	public TNumberWeight(){

	}
	public TNumberWeight(String id,long inumber,double fweight,double fprice){
		this.id=id;
		this.inumber=inumber;
		this.fweight=fweight;
		this.fprice=fprice;
	}
	public TNumberWeight(String id,long inumber,double fweight){
		this.id=id;
		this.inumber=inumber;
		this.fweight=fweight;
	}
	public TNumberWeight(long inumber,double fweight){
		this.inumber=inumber;
		this.fweight=fweight;
	}
	String id;
	Long inumber;
	Double fweight;

	public Double getFprice() {
		return fprice;
	}

	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}

	private Double fprice;


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getInumber() {
		return inumber;
	}
	public void setInumber(Long inumber) {
		this.inumber = inumber;
	}
	public Double getFweight() {
		return fweight;
	}
	public void setFweight(Double fweight) {
		this.fweight = fweight;
	}



    public void priceisok(String ... msg) {
		String a="价格";
		if(msg.length>0)
			a=msg[0];
		if(fprice==null)
			E.S(a+"不能为空");
		if(F.compareMoney(fweight,0)<=0)
			E.S(a+"必须大于0");

    }

	public void weightisok(String ... msg) {
		String a="重量";
		if(msg.length>0)
			a=msg[0];

		if(fweight==null)
			E.S(a+"不能为空");
		if(F.compareMoney(fweight,0)<=0)
			E.S(a+"必须大于0");
	}
}
