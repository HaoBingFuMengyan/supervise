package com.frogsing.log.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.log.po.BillCheck;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


//frogsingcode//

public interface BillCheckDao extends BaseDao<BillCheck, String>{
//frogsingcode//
@Query("from BillCheck where sbillid=?1")
  List <BillCheck> findByBillid(String billid);


//frogsingcode//
}

