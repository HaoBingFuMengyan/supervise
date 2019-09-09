package com.frogsing.operator.dao;
//frogsingcode//

import java.util.List;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.operator.po.OperatorRole;

//frogsingcode//
public interface OperatorRoleDao extends BaseDao<OperatorRole, String>{
//frogsingcode//
	List<OperatorRole> findBySoperatorid(String id);
	

//frogsingcode//
}

