package com.frogsing.operator.dao;
//frogsingcode//


import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.operator.po.Department;
import com.frogsing.operator.po.Menu;

//frogsingcode//
public interface DepartmentDao extends BaseDao<Department, String>{
//frogsingcode//
	@Query("select p from  Department p where p.sparentid = ?1 ")
	List<Department> getDepartmentByParentId(String parentid, Sort sort);



//frogsingcode//
}

