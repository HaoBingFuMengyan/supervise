package com.frogsing.operator.vo;

import java.io.Serializable;

/**
 * @author wjl
 * 菜单权限树VO
 */
public class MenuPurviewTreeVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String id;
	public String sname; 
	public String sparentid;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSparentid() {
		return sparentid;
	}
	public void setSparentid(String sparentid) {
		this.sparentid = sparentid;
	}
	
	
}
