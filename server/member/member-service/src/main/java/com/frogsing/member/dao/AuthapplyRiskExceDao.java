package com.frogsing.member.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.AuthapplyRiskExce;
import org.springframework.data.jpa.repository.Query;


//frogsingcode//

public interface AuthapplyRiskExceDao extends BaseDao<AuthapplyRiskExce, String>{
//frogsingcode//


    @Query("select count(*) from AuthapplyRiskExce where sriskdetailid = ?1")
    long countBySriskdetailid(String id);

//frogsingcode//
}

