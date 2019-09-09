package com.frogsing.member.dao;
//frogsingcode//


import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.UserActor;


//frogsingcode//
public interface UserActorDao extends BaseDao<UserActor, String>{
//frogsingcode//


	@Query("delete from UserActor where suserid=?1")
	@Modifying
	void deleteByUserid(String id);

	@Query("delete from UserActor where suserid in (select id from User where smemberid=?1)")
	@Modifying
	void deleteByMemberid(String id);
	
	List<UserActor> findBySuserid(String suserid);

//frogsingcode//
}

