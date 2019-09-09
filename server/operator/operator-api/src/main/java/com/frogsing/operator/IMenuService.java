package com.frogsing.operator;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.frogsing.exception.ServiceException;

import com.frogsing.operator.po.Menu;

public interface IMenuService {


	/**
	 * 查询所有菜单
	 * 
	 * @return
	 */
	List<Menu> getAllMenu();

	/**
	 * 判断名称是否重复
	 * 
	 * @param susername
	 * @return
	 */
	boolean isNameSame(String sname, String sparentid, String id) throws ServiceException;

	/**
	 * 根据父Id查询菜单
	 * 
	 * @param parentId
	 *            父Id
	 * @return
	 */
	List<Menu> getMenuByParentId(String parentId, String sort);

	/**
	 * 根据菜单id查询菜单
	 * 
	 * @param id
	 * @return
	 */
	Menu getMenuById(String id);

	/**
	 * 拖拉菜单
	 * 
	 * @param target
	 * @param drop
	 */
	void updateParent(String parentid, String sonid);

	/**
	 * 删除菜单
	 * 
	 * @param checkboxId
	 */
	void deleteMune(String[] checkboxId) throws ServiceException;

	// 排序更新
	void updateOrder(String dropNodeid, String targetid, int val) throws ServiceException;

	/**
	 * 保存菜单
	 * 
	 * @param menu
	 * @param id
	 */
	void saveMenu(Menu menu, String id) throws ServiceException;

	/**
	 *修改子节点的排序号 
	 * @param parentid 父节点ID
	 * @param oldisort 
	 * @param newisort 
	 */
	void subMenu(String parentid, Long oldisort, Long newisort);

	HashSet<String> getAllMenuIdByOperatorId(String currentUserId);
	
	Set<String> getAllPurview();

}