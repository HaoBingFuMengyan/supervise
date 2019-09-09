package com.frogsing.member.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.RelaResource;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


//frogsingcode//

public interface RelaResourceDao extends BaseDao<RelaResource, String>{
//frogsingcode//

    @Query("select sresourceid from RelaResource where sproductid=?1")
    List<String> findSresourceidBySproductid(String sproductid);

//frogsingcode//
}

