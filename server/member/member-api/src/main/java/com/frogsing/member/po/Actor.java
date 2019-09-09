package com.frogsing.member.po;
//frogsingcode//


import com.google.common.collect.Lists;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.util.List;

//frogsingcode//
@Entity
@Table(name = "hy_actor")
//frogsingcode//
//frogsingcode//
public class Actor  extends  ActorBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	
	
	
/**
	 * 
	 */
private List<Right> rightList = Lists.newArrayList();
	
	@ManyToMany(
			 //targetEntity= com.frogsing.front.hy.po.Right.class
			)
	@JoinTable(name = "hy_actorright", joinColumns = { @JoinColumn(name = "sroleid") }, inverseJoinColumns = { @JoinColumn(name = "spurviewid") })
	@Fetch(FetchMode.SUBSELECT)
	@Lazy(true)
//	//@OrderBy("id")		
	public List<Right> getRightList() {
		return rightList;
	}

	public void setRightList(List<Right> rightList) {
		this.rightList = rightList;
	}
	
	
	
	//frogsingcode//
	
}
