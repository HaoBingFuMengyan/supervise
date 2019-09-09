package com.frogsing.member.po;

//frogsingcode//
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.frogsing.heart.entity.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

//frogsingcode//
@Entity
@Table(name = "hy_member")
@JsonIgnoreProperties( value={"hibernateLazyInitializer","handler"})
// frogsingcode//
// frogsingcode//
public class Mber extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6760259539974426696L;

	private String smemberno; // 企业编号 String

	private String scnname; // 企业名称 String

	private String senname; // 英文名称 String

	private String sshortname; // 中文简称 String
	
	private Integer bisopenshop=0; //是否已开通店铺 int

	private Integer imembertype = 0; // 会员类型 int

	private Integer iauthtype = 0; // 认证类型 int





	public Integer getBisopenshop() {
		return bisopenshop;
	}

	public void setBisopenshop(Integer bisopenshop) {
		this.bisopenshop = bisopenshop;
	}

	public String getSjpname() {
		return sjpname;
	}

	public void setSjpname(String sjpname) {
		this.sjpname = sjpname;
	}

	public String getSpyname() {
		return spyname;
	}

	public void setSpyname(String spyname) {
		this.spyname = spyname;
	}

	private String sjpname; // 简拼名 String

	private String spyname; // 全拼名 String

	public String getSmemberno() {
		return smemberno;
	}

	public void setSmemberno(String smemberno) {
		this.smemberno = smemberno;
	}

	public String getScnname() {
		return scnname;
	}

	public void setScnname(String scnname) {
		this.scnname = scnname;
	}

	public String getSenname() {
		return senname;
	}

	public void setSenname(String senname) {
		this.senname = senname;
	}

	public String getSshortname() {
		return sshortname;
	}

	public void setSshortname(String sshortname) {
		this.sshortname = sshortname;
	}

	public Integer getImembertype() {
		return imembertype;
	}

	public void setImembertype(Integer imembertype) {
		this.imembertype = imembertype;
	}

	public Integer getIauthtype() {
		return iauthtype;
	}

	public void setIauthtype(Integer iauthtype) {
		this.iauthtype = iauthtype;
	}

	private   String sorgcode; //组织机构代码 String

	public String getSorgcode() {
		return sorgcode;
	}

	public void setSorgcode(String sorgcode) {
		this.sorgcode = sorgcode;
	}
}
