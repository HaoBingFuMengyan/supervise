package com.frogsing.parameter.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "sys_systempara")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class SystemParaBase  extends  BaseEntity{
	
	private   String snamepara; //名称 String
	private   String svaluepara; //内容 String
	private   String sremarks; //说明 String
	   /**
		名称 String
		*/
		@Column(name="snamepara",length=50)
		public String getSnamepara() {
			return  snamepara;//名称 String
		}
		/**
		名称 String
		*/
		public void setSnamepara(String  snamepara) {
			this.snamepara =  snamepara;//名称 String
		}
	   /**
		内容 String
		*/
		@Column(name="svaluepara",length=50)
		public String getSvaluepara() {
			return  svaluepara;//内容 String
		}
		/**
		内容 String
		*/
		public void setSvaluepara(String  svaluepara) {
			this.svaluepara =  svaluepara;//内容 String
		}
	   /**
		说明 String
		*/
		@Column(name="sremarks",length=500)
		public String getSremarks() {
			return  sremarks;//说明 String
		}
		/**
		说明 String
		*/
		public void setSremarks(String  sremarks) {
			this.sremarks =  sremarks;//说明 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
