package com.frogsing.member.po;
//frogsingcode//


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;

import javax.persistence.*;
import java.util.List;

//frogsingcode//
@Entity
@Table(name = "hy_member")
//frogsingcode//
//frogsingcode//
public class Member  extends  MemberBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	
	private List<User> userList = Lists.newArrayList();

	@OneToMany
	@JoinColumn(name = "smemberid") 
	@JsonIgnore
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	private long[] count;

	@Transient
	public long[] getCount() {
		return count;
	}

	public void setCount(long[] count) {
		this.count = count;
	}

	private List<?> repaymentPlanList = Lists.newArrayList();
	@Transient
	public List<?> getRepaymentPlanList() {
		return repaymentPlanList;
	}

	public void setRepaymentPlanList(List<?> repaymentPlanList) {
		this.repaymentPlanList = repaymentPlanList;
	}
	//frogsingcode//
	
}
