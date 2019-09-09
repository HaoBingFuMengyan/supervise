package com.frogsing.operator.dao;
//frogsingcode//


import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.operator.po.Role;

//frogsingcode//
public interface RoleDao extends BaseDao<Role, String>{
//frogsingcode//


	@Modifying
	@Query("delete  from OperatorRole where sroleid=?1")
	void deleteOperatorRole(String roleid);
	
	Role findBySrolename(String name);

	@Query(" select spurviewid from RolePurview where sroleid=?1")
	List<String> findPurviewIdsBySroleid(String id);

//frogsingcode//
}

