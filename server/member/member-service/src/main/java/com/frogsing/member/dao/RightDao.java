package com.frogsing.member.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.Right;
import org.springframework.data.jpa.repository.Query;

import java.util.Collection;
import java.util.List;


//frogsingcode//
public interface RightDao extends BaseDao<Right, String>{
//frogsingcode//



    /**
     * 根据权限码和会员类型统计数量
     * @param url
     * @param imembertype
     * @return
     */
    @Query("select count(*) from Right where surlpath=?1 and ipurtype=?2 and bisleaf=1")
    long rightCount(String url,int imembertype);
    @Query("select count(*) from Right where surlpath=?1 and ipurtype=?2 and id!=?3 and bisleaf=1")
    long rightCount(String url,int imembertype,String not_me_id);

    List<Right> findByIpurtype(int iroletype);
    @Query("select t.spurviewid from ActorRight t where t.sroleid=?1")
    Collection<String> findRoleRight(String sroleid);


    List<Right> findBySparentid(String rightid);

//frogsingcode//
}

