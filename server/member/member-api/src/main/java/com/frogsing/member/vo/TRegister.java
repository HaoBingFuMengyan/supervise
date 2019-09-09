package com.frogsing.member.vo;

import com.frogsing.member.po.User;

public class TRegister extends User {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3513974898553538085L;

	// 地理位置信息
	private String slocation;
	// 代理网站编号
	private String clientno;

	public String getClientno() {
		return clientno;
	}

	public void setClientno(String clientno) {
		this.clientno = clientno;
	}

	public String getSlocation() {
		return slocation;
	}

	public void setSlocation(String slocation) {
		this.slocation = slocation;
	}

	int itimer = 0;

	public int getItimer() {
		return itimer;
	}

	public void setItimer(int itimer) {
		this.itimer = itimer;
	}

	private String scnname;

	public String getScnname() {
		return scnname;
	}

	public void setScnname(String scnname) {
		this.scnname = scnname;
	}

	private String scheckword;

	public String getScheckword() {
		return scheckword;
	}

	public void setScheckword(String scheckword) {
		this.scheckword = scheckword;
	}

}
