package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyService;
import com.frogsing.member.dao.AuthapplyDao;
import com.frogsing.member.dao.MemberDao;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.Member;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBER.CheckStatus;
import com.frogsing.member.utils.MEMBER.MemberType;
import com.frogsing.member.utils.MEMBERCol.hy_authapply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Component
@Transactional
public class AuthapplyService implements IAuthapplyService {

	@Autowired
	private AuthapplyDao authapplyDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;
	@Autowired
	private IQueryService queryService;



	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IAuthapplyService#reject(java.lang.String, java.lang.String, com.frogsing.heart.security.shiro.ILoginUser)
	 */
	@Override
	public void reject(String id, String scheckinfo, ILoginUser currentUser) {
		Authapply apply = authapplyDao.findOne(id);
		if (apply == null){
			E.S("当前账户异常，请联系管理员");
		}

		if (apply.getIstatus() == CheckStatus.CHECKED.val() || apply.getIstatus() == CheckStatus.REJECT.val()){
			E.S("申请已处理");
		}

		if (apply.getIapprovalstatus() == MEMBER.ApprovalStatus.CHECKED.val() || apply.getIapprovalstatus() == MEMBER.ApprovalStatus.REJECT.val()){
			E.S("申请已处理");
		}

		apply.setIstatus(CheckStatus.REJECT.val());
		apply.setIapprovalstatus(MEMBER.ApprovalStatus.REJECT.val());
		apply.setDcheckdate(new Date());
		apply.setScheckinfo(scheckinfo);
		apply.setScheckuser(currentUser.getLoginName());

		authapplyDao.saveAndFlush(apply);
	}

	/**
	 * 审核通过认证信息
	 * @author haobingfu
	 * @param id
	 * @param scheckinfo
	 */
	@Override
	public void checkOk(String id, String scheckinfo, ILoginUser user) {
		Objects.requireNonNull(user);
		Objects.requireNonNull(id);

		Authapply apply =Objects.requireNonNull(authapplyDao.findOne(id)) ;
		if (apply == null){
			E.S("当前账户异常，请联系管理员");
		}

		if (apply.getIstatus() == CheckStatus.CHECKED.val() || apply.getIstatus() == CheckStatus.REJECT.val()){
			E.S("申请已处理");
		}

		if (apply.getIapprovalstatus() == MEMBER.ApprovalStatus.CHECKED.val() || apply.getIapprovalstatus() == MEMBER.ApprovalStatus.REJECT.val()){
			E.S("申请已处理");
		}


		apply.setIstatus(CheckStatus.CHECKED.val());
		apply.setIapprovalstatus(MEMBER.ApprovalStatus.CHECKED.val());
		apply.setDcheckdate(new Date());
		apply.setScheckinfo(scheckinfo);
		apply.setScheckuser(user.getLoginName());
		authapplyDao.saveAndFlush(apply);
	}


	@Override
	public void refMember(String smemberid) {

		Member m = memberDao.findOne(smemberid);
		if(m==null)
			E.S("会员不存在"+smemberid);
		if(m.getIauthtype()== MemberType.EXCHANGE.val())
			return;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IAuthapplyService#findByType(int, java.lang.String)
	 */
	@Override
	public List<Authapply> findByType(final int type, final String memberid) throws ServiceException {
		return authapplyDao.findAll(new Specification<Authapply>() {
			@Override
			public Predicate toPredicate(Root<Authapply> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.and(cb.equal(root.get(hy_authapply.iauthtype), type),
						cb.equal(root.get(hy_authapply.smemberid), memberid));
			}
		}, new Sort(Direction.DESC, hy_authapply.dapplydate));
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IAuthapplyService#findLastApply(java.lang.String)
	 */
	@Override
	public Authapply findLastApply(final String memberid) {
		List<Authapply> list = authapplyDao.findAll(new Specification<Authapply>() {
			@Override
			public Predicate toPredicate(Root<Authapply> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(hy_authapply.smemberid), memberid);
			}
		}, new Sort(Direction.DESC, hy_authapply.dmodifydate));
		if (list != null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	@Override
	public Authapply findOne(String id) {
		return authapplyDao.findOne(id);
	}
}
