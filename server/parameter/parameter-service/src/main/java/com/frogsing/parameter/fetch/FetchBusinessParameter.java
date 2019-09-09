package com.frogsing.parameter.fetch;

import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.parameter.dao.BusinessParameterDao;
import com.frogsing.parameter.po.BusinessParameter;
import com.frogsing.parameter.utils.PARAMETERCol.cs_businessparameter;
import com.frogsing.parameter.utils.ParaBufferClear;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.Date;
import java.util.List;

@Component
public class FetchBusinessParameter extends BaseFetch<BusinessParameter>{

	@Autowired
	private BusinessParameterDao businessParameterDao;

	@Override
	public void commonCheck(BusinessParameter obj,com.frogsing.heart.web.login.ILoginUser u) {
		this.checkMulti(obj);
		if (B.Y(obj.getId())) {// add
			obj.setId(null);
			obj.setDadddate(new Date());
			obj.setSaddoperator(u.getLoginName());
		} else {// update
			obj.setDmodifydate(new Date());
			obj.setSmodifyoperator(u.getLoginName());
		}
	}

	/**
	 * 校验参数是否重复
	 * 
	 * @param obj
	 * @return
	 */
	private void checkMulti(final BusinessParameter obj) {
		
		long count = businessParameterDao
				.count(new Specification<BusinessParameter>() {

					@Override
					public Predicate toPredicate(Root<BusinessParameter> root,
							CriteriaQuery<?> query, CriteriaBuilder cb) {

						List<Predicate> list = Lists.newArrayList();
						list.add(cb.equal(
								
								root.get(cs_businessparameter.sparametername),
								obj.getSparametername()));
						list.add(cb.equal(
								root.get(cs_businessparameter.iparatype),
								obj.getIparatype()));
						if (B.N(obj.getId())) {
							list.add(cb.notEqual(root.get("id"), obj.getId()));
						}

						return cb.and(list.toArray(new Predicate[list.size()]));
					}
				});
		if (count > 0)
			throw new ServiceException("数据重复");
	}

	public List<BusinessParameter> getAllParameters(int biztype) {

		return businessParameterDao.findByIparatypeOrderByIsortAsc(biztype);
	}
	
	@Override
	public void afterSave(BusinessParameter vo, BusinessParameter po, ILoginUser u) {
		ParaBufferClear.clear();
	}
	
	@Override
	public void afterUpdte(BusinessParameter vo, BusinessParameter po, ILoginUser u) {
		ParaBufferClear.clear();
	}
	
	@Override
	public void afterDelete(List<BusinessParameter> list) {
		ParaBufferClear.clear();
	}
}
