package com.frogsing.member.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.MemberShopApply;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


//frogsingcode//

public interface MemberShopApplyDao extends BaseDao<MemberShopApply, String> {
//frogsingcode//


    @Query("from MemberShopApply t where t.smemberid=?1 and (t.istatus=?2 or t.istatus=?3) order by t.dapplydate desc")
    List<MemberShopApply> findBySmemberidAndIstatusOrIstatusOrderByDapplydateDesc(String smemberid, Integer istatus, Integer status);

    MemberShopApply findByIdAndIstatus(String id, Integer istatus);

//frogsingcode//
}

