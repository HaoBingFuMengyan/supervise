package com.frogsing.member.dao;
//frogsingcode//


import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.Mber;
import com.frogsing.member.po.Member;


//frogsingcode//
public interface MemberDao extends BaseDao<Member, String>{
//frogsingcode//



	/**
	 * 根据会员编号查找会员
	 * @param smemberno
	 * @return
	 */
	Member findBySmemberno(String smemberno);

	/**
	 * 根据会员类型查找所有会员
	 * @param memberType
	 * @return
	 */
	List<Member> findByImembertype(int memberType);

	/**
	 * 根据类型集合查找会员
	 * @param imembertype
	 * @return
     */
	@Query("from Member act where act.imembertype in ?1 ")
	List<Member> findByInImembertype(List<Integer> imembertype);

	
	@Query("select count(*) from Member t where t.imembertype=?1 and t.iauthtype=?2 and t.scnname=?3" )
	long countCnName(int memberType,int authtype,String scnname);
	
	@Query("select count(*) from Member t where t.imembertype=?1 and t.iauthtype=?2 and t.scnname=?3 and t.id<>?4" )
	long countCnName(int memberType,int authtype,String scnname,String id);
	
	@Query("select count(*) from Member t where t.scnname=?1" )
	long countCName(String scnname);
	
	@Query("select count(*) from Member t where t.imembertype=?1 and t.iauthtype=?2 and t.sshortname=?3" )
	long countShortName(int memberType,int authtype,String sshortname);

	@Query("select count(*) from Member t where t.imembertype=?1 and t.iauthtype=?2 and t.sshortname=?3 and t.id<>?4" )
	long countShortName(int memberType,int authtype,String sshortname,String id);
	//List<Member> findByBisspreadAndImemberstatus(int spread,int status);
	
	@Query("select count(id) from Member t where t.sbusinessno=?1 and t.id!=?2")
	long countbysbusinessno(String sbusinessno,String smemberid);
	@Query("select count(id) from Member t where t.sorgcode=?1 and t.id!=?2")
	long countbysorgcode(String sorgcode,String smemberid);
	@Query("select count(id) from Member t where t.staxno=?1 and t.id!=?2")
	long countbystaxno(String staxno,String smemberid);
	@Query("select count(id) from Member t where t.ssocialcreditno=?1 and t.id!=?2")
	long countbyssocialcreditno(String ssocialcreditno,String smemberid);
	/**
	 * 统计会员可用积分
	 * @param smemberid
	 * @return
	 */
//	@Query("select id,scnname from Member where id=?1")
//	Member countPoint(String smemberid);
	@Query("update Member  set stradepassword=?1 where id=?2" )
	@Modifying
	void updateTradePassword(String encodePassword, String memberid);
	
	@Query("from Mber where id=?1")
	Mber findMber(String id);
	
	@Query("from Member where bisselfsaler=1")
	Member getAcctc();

	@Query("from Mber where smemberno=?1")
	Mber findMberBySmemberno(String smemberno);
	
	@Query("from Mber where iauthtype=3")
	List<Mber> findGpMemberList();

	@Query("update Member set sgpmemberid=?1 where id=?2")
	@Modifying
	void updateGpMemberId(String sgpmemberid, String id);
	
	@Query("select scnname from Member where id=?1")
	String getCnname(String id); 
	
	Member findByScnname(String scnname);
	
	@Query("select id from Member where imembertype=0")
	String findMarketMemberId();
	
	@Query("from Mber where imembertype=0")
	Mber findMarketMber();
	
	@Query("from Member where imembertype=1 and imemberstatus=3 and iauthtype<>0")
	List<Member> findAllNormalMember();

//frogsingcode//
}

