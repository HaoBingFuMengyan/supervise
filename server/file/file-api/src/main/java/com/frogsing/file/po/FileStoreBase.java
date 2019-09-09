package com.frogsing.file.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "wj_filestore")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class FileStoreBase  extends  BaseEntity{
	
	private   String sfilename; //文件名 String
	private   Integer ifiletype=0; //文件类型 int
	private   byte[] gfilecontent; //文件内容 byte[]
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		文件名 String
		*/
		@Column(name="sfilename",length=100)
		public String getSfilename() {
			return  sfilename;//文件名 String
		}
		/**
		文件名 String
		*/
		public void setSfilename(String  sfilename) {
			this.sfilename =  sfilename;//文件名 String
		}
	   /**
		文件类型 int
	    FileType:
	    0:MEMBER:会员
1:PAYMENT:付款凭证 
		*/
		@Column(name="ifiletype")
		public Integer getIfiletype() {
			return  ifiletype;//文件类型 int
		}
		/**
		文件类型 int
	    FileType:
	    0:MEMBER:会员
1:PAYMENT:付款凭证 
		*/
		public void setIfiletype(Integer  ifiletype) {
			this.ifiletype =  ifiletype;//文件类型 int
		}
	   /**
		文件内容 byte[]
		*/
		@javax.persistence.Lob
		@javax.persistence.Basic(fetch = javax.persistence.FetchType.LAZY)
		@Column(name="gfilecontent",columnDefinition = "BLOB")
		public byte[] getGfilecontent() {
			return  gfilecontent;//文件内容 byte[]
		}
		/**
		文件内容 byte[]
		*/
		public void setGfilecontent(byte[]  gfilecontent) {
			this.gfilecontent =  gfilecontent;//文件内容 byte[]
		}
	   /**
		添加人 String
		*/
		@Column(name="saddoperator",length=50)
		public String getSaddoperator() {
			return  saddoperator;//添加人 String
		}
		/**
		添加人 String
		*/
		public void setSaddoperator(String  saddoperator) {
			this.saddoperator =  saddoperator;//添加人 String
		}
	   /**
		添加日期 Date
		*/
		@Column(name="dadddate")
		public Date getDadddate() {
			return  dadddate;//添加日期 Date
		}
		/**
		添加日期 Date
		*/
		public void setDadddate(Date  dadddate) {
			this.dadddate =  dadddate;//添加日期 Date
		}
	   /**
		修改日期 Date
		*/
		@Column(name="dmodifydate")
		public Date getDmodifydate() {
			return  dmodifydate;//修改日期 Date
		}
		/**
		修改日期 Date
		*/
		public void setDmodifydate(Date  dmodifydate) {
			this.dmodifydate =  dmodifydate;//修改日期 Date
		}
	   /**
		修改人 String
		*/
		@Column(name="smodifyoperator",length=50)
		public String getSmodifyoperator() {
			return  smodifyoperator;//修改人 String
		}
		/**
		修改人 String
		*/
		public void setSmodifyoperator(String  smodifyoperator) {
			this.smodifyoperator =  smodifyoperator;//修改人 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
