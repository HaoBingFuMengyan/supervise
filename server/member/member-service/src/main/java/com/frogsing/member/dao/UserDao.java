package com.frogsing.member.dao;
//frogsingcode//


import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.Actor;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.User;


//frogsingcode//
public interface UserDao extends BaseDao<User, String>{
//frogsingcode//



	User findBySusernameOrSmobile(String susername, String smobile);
	User findBySusernameAndSmobile(String susername, String smobile);

	User findBySusername(String username);

	User findBySmobile(String username);
	/**
	 *
	 * @param membertype 会员类型
	 * @param iauthtype      认证类型
	 * @param bisseller 是否分销商
	 * @return
	 */
//	@Query("select distinct(p.surlpath) from  Actor ro join ro.rightList p  where ((ro.iroletype=?1 and ro.imemberstatus=?2 and ro.iorgtype=?3 and ro.bissystem=1 ) or ro.smemberid=?4) and ro.bisspecial=0")
//	@Query("select distinct(p.surlpath) from  Actor ro join ro.rightList p  where ((ro.iroletype=?1 and ro.imemberstatus=?2 and ro.iorgtype=?3 and ro.bissystem=1 ) or ro.smemberid=?4) and ro.bisspecial=0")
	@Query("select distinct(p.surlpath) from  Actor ro join ro.rightList p  where (ro.iroletype=?1 and ro.imemberstatus=?2 and ro.bissystem=0 ) or (ro.smemberid=?3 and ro.bisspecial=0  and ro.bisspecial=0 )")
	Collection<String> getAllPurview(int membertype, int iauthtype,String smemberid);

	@Query("select distinct(p.surlpath) from  Actor ro join ro.rightList p  where ro.id in ( select u.sspecialroleid from Actor u where  u.iroletype=?1 and u.smemberid=?2 and u.bisspecial=1)")
	Collection<String> getAllSpecialPurview(int membertype, String smemberid);

	@Query("select distinct(p.surlpath) from  Actor ro join ro.rightList p  where ro.id in (select o.sroleid from  UserActor o where o.suserid=?1)")
	Collection<String> getAllPurview(String userid);
	@Query("select count(*) from User where smemberid=?1")
	long countUser(String smemberid);
	@Query("select act from Actor act where act.iroletype=?1 and act.id in (select sroleid from UserActor r where r.suserid=?2 )")
	List<Actor> findCheckedActor(int membertype,String userid);
	
	@Query("from Actor act where ((act.iroletype=?1 and act.imemberstatus=?3 and act.bissystem=1 ) or act.smemberid=?5) and act.bisspecial=0 and act.id not in (select sroleid from UserActor r where r.suserid=?2 )")
//	@Query("from Actor act where ((act.iroletype=?1 and act.imemberstatus=?3 and act.iorgtype=?4 and act.bissystem=1 ) or act.smemberid=?5) and act.bisspecial=0 and act.id not in (select sroleid from UserActor r where r.suserid=?2 )")
	List<Actor> findNotCheckedActor(int membertype,String userid,int memberstatus,int iorgtype,String memberid);
	
	@Query("from Actor act where act.iroletype=?1 and act.smemberid=?3 and act.bisspecial=1 and act.sspecialroleid not in (select sroleid from UserActor r where r.suserid=?2 )")
	List<Actor> findSpecialNotCheckActor(int membertype,String userid,String memberid);
	
	@Query("select m.imembertype from Member m where m.id in (select u.smemberid from User u where u.id=?1)")
	int findMemberByUserid(String userid);
	@Query("select m from Member m where m.id in (select u.smemberid from User u where u.id=?1)")
	Member findMemberByUser(String userid);
	@Query("delete from UserActor t where t.suserid=?1")
	@Modifying
	void deleteUserActor(String userid); 
	
	User findBySmemberidAndBisadmin(String memberid,int booltype);
	
	List<User> findBySmemberid(String memberid);
	@Query("update User set spassword=?1 where id =?2")
	@Modifying
	void updatePassword(String encodePassword,String id);

	@Modifying
	@Query("update User set dendlogintime=null, ierrorcount=0,dlastloginsuccessdate=?2 where id=?1")
	void updateLoginTime(String id, Date currentDateTime);
	@Modifying
	@Query("update User set dendlogintime=?2,ierrorcount=ierrorcount+1 where susername=?1")
	void updateErrorCount(String username, Date currentDateTime);

	@Query("select count(*) from User where smobile=?1")
	long countMobile(String smobile);


//frogsingcode//
}

