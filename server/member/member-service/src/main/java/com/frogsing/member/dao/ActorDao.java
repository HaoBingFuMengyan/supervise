package com.frogsing.member.dao;
//frogsingcode//


import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.Actor;


//frogsingcode//
public interface ActorDao extends BaseDao<Actor, String>{
//frogsingcode//




	@Query("select count(*) from UserActor where sroleid in ?1")
	long countBeUsedActor(Collection<String> actorids);
	
	@Query("select count(*) from Actor where sspecialroleid in ?1 and smemberid != '*'")
	long countBeUsedSpecialActor(Collection<String> actorids);
	
	//查询改会员所有角色
	List<Actor> findByImemberstatusAndIroletypeOrSmemberidOrderByIsortnoAsc(int iauthType,int roletype,String smemberid);
	 
	@Query("select act from Actor act where act.bisspecial=1 and act.smemberid=?1")
	List<Actor> findCheckedActor(String memberid);
	
	@Query("from Actor act where act.bissystem=1 and act.bisspecial=1 and act.id not in (select r.sspecialroleid from Actor r where r.bisspecial=1 and r.smemberid=?1 )")
	List<Actor> findNotCheckedActor(String memberid);
	
	//删除某会员下所有用户已经分配的某个角色
	@Query("delete from UserActor t where t.sroleid=?1 and t.suserid in (select u.id from User u where u.smemberid=?2)")
	@Modifying
	void deleteUserActorByMemberId(String actorId,String memberid);
	
	@Query("select count(*) from Actor  where srolename=?1 and smemberid=?2")
	long countBySrolename(String srolename,String smemberid);

	Actor findBySrolecode(String rolename);

//frogsingcode//
}

