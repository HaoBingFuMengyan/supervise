package com.frogsing.member.po;
//frogsingcode//


import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.frogsing.member.utils.MEMBERCol.hy_membershop;
//frogsingcode//
@Entity
@Table(name = "hy_membershop")
//frogsingcode//
//frogsingcode//
public class MemberShop  extends  MemberShopBase{
	
	private static final long serialVersionUID = 1L;
	
	//frogsingcode//
	
	private Member member;
	@ManyToOne
	@JoinColumn(name = hy_membershop.smemberid, insertable = false, updatable = false)
	@JsonIgnore

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
	//frogsingcode//
	
}
