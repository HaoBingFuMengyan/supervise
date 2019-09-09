package com.frogsing.parameter.dao;
//frogsingcode//


import java.util.List;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.parameter.po.BusinessParameter;


//frogsingcode//
public interface BusinessParameterDao extends BaseDao<BusinessParameter, String>{
//frogsingcode//

	public BusinessParameter findBySparametername(String paramname);

	public List<BusinessParameter>  findByIparatypeOrderByIsortAsc(int paratype);


//frogsingcode//
}

