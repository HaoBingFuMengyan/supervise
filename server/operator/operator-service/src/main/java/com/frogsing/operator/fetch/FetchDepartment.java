package com.frogsing.operator.fetch;


import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.IDepartmentService;
import com.frogsing.operator.dao.DepartmentDao;
import com.frogsing.operator.po.Department;
import com.frogsing.operator.po.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Component
@Transactional(propagation=Propagation.MANDATORY)
public class FetchDepartment extends BaseFetch<Department> {

	@Autowired 
	DepartmentDao departmentDao;
	@Autowired 
	IDepartmentService departmentService;
	

	@Override
	public void fetchDetailData(Department department, Map<String, Object> map) {
		// 获取排序号，最末节点排序号+30
		if (B.N(department.getId())){
			department = departmentDao.findOne(department.getId());
			if(department!=null){
				department.setParent(departmentDao.findOne(department.getSparentid()));
			}
		}else{
			if(department.getSparentid()!=null){//增加下级菜单
				department.setParent(departmentDao.findOne(department.getSparentid()));
			}else{//增加新菜单
				department.setParent(departmentDao.findOne("0"));
			}
			
		}
		map.put("department", department);
		
	}

	@Override
	public boolean fetchListData(Map<String, Object> map, Pageable page, Map<String, Object> searchParams, SearchFilter[] searchFilters) {
		Object sparentid = searchParams.get("search_eq_sparentid");
		Department parent=departmentDao.findOne(sparentid.toString());
		map.put("parent",parent);
		return false;
	}

	@Transactional(readOnly = true)
	public void cash(Map<String, Object> map, Menu vo, Pageable pageable, Map<String, Object> searchPara, ILoginUser iLoginUser) {

	}
}
