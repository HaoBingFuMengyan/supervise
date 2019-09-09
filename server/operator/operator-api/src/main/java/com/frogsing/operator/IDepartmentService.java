package com.frogsing.operator;

import java.util.List;
import java.util.Set;

import javax.frogsing.exception.ServiceException;

import com.frogsing.operator.po.Department;

public interface IDepartmentService {


	/**
	 * 查询所有菜单
	 * 
	 * @return
	 */
	List<Department> getAllDepartment();

	/**
	 * 判断名称是否重复
	 * 
	 * @param sname
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
	List<Department> getDepartmentByParentId(String parentId, String sort);

	/**
	 * 根据菜单id查询菜单
	 * 
	 * @param id
	 * @return
	 */
	Department getDepartmentById(String id);

	/**
	 * 拖拉菜单
	 * 
	 * @param parentid
	 * @param sonid
	 */
	void updateParent(String parentid, String sonid);

	/**
	 * 删除菜单
	 * 
	 * @param checkboxId
	 */
	void deleteDepartment(String[] checkboxId) throws ServiceException;

	// 排序更新
	void updateOrder(String dropNodeid, String targetid, int val) throws ServiceException;

	/**
	 * 保存菜单
	 * 
	 * @param department
	 * @param id
	 */
	void saveDepartment(Department department, String id) throws ServiceException;

	/**
	 *修改子节点的排序号 
	 * @param parentid 父节点ID
	 */
	void subDepartment(String parentid);

	//HashSet<String> getAllMenuIdByOperatorId(String currentUserId);
	

}