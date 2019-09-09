package com.frogsing.operator.po;
//frogsingcode//


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
//frogsingcode//
@Entity
@Table(name = "op_department")
//frogsingcode//
//frogsingcode//
public class Department  extends  DepartmentBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	
	private Department parent;	// 父级菜单
	
	@Transient
	public Department getParent() {
		return parent;
	}

	public void setParent(Department parent) {
		this.parent = parent;
	}
	
	
	//frogsingcode//
	
}
