package com.frogsing.member.dao;
//frogsingcode//


import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.ActorRight;


//frogsingcode//
public interface ActorRightDao extends BaseDao<ActorRight, String>{
//frogsingcode//


	@Query("delete from ActorRight where sroleid=?1")
	@Modifying
	void deleteByRoleId(String roleId);
	
	@Query("select spurviewid from ActorRight where sroleid=?1")
	List<String> findSpurviewidBySroleid(String roleid);

//frogsingcode//
}

