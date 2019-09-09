package com.frogsing.operator.dao;
//frogsingcode//

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.operator.po.Operator;
//frogsingcode//
public interface OperatorDao extends BaseDao<Operator, String>{
//frogsingcode//
	Operator findBySusername(String soperatorname);

	Operator findBySusernameAndSpassword(String susername, String spassword);

	@Query("select distinct(p.surlpath) from  Role ro join ro.purviewList p  where ro.id in (select r.id from  Operator o   join o.roleList r  where o.id=?1 )")
	Collection<String> getAllPurview(String id);

	@Query("select distinct(p.surlpath) from  Purview p)")
	Collection<String> getAllPurview();

	/**
	 * 记录最后登录成功时间,清空上次失败时间
	 * @param id
	 * @param currentDateTime
	 */
	@Modifying
	@Query("update Operator set dlastlogintime=?2, dendlogintime=null where id=?1")
	void updateLoginTime(String id, Date currentDateTime);
	
	@Query("select spassword from Operator where id=?1")
	String getUserPassword(String id);

	/**
	 * 设置上次登录失败时间
	 * @param susername
	 * @param now
	 */
	@Modifying
	@Query("update Operator set  dendlogintime=?2 where susername=?1")
	void updateErrorLoginTime(String susername, Date now);

	@Modifying
	@Query("update Operator set  spassword=?2 where id=?1")
	void updatePassword(String id, String spassword);


//frogsingcode//
}

