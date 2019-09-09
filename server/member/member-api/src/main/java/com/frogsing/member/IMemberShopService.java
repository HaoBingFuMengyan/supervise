package com.frogsing.member;

import java.util.List;
import java.util.Map;

import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.MemberShop;
import com.frogsing.member.po.MemberShopApply;
import com.frogsing.member.vo.LoginUser;

public interface IMemberShopService {

	
	//void shopFavourite(String id,LoginUser user);
	
	/**
	 * 新增一条MemberShop
	 * @author XiaoYao
	 * @param memberShop  
	 * @param paramMap  可能会用到的参数
	 * @return
	 */
	//void newMemberShop(MemberShopApply shop,Authapply auth,Map<String,Object> paramMap);
	
	
	/**
	 * 查找当前会员已经开通的所有店铺
	 * @author XiaoYao
	 * @param smemberid
	 * @return
	 */
//	List<MemberShop> findAllOpenBySmemberid(String smemberid);
	
	/**
	 * 审核店铺
	 * @author XiaoYao
	 * @param id
	 * @throws Exception
	 */
	void check(String id,boolean checkok,String text);
	
	/**
	 * 根据shopname和状态统计条数
	 * @return
	 */
	long countByShopNameAndStatus(String shopName,int istatus);

	/**
	 * 修改店铺logo
	 * @param id
	 */
	void modifyMemberShopSlogo(String id,String slogo);

	MemberShop findBySmemberid(String smemberid);

	void memberShopApply(Member member, int type, String slogo, String sbannerurl, String scompanydesc, String ssuccessexam);
	
}




