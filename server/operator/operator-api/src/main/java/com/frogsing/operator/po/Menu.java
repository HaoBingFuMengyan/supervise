package com.frogsing.operator.po;
//frogsingcode//


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.frogsing.heart.utils.B;
import com.frogsing.operator.utils.OPERATORCol.op_purview;
import com.google.common.collect.Lists;

import javax.persistence.*;
import java.util.List;

//frogsingcode//
@Entity
@Table(name = "op_menu")
//frogsingcode//
//frogsingcode//
public class Menu  extends  MenuBase{
	
	private static final long serialVersionUID = 1L;
	
//frogsingcode//
	
	
	/**
	 * 
	 */
		private List<Purview> purviews=Lists.newArrayList();
		@OneToMany(fetch=FetchType.EAGER)
		@JoinColumn(name=op_purview.sparentid,nullable=true,updatable=false,insertable=false)
		public List<Purview> getPurviews() {
			return purviews;
		}

		public void setPurviews(List<Purview> purviews) {
			this.purviews = purviews;
		}
		
		
		private Menu parent;	// 父级菜单
		

		@JsonIgnore
		public static String getRootId(){
			return "0";
		}
		
		
		@JsonIgnore
		public static void sortList(List<Menu> list, List<Menu> sourcelist, String parentId, boolean cascade){
			for (int i=0; i<sourcelist.size(); i++){
				Menu e = sourcelist.get(i);
				if (e.getSparentid()!=null&& B.N(e.getSparentid().trim())
						&& e.getSparentid().equals(parentId)){
					list.add(e);
					if (cascade){
						// 判断是否还有子节点, 有则继续获取子节点
						for (int j=0; j<sourcelist.size(); j++){
							Menu child = sourcelist.get(j);
							if (child.getSparentid()!=null
									&& child.getSparentid().equals(e.getId())){
								sortList(list, sourcelist, e.getId(), true);
								break;
							}
						}
					}
				}
			}
		}
		
		@Transient
		public Menu getParent() {
			return parent;
		}

		public void setParent(Menu parent) {
			this.parent = parent;
		}
	
	//frogsingcode//
	
}
