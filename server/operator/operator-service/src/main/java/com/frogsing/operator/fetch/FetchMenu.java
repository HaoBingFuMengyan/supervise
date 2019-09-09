package com.frogsing.operator.fetch;


import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.IMenuService;
import com.frogsing.operator.dao.MenuDao;
import com.frogsing.operator.po.Menu;
import com.frogsing.operator.utils.OPERATORCol.op_menu;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;

@Component
@Transactional(propagation=Propagation.MANDATORY)
public class FetchMenu extends BaseFetch<Menu> {

	@Autowired 
	MenuDao menuDao;
	@Autowired 
	IMenuService menuService;
	
	@Override
	public boolean fetchListData(Map<String, Object> map, Pageable page, Map<String, Object> searchParams,
			SearchFilter[] searchFilters) {
		List<Menu> list = Lists.newArrayList();
		List<Menu> sourcelist = menuDao.findAll(new Specification<Menu>() {
			
			@Override
			public Predicate toPredicate(Root<Menu> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return null;
			}
		},new Sort(new Order(Sort.Direction.ASC, op_menu.isort)));
		Menu.sortList(list, sourcelist, Menu.getRootId(), true);
        map.put("list", list);
        return false;
	}
	@Override
	public void fetchDetailData(Menu menu, Map<String, Object> map) {
		// 获取排序号，最末节点排序号+30
		if (B.N(menu.getId())){
			menu = menuDao.findOne(menu.getId());
			if(menu!=null){
				menu.setParent(menuDao.findOne(menu.getSparentid()));
			}
		}else{
			if(menu.getSparentid()!=null){//增加下级菜单
				menu.setParent(menuDao.findOne(menu.getSparentid()));
			}else{//增加新菜单
				menu.setParent(menuDao.findOne("0"));
			}
			
		}
		//map.put("menu", menu);
		
	}
	@Override
	public void commonCheck(Menu menu, ILoginUser u) {
		E.S("do not use it");
	}



	@Transactional
	public void up(Map<String, Object> map, Menu vo, Pageable pageable, Map<String, Object> searchPara, ILoginUser iLoginUser) {

		 Menu m=menuDao.findOne(vo.getId());
		 if(m==null)
		 	return;
		XSpec<Menu> x=op_menu.xspec();
		x.and(SearchFilter.lt(op_menu.isort,m.getIsort()))
				.and(SearchFilter.eq(op_menu.sparentid,m.getSparentid()));
		List<Menu> list = menuDao.findAllLimit(x, PageSort.Desc(op_menu.isort).ToSort(), 1);
		if(list.size()==0)
			return;
		Menu old=list.get(0);
		int s=old.getIsort();
		old.setIsort(m.getIsort());
		m.setIsort(s);
		menuDao.save(old);
		menuDao.save(m);
	}
	@Transactional
	public void down(Map<String, Object> map, Menu vo, Pageable pageable, Map<String, Object> searchPara, ILoginUser iLoginUser) {

		Menu m=menuDao.findOne(vo.getId());
		if(m==null)
			return;
		XSpec<Menu> x=op_menu.xspec();
		x.and(SearchFilter.gt(op_menu.isort,m.getIsort()))
				.and(SearchFilter.eq(op_menu.sparentid,m.getSparentid()));
		List<Menu> list = menuDao.findAllLimit(x, PageSort.Asc(op_menu.isort).ToSort(), 1);
		if(list.size()==0)
			return;
		Menu old=list.get(0);
		int s=old.getIsort();
		old.setIsort(m.getIsort());
		m.setIsort(s);
		menuDao.save(old);
		menuDao.save(m);
	}
}
