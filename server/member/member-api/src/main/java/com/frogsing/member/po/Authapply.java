package com.frogsing.member.po;
//frogsingcode//


import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.frogsing.member.utils.MEMBERCol.hy_authapply;
//frogsingcode//
@Entity
@Table(name = "hy_authapply")
//frogsingcode//
//frogsingcode//
public class Authapply  extends  AuthapplyBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	
	
	private User user;

	  @ManyToOne
	  @JoinColumn(name=hy_authapply.sapplyuserid ,updatable=false,insertable=false)
		@NotFound(action = NotFoundAction.IGNORE)
		public User getUser() {
			return user;
		}

	public void setUser(User user) {
		this.user = user;
	}
	  
	
	private Member member;
	@ManyToOne
	@JoinColumn(name = hy_authapply.smemberid, insertable = false, updatable = false)
	@JsonIgnore

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	
	//frogsingcode//
	
}
