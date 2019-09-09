package com.frogsing.operator.service;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.T;
import com.frogsing.operator.IMenuService;
import com.frogsing.operator.dao.MenuDao;
import com.frogsing.operator.dao.OperatorDao;
import com.frogsing.operator.dao.PurviewDao;
import com.frogsing.operator.po.Menu;
import com.frogsing.operator.po.Purview;
import com.frogsing.operator.utils.OPERATORCol.op_menu;
import com.frogsing.parameter.utils.ParaUtils;
import com.google.common.collect.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Component关键字表示Spring Bean的标识. Transactional关键字默认将类中的所有函数纳入事务管理，所有方法将默认有事物控制
 * 如果某个方法不需要事物控制需在方法头上加上@Transactional(readOnly = true) 系统菜单Service
 * 
 * @author <a href="mailto:service@frogsing.com">frogsing</a>
 * @since version1.0
 */
@Component
@Transactional
public class MenuService  implements IMenuService {
	// 系统菜单Dao 
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private OperatorDao operatorDao;

	// 权限码Dao
	@Autowired
	private PurviewDao purviewDao;

	
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#getAllMenu()
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Menu> getAllMenu() {
		
		List<Menu> rs = menuDao.findAll(new Specification<Menu>() {
			
			@Override
			public Predicate toPredicate(Root<Menu> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				root.fetch("purviews",JoinType.LEFT);
				query.distinct(true);
			   	//root.fetch("parent");   
				return null;
			}
		},new Sort(new Order(Sort.Direction.ASC, op_menu.isort)));
//		for(Menu r:rs){
//			r.getPurviews().size();
//		}
		return rs;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#isNameSame(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public boolean isNameSame(String sname, String sparentid, String id)
			throws ServiceException {
		try {
			if(id!=null){
				return menuDao.count(sname, sparentid, id)>1;
				
			}else{
				return menuDao.count(sname, sparentid)==0;
			}
			
		} catch (Exception ex) {
		//	LogUtils.log(ex.getMessage());
			ex.printStackTrace();
			throw new ServiceException("名称已存在！" + ex.getMessage());
		}
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#getMenuByParentId(java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Menu> getMenuByParentId(String parentId, String sort) {
		Sort ss;
		if(sort.equals("desc")){
			ss=new Sort(new Order(Direction.DESC,op_menu.isort));
		}
		else
			ss=new Sort(new Order(Direction.ASC,op_menu.isort));
		return menuDao.getMenuByParentId(parentId, ss);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#getMenuById(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public Menu getMenuById(String id) {
		return menuDao.findOne(id);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#updateParent(java.lang.String, java.lang.String)
	 */
	@Override
	public void updateParent(String parentid, String sonid) {
		Menu son = this.menuDao.findOne(sonid);
		son.setSparentid(parentid);
		son.setDadddate(T.now());
		this.menuDao.save(son);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#deleteMune(java.lang.String[])
	 */
	@Override
	public void deleteMune(String[] checkboxId) throws ServiceException {
		String parent = null;
		for (String id : checkboxId) {
			if (B.N(id)) {// 判断id不为空
				List<Menu> lm = getMenuByParentId(id, "desc");
				if (null != lm && lm.size() > 0) {
					throw new ServiceException("请先删除子节点！");
				} else {
					List<Purview> lp = purviewDao.findBySparentid(id);
					if (lp.size() > 0) {
						for (Purview purview : lp) {// 先删除权限码
							purviewDao.delete(purview);
						}
					}
					try {
						if (parent == null) {
							Menu menu = getMenuById(id);
							if (menu != null) {
								parent = menu.getSparentid();
							}
						}
						menuDao.delete(id);
					} catch (Exception ex) {
						
						ex.printStackTrace();
						throw new ServiceException("删除菜单失败" + ex.getMessage());
					}
				}
				List<Menu> plm = menuDao.getMenuByParentId(parent, new Sort(Direction.DESC,op_menu.isort));
				if (plm.size() == 0) {
					Menu m = getMenuById(parent);
					m.setBisleaf(1);
					menuDao.save(m);
				}
			} else {
				throw new ServiceException("节点id为空！");
			}
		}
	}

	// 排序更新
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#updateOrder(java.lang.String, java.lang.String, int)
	 */
	@Override
	public void updateOrder(String dropNodeid, String targetid, int val)
			throws ServiceException {
		try {
			// 根据拖动查询起始的实体
			Menu startOrder = getMenuById(dropNodeid);
			Menu endOrder = getMenuById(targetid);
			// 暂时屏蔽
			// if (!endOrder.getSparentid().equals(startOrder.getSparentid())) {
			// startOrder.setSparentid(endOrder.getSparentid());
			// startOrder.setIsort(99999999);
			// }
			// 判断大小
			List<Menu> list = null;
			if (startOrder.getIsort() > endOrder.getIsort()) {
				list = menuDao.getZhongJian(endOrder.getIsort(),
						startOrder.getIsort());
			} else {
				list = menuDao.getZhongJian(startOrder.getIsort(),
						endOrder.getIsort());
			}

			// System.out.println("先更新的："+endOrder.getDispOrder());
			// 交换拖拽之间的顺序
			startOrder.setIsort(endOrder.getIsort());
			this.saveMenu(startOrder, startOrder.getId());

			endOrder.setIsort(endOrder.getIsort() + val);
			this.saveMenu(startOrder, startOrder.getId());

			// 循环设置顺序
			for (Menu menu : list) {
				menu.setIsort(menu.getIsort() + val);
				this.saveMenu(startOrder, startOrder.getId());
			}
		} catch (Exception ex) {
			
			ex.printStackTrace();
			throw new ServiceException("排序更新失败");
		}
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#saveMenu(com.frogsing.po.entity.sys.Menu, java.lang.String)
	 */
	@Override
	public void saveMenu(Menu menu, String id) throws ServiceException {
		try {
			if (id == null) {// 如果id为空，则为添加
				// 先设置父节点不是叶子节点
				Menu menu1 = getMenuById(menu.getSparentid());
				if(menu1==null)
					E.S("找不到父菜单");
				if (menu1.getBisleaf() == 1) {
					menu1.setBisleaf(0);
					menuDao.save(menu1);
				}
				List<Menu> lm = getMenuByParentId(menu.getSparentid(), "desc");
				if (!lm.isEmpty() && lm.size() > 0) {
					menu.setIsort(((Menu) lm.get(0)).getIsort() + 1);// 设置排序号
					// menu.setSmenuno(String.valueOf(((Menu)lm.get(0)).getIsort(
					// )+ 1));
				} else {
					menu.setIsort(menu1.getIsort() * 100);
					// menu.setSmenuno(String.valueOf(menu1.getIsort() * 100));
				}
				
				menu.setSmenuno(ParaUtils.seqno(op_menu.tablename));
				// 设置节点
				menu.setBisleaf(1);
				menu.setBisroot(0);
				menu.setDadddate(T.now());
			}else{//修改
				Menu menuObj = menuDao.findOne(id);
				subMenu(menuObj.getId(),(long)menuObj.getIsort(),(long)menu.getIsort());
			}
			menuDao.save(menu);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new ServiceException("保存菜单失败");
		}
	}
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#subMenu(java.lang.String, java.lang.Long, java.lang.Long)
	 */
	@Override
	public void subMenu(String parentid,Long oldisort,Long newisort){
		List<Menu> subMenu = menuDao.getMenuByParentId(parentid,null);//查询所有的子节点	
		for(Menu obj:subMenu){
			StringBuilder bf = new StringBuilder();
			int index = String.valueOf(oldisort).length();
			int endindex = String.valueOf(obj.getIsort()).length();
			String isort = String.valueOf(obj.getIsort()).substring(index,endindex);
			String nwisort = String.valueOf(newisort);
			obj.setIsort(Integer.valueOf(bf.append(nwisort).append(isort).toString()));
			subMenu(obj.getId(),oldisort,newisort);
		}
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IMenuService#getAllMenuIdByOperatorId(java.lang.String)
	 */
	@Override
	public HashSet<String> getAllMenuIdByOperatorId(String currentUserId) {
		Collection<String> sets=menuDao.getAllMenuIdByOperatorId(currentUserId);
		
		return Sets.newHashSet(sets);
		 
	}


	@Override
	public Set<String> getAllPurview() {
		Collection<String> db;
		Set<String> rs=Sets.newHashSet();
		db= operatorDao.getAllPurview();
		for(String t:db){
			String[] as=t.split(",");
			for(String b:as){
				rs.add(b.trim());
			}
		}
		return rs;
	}
	
	


}
