package com.frogsing.member.dao;
//frogsingcode//


import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.MemberImage;


//frogsingcode//
public interface MemberImageDao extends BaseDao<MemberImage, String>{
//frogsingcode//



/**
 * by会员id和图片类型查找会员图片
 * @param memberId
 * @param type
 * @return
 */
	MemberImage findBySmemberidAndIimagetype(String memberId, int type);
/**
 * by会员id和图片id查找会员图片
 * @param memberId
 * @param imageid
 * @return
 */
	MemberImage findBySmemberidAndId(String memberId, String imageid);
	
	List<MemberImage> findBySmemberid(String memberid);
	
	@Query("select count(*) from MemberImage where smemberid=?1 and iimagetype=?2 ")
	long countImageType(String memberId, int type);
	

//frogsingcode//
}

