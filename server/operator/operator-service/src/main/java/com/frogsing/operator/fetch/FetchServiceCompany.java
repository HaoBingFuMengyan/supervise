package com.frogsing.operator.fetch;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.dao.ServiceCompanyDao;
import com.frogsing.operator.po.ServiceCompany;

@Component
@Transactional(propagation=Propagation.MANDATORY)
public class FetchServiceCompany extends BaseFetch<ServiceCompany > {

	@Autowired
	private ServiceCompanyDao serviceCompanyDao;
	@Override
	public void beforeSave(ServiceCompany vo, ServiceCompany po, ILoginUser u) {
//
	}
	
}
