package com.frogsing.parameter.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.parameter.po.SystemPara;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


//frogsingcode//

public interface SystemParaDao extends BaseDao<SystemPara, String> {
//frogsingcode//

    @Query("select  svaluepara from SystemPara where snamepara=?1")
    String findByName(String name);

    @Query("update SystemPara a set a.svaluepara=?2 where a.snamepara=?1")
    @Modifying
    void updatePara(String key, String value);


//frogsingcode//
}

