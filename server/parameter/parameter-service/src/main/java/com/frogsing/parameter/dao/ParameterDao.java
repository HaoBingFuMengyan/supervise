package com.frogsing.parameter.dao;
//frogsingcode//


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.parameter.po.Parameter;


//frogsingcode//
public interface ParameterDao extends BaseDao<Parameter, String>{
//frogsingcode//

	@Query("select sparametervalue from Parameter where iparatype=?1" )
	String getParaValue(int i);

	@Procedure(name = "pd_GetSeqNo")
    String pd_GetSeqNo(@Param("Atablename") String tbname);


//frogsingcode//
}

