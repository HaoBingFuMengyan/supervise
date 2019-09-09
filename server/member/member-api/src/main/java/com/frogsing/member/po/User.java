package com.frogsing.member.po;
//frogsingcode//


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.frogsing.member.utils.MEMBERCol.hy_user;
import com.frogsing.member.utils.MEMBERCol.hy_useractor;

import javax.persistence.*;
import java.util.List;

//frogsingcode//
@Entity
@Table(name = "hy_user")
//frogsingcode//
//frogsingcode//
public class User  extends  UserBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	
	/**
	 * 
	 */
	private List<Actor> actorList;

	// 多对多定义
	@ManyToMany(fetch=FetchType.LAZY,cascade={CascadeType.REFRESH})
	// 中间表定义,表名采用默认命名规则
	@JoinTable(name = "hy_useractor", joinColumns = {@JoinColumn(name = hy_useractor.suserid) }, inverseJoinColumns = { @JoinColumn(name = hy_useractor.sroleid)})
	@JsonIgnore
	public List<Actor> getActorList() {
		return actorList;
	}

	public void setActorList(List<Actor> actorList) {
		this.actorList = actorList;
	}

	private String[] sroleids;

	@Transient
	public String[] getSroleids() {
		return sroleids;
	}

	public void setSroleids(String[] sroleids) {
		this.sroleids = sroleids;
	}

	private String[] role;
	@Transient
	public String[] getRole() {
		return role;
	}

	public void setRole(String[] role) {
		this.role = role;
	}

	private Mber member;

	@ManyToOne
	@JoinColumn(name = hy_user.smemberid, insertable = false, updatable = false)
	@JsonIgnore
	public Mber getMember() {
		return member;
	}

	public void setMember(Mber member) {
		this.member = member;
	}
	
	
	//frogsingcode//
	
}
