package com.frogsing.operator.dao;
//frogsingcode//


import java.util.List;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.operator.po.RolePurview;

//frogsingcode//
public interface RolePurviewDao extends BaseDao<RolePurview, String>{
//frogsingcode//


	List<RolePurview> findBySroleid(String id);


//frogsingcode//
}

