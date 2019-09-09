package com.frogsing.operator.service;

import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.T;
import com.frogsing.operator.IDepartmentService;
import com.frogsing.operator.dao.DepartmentDao;
import com.frogsing.operator.dao.PurviewDao;
import com.frogsing.operator.po.Department;
import com.frogsing.operator.po.Purview;
import com.frogsing.operator.utils.OPERATORCol.op_department;
import com.frogsing.operator.utils.OPERATORCol.op_menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.*;
import java.util.List;

/**
 * Component关键字表示Spring Bean的标识. Transactional关键字默认将类中的所有函数纳入事务管理，所有方法将默认有事物控制
 * 如果某个方法不需要事物控制需在方法头上加上@Transactional(readOnly = true) 系统菜单Service
 * 
 * @author <a href="mailto:service@frogsing.com">frogsing</a>
 * @since version1.0
 */
@Component
@Transactional
public class DepartmentService  implements IDepartmentService {
	// 系统菜单Dao 
	@Autowired
	private DepartmentDao departmentDao;

	// 权限码Dao
	@Autowired
	private PurviewDao purviewDao;
	
	@Override
	public List<Department> getAllDepartment() {

		
		List<Department> rs = departmentDao.findAll(new Specification<Department>() {
			
			@Override
			public Predicate toPredicate(Root<Department> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				root.fetch("purviews",JoinType.LEFT);
				query.distinct(true);
			   	//root.fetch("parent");   
				return null;
			}
		},new Sort(new Order(Sort.Direction.DESC, op_menu.dadddate)));
		return rs;
	
	}

	@Override
	@Transactional(readOnly = true)
	public boolean isNameSame(String sname, String sparentid, String id)
			throws ServiceException {
		try {
			if(id!=null){
				return departmentDao.count(sname, sparentid, id)>1;
				
			}else{
				return departmentDao.count(sname, sparentid)==0;
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new ServiceException("名称已存在！" + ex.getMessage());
		}
	}
	@Override
	public List<Department> getDepartmentByParentId(String parentId, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Department getDepartmentById(String id) {
		return departmentDao.findOne(id);
	}

	@Override
	public void updateParent(String parentid, String sonid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDepartment(String[] checkboxId) throws ServiceException {
		String parent = null;
		for (String id : checkboxId) {
			if (B.N(id)) {// 判断id不为空
				List<Department> lm = getDepartmentByParentId(id, "desc");
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
							Department department = getDepartmentById(id);
							if (department != null) {
								parent = department.getSparentid();
							}
						}
						departmentDao.delete(id);
					} catch (Exception ex) {
						
						ex.printStackTrace();
						throw new ServiceException("删除菜单失败" + ex.getMessage());
					}
				}
				List<Department> plm = departmentDao.getDepartmentByParentId(parent, new Sort(Direction.DESC,op_department.dadddate));
				if (plm.size() == 0) {
					Department d = getDepartmentById(parent);
					d.setBisleaf(1);
					departmentDao.save(d);
				}
			} else {
				throw new ServiceException("节点id为空！");
			}
		}
	}

	@Override
	public void updateOrder(String dropNodeid, String targetid, int val) throws ServiceException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveDepartment(Department department, String id) throws ServiceException {

		try {
			if (id == null) {// 如果id为空，则为添加
				// 先设置父节点不是叶子节点
				Department menu1 = getDepartmentById(department.getSparentid());
				if (menu1.getBisleaf() == 1) {
					menu1.setBisleaf(0);
					departmentDao.save(menu1);
				}
				// 设置节点
				department.setBisleaf(1);
				department.setBisroot(0);
				department.setDadddate(T.now());
			}else{//修改
				Department menuObj = departmentDao.findOne(id);
				subDepartment(menuObj.getId());
			}
			departmentDao.save(department);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new ServiceException("保存菜单失败");
		}
			
	}

	@Override
	public void subDepartment(String parentid) {

		List<Department> subDepartment = departmentDao.getDepartmentByParentId(parentid,null);//查询所有的子节点	
		for(Department obj:subDepartment){
			subDepartment(obj.getId());
		}
	
		
	}





}
