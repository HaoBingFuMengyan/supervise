package com.frogsing.member.service;

import com.frogsing.common.utils.NoticeUtils;
import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.consts.Consts.BoolType;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.ObjectUtils;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyService;
import com.frogsing.member.IMemberService;
import com.frogsing.member.dao.*;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.PayAccount;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBER.AuthenticateType;
import com.frogsing.member.utils.MEMBER.CheckStatus;
import com.frogsing.member.utils.MEMBER.MemberType;
import com.frogsing.member.utils.MEMBERCol.hy_authapply;
import org.apache.commons.lang3.StringUtils;
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
import java.util.*;


@Component
@Transactional
public class AuthapplyService implements IAuthapplyService {

	@Autowired
	private AuthapplyDao authapplyDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PayAccountDao payAccountDao;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private IQueryService queryService;
	@Autowired
	private MemberShopDao memberShopDao;
	@Autowired
	private MemberShopApplyDao memberShopApplyDao;



	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IAuthapplyService#reject(java.lang.String, java.lang.String, com.frogsing.heart.security.shiro.ILoginUser)
	 */
	@Override
	public void reject(String id, String scheckinfo, ILoginUser currentUser) {
		Authapply apply = authapplyDao.findOne(id);
		if (apply == null ||apply.getIstatus() == CheckStatus.CHECKED.val()){
			E.S("当前账户异常，请联系管理员");
		}

		if(StringUtils.isEmpty(scheckinfo)){
			E.S("请填写审核信息");
		}
		apply.setIstatus(CheckStatus.REJECT.val());
		apply.setDcheckdate(new Date());
		apply.setScheckinfo(scheckinfo);
		apply.setScheckuser(currentUser.getLoginName());
		// 企业认证申请拒绝发短信
		Map<String, Object> sentmap = new HashMap<String, Object>();
		sentmap.put(NoticeUtils.SendMessageType.SENDTYPE, NoticeUtils.SendMessageType.ToUser.val());
		sentmap.put(NoticeUtils.SendMessageType.TOUSERID, apply.getSapplyuserid());
		sentmap.put("obj", apply);
		if (apply.getIapplytype() == AuthenticateType.Company.val()) {
			sentmap.put(NoticeUtils.SendMessageType.NODECODE, "RejectCompanyApply");
//			JobUtils.nowJob(ITaskSendMemberMsg.class, "企业认证审核拒绝", sentmap);
		} else if(apply.getIauthtype() == AuthenticateType.PERSONAL.val()){
			sentmap.put(NoticeUtils.SendMessageType.NODECODE, "RejectPersonalApply");
//			JobUtils.nowJob(ITaskSendMemberMsg.class, "个人认证申请拒绝", sentmap);
		}
		authapplyDao.save(apply);
		authapplyDao.flush();
	}

	/**
	 * 审核通过认证信息
	 * @author XiaoYao
	 * @param id
	 * @param scheckinfo
	 */
	@Override
	public void checkOk(String id, String scheckinfo, ILoginUser user) {
		Objects.requireNonNull(user);
		Objects.requireNonNull(id);
		Authapply apply =Objects.requireNonNull(authapplyDao.findOne(id)) ;
		//再次检查认证信息
		memberService.authRequired(apply);

		Member member=Objects.requireNonNull(queryService.fetchOne(Member.class,apply.getSmemberid())) ;
		if (member == null ||AuthenticateType.Company.val()!=apply.getIapplytype()){
			E.S("会员处于异常状态");
		}

		boolean b = memberService.isUniqueUserUpdate(apply.getScnname(), apply.getSmemberid());
		if (!b) {
			E.S("该公司名已被使用");
		}

		if(StringUtils.isEmpty(scheckinfo)){
			E.S("请填写审核信息");
		}

		if (apply.getIstatus() == CheckStatus.CHECKED.val()){
			E.S("申请已处理");
		}
		if (AuthenticateType.No.val() != apply.getIauthtype()){
			E.S("已经认证过了");
		}
		if (!memberService.countCnName(apply.getImembertype(), apply.getIapplytype(), apply.getScnname())) {
			E.S("已有同名公司!");
		}


		apply.setIstatus(CheckStatus.CHECKED.val());
		apply.setDcheckdate(new Date());
		apply.setScheckinfo(scheckinfo);
		apply.setScheckuser(user.getLoginName());
		apply.setIauthtype(AuthenticateType.Company.val());   //审核通过才保存认证类型
		authapplyDao.save(apply);
		authapplyDao.flush();

		// 根据认证信息重新修正会员
		ObjectUtils.copyObjValue(apply, member, false,"id");

		member.setBismembercert(Consts.BoolType.YES.val());
		member.setIauthtype(AuthenticateType.Company.val());
		member.setDmodifydate(new Date());
		member.setScheckuserid(user.getId());
		member.setDcheckdate(new Date());
		member.setImembertype(MEMBER.MemberType.MEMBER.val());
		memberDao.save(member);
		memberDao.flush();

		PayAccount pac=new PayAccount();
		pac.setId(null);
		pac.setSmemberid(apply.getSmemberid());
		pac.setSbank(member.getSopenbank());
		pac.setSbankaccount(member.getSopenaccount());
		pac.setSrecvname(member.getScnname());
		pac.setDadddate(T.now());
		pac.setDmodifydate(T.now());
		payAccountDao.save(pac);

		member.setBisopenshop(BoolType.NO.val());
		memberDao.save(member);

		// 发送通知短信
		Map<String, Object> sendmap = new HashMap<String, Object>();
		sendmap.put(NoticeUtils.SendMessageType.SENDTYPE, NoticeUtils.SendMessageType.ToUser.val());
		sendmap.put(NoticeUtils.SendMessageType.TOUSERID, apply.getSapplyuserid());
		sendmap.put("obj", apply);

		if (AuthenticateType.Company.val()==apply.getIauthtype()) {
			sendmap.put(NoticeUtils.SendMessageType.NODECODE, "PassCompanyApply");
//			JobUtils.nowJob(ITaskSendMemberMsg.class, "企业认证申请审核通过", sendmap);
		}else if(apply.getIauthtype() == AuthenticateType.PERSONAL.val()){
			sendmap.put(NoticeUtils.SendMessageType.NODECODE, "PassPersonalApply");
//			JobUtils.nowJob(ITaskSendMemberMsg.class, "个人认证申请审核通过", sendmap);
		}

		memberDao.flush();


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
