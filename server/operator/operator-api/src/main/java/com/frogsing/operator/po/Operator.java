package com.frogsing.operator.po;
//frogsingcode//

import java.util.List;

import javax.persistence.*;


import com.google.common.collect.Lists;
//frogsingcode//
@Entity
@Table(name = "op_operator")
//frogsingcode//
//frogsingcode//
public class Operator  extends  OperatorBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	

	/**
	 *
	 */
	private List<Role> roleList = Lists.newArrayList();// 有序的关联对象集合

	// 多对多定义
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	// 中间表定义,表名采用默认命名规则
	@JoinTable(name = "op_operatorrole",
	joinColumns = { @JoinColumn(name = "soperatorid", insertable=false,updatable=false) },
	inverseJoinColumns = { @JoinColumn(name = "sroleid", insertable=false,updatable=false) })
	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	
	private String[] role;

	@Transient
	public String[] getRole() {
		return role;
	}

	public void setRole(String[] role) {
		this.role = role;
	}

	 	//frogsingcode//
}
