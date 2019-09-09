package com.frogsing.operator.po;
//frogsingcode//


import java.util.List;
import javax.persistence.*;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.context.annotation.Lazy;

import com.google.common.collect.Lists;
//frogsingcode//
@Entity
@Table(name = "op_role")
//frogsingcode//
//frogsingcode//
public class Role  extends  RoleBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	
	/**
	 * 
	 */
		private List<Purview> purviewList = Lists.newArrayList();

		@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER
				 //targetEntity= com.frogsing.front.hy.po.Purview.class
				)
		@JoinTable(name = "op_rolepurview", joinColumns = { @JoinColumn(name = "sroleid") }, inverseJoinColumns = { @JoinColumn(name = "spurviewid") })
		@Fetch(FetchMode.SUBSELECT)
		@Lazy(true)
//		//@OrderBy("id")
		public List<Purview> getPurviewList() {
			return purviewList;
		}

		public void setPurviewList(List<Purview> purviewList) {
			this.purviewList = purviewList;
		}

		//角色选中的权限吗集合
		private String spurviewIds;

		@Transient
		public String getSpurviewIds() {
			return spurviewIds;
		}

		public void setSpurviewIds(String spurviewIds) {
			this.spurviewIds = spurviewIds;
		}
	
	
	//frogsingcode//
	
}
