package com.frogsing.operator.fetch;


import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.dao.MenuDao;
import com.frogsing.operator.dao.OperatorRoleDao;
import com.frogsing.operator.dao.RoleDao;
import com.frogsing.operator.dao.RolePurviewDao;
import com.frogsing.operator.po.Menu;
import com.frogsing.operator.po.Purview;
import com.frogsing.operator.po.Role;
import com.frogsing.operator.po.RolePurview;
import com.frogsing.operator.utils.OPERATORCol.op_menu;
import com.frogsing.operator.utils.OPERATORCol.op_role;
import com.frogsing.operator.vo.MenuPurviewTreeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
@Transactional(propagation=Propagation.MANDATORY)
public class FetchRole extends BaseFetch<Role> {

	@Autowired
	RoleDao roleDao;
	
	@Autowired
	OperatorRoleDao operatorRoleDao;
	
	@Autowired
	RolePurviewDao rolePurviewDao;
	
	@Autowired MenuDao menuDao;
	
	@Override
	public void fetchDetailData(Role obj,Map<String, Object> map) {
		List<MenuPurviewTreeVo> listvo = new ArrayList<MenuPurviewTreeVo>();
		List<Menu> list = menuDao.findAll(
				new Specification<Menu>() {
					
					@Override
					public Predicate toPredicate(Root<Menu> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
						root.fetch("purviews",JoinType.LEFT);
						query.distinct(true);
						return null;
					}
				},
				PageSort.Asc(op_menu.isort).ToSort());
		for(Menu menu:list){
			MenuPurviewTreeVo vo = new MenuPurviewTreeVo();
			vo.setId(menu.getId());
			vo.setSparentid(menu.getSparentid());
			vo.setSname(menu.getSname());
			listvo.add(vo);
			
			for(Purview purview : menu.getPurviews()){
				MenuPurviewTreeVo childVo = new MenuPurviewTreeVo();
				childVo.setId(purview.getId());
				childVo.setSparentid(menu.getId());
				childVo.setSname(purview.getSpurname());
				listvo.add(childVo);
			}
		}
		String rolePurStr = "";
		for(Purview p:obj.getPurviewList()){
			rolePurStr+=p.getId()+",";
		}
		if(rolePurStr!=""){
			rolePurStr.substring(0,rolePurStr.length()-1);
		}
		
		map.put("rolePurStr", rolePurStr);
		map.put("menuList", listvo);
	}
	@Override
	public void beforeUpdate(Role vo, Role po, ILoginUser u) {
		po.setPurviewList(null);
	}
	@Override
	public void commonCheck(Role vo, ILoginUser u) {
		long i=roleDao.count(op_role.srolename, vo.getSrolename(), vo.getId());
		if(i>0)
			E.S("存在同名角色");
	}

	@Override
	public void afterSave(Role vo, Role po,ILoginUser u) {
		this.roleDao.flush();
		if(vo.getSpurviewIds().length()>0){
			for(String p:vo.getSpurviewIds().split(","))
			{
				RolePurview r=new RolePurview();
				r.setSpurviewid(p.trim());
				r.setSroleid(po.getId());
				rolePurviewDao.save(r);

			}
		}

	}
	@Override
	public void afterDelete(List<Role> list) {
		for(Role r:list){
			this.roleDao.deleteOperatorRole(r.getId());
		}
	}
	
}
