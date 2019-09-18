package com.frogsing.member.service;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyService;
import com.frogsing.member.dao.*;
import com.frogsing.member.po.*;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBER.CheckStatus;
import com.frogsing.member.utils.MEMBER.MemberType;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.member.utils.MEMBERCol.hy_authapply;
import com.frogsing.member.vo.MemVo;
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

	@Autowired
	private NaturalHolderDao naturalHolderDao;

	@Autowired
	private CompanyHolderDao companyHolderDao;

	@Autowired
	private ControHolderDao controHolderDao;



	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IAuthapplyService#reject(java.lang.String, java.lang.String, com.frogsing.heart.security.shiro.ILoginUser)
	 */
	@Override
	public void reject(String id, String scheckinfo, ILoginUser currentUser) {
		Authapply apply = authapplyDao.lock(id);
		if (apply == null){
			E.S("当前账户异常，请联系管理员");
		}

		if (apply.getIstatus() == CheckStatus.CHECKED.val() || apply.getIstatus() == CheckStatus.REJECT.val()){
			E.S("申请已处理");
		}

		apply.setIstatus(CheckStatus.REJECT.val());
		apply.setDcheckdate(new Date());
		apply.setScheckinfo(scheckinfo);
		apply.setScheckuser(currentUser.getLoginName());

		authapplyDao.saveAndFlush(apply);
	}

	/**
	 * 复审
	 *
	 * @param id
	 * @param scheckinfo
	 * @param currentUser
	 */
	@Override
	public void changeInfoCheck(String id,int iapprovalstatus, String scheckinfo, ILoginUser currentUser) {
		Authapply apply = authapplyDao.lock(id);
		if (apply == null){
			E.S("当前账户异常，请联系管理员");
		}

		if (apply.getIapprovalstatus() == MEMBER.ApprovalStatus.CHECKED.val() || apply.getIapprovalstatus() == MEMBER.ApprovalStatus.REJECT.val()){
			E.S("变更申请已处理，请勿重复操作");
		}

		apply.setIapprovalstatus(iapprovalstatus);
		apply.setDcheckdate(new Date());
		apply.setScheckinfo(scheckinfo);
		apply.setScheckuser(currentUser.getLoginName());

		authapplyDao.saveAndFlush(apply);
	}

	/**
	 * 招商机构初审
	 *
	 * @param id
	 * @param iprocess
	 * @param user
	 */
	@Override
	public void firstcheck(String id, int iprocess, ILoginUser user) {
		Authapply apply = authapplyDao.lock(id);
		if (apply == null){
			E.S("当前企业异常，请联系管理员");
		}

		if (!apply.getSadduser().equals(user.getId()))
			E.S("系统警告，该企业不归您审核，谢谢");

		if (MEMBER.Process.ZSJG.isNot(apply.getIprocess()))
			E.S("已审核，请勿重复操作");

		apply.setIprocess(iprocess);
		apply.setScheckuser(user.getId());
		apply.setDcheckdate(new Date());

		this.authapplyDao.saveAndFlush(apply);

	}

	/**
	 * 街道办事处审核
	 *
	 * @param id
	 * @param iprocess
	 * @param user
	 */
	@Override
	public void againcheck(String id, int iprocess, ILoginUser user) {
		Authapply apply = authapplyDao.lock(id);
		if (apply == null){
			E.S("当前企业异常，请联系管理员");
		}

		if (MEMBER.Process.JDBSC.isNot(apply.getIprocess()))
			E.S("已审核，请勿重复操作");

		apply.setIprocess(iprocess);
		apply.setScheckuser(user.getId());
		apply.setDcheckdate(new Date());

		if (MEMBER.Process.OK.isEq(iprocess))
			apply.setBisincompany(Consts.BoolType.YES.val());

		this.authapplyDao.saveAndFlush(apply);
	}

	/**
	 * 申请入住
	 *
	 * @param obj
	 * @param user
	 * @return
	 */
	@Override
	public Authapply applyregister(Authapply obj, ILoginUser user) {
		if (obj == null)
			E.S("错误的操作，请联系管理员");

		if (B.Y(obj.getId()))
			E.S("错误的操作，请联系管理员");

		if (B.Y(obj.getScnname()))
			E.S("企业名称不能为空");

		if (B.Y(obj.getSlinkman()) || B.Y(obj.getSfdlinkman()) || B.Y(obj.getSkzrlinkman()))
			E.S("联系人不能为空");
		if (B.Y(obj.getSmobile()) || B.Y(obj.getSfdsmobile()) || B.Y(obj.getSkzrsmobile()))
			E.S("联系人手机号不能为空");
		if (B.Y(obj.getSemail()) || B.Y(obj.getSfdemail()) || B.Y(obj.getSkzremail()))
			E.S("联系人Email不能为空");

		if (B.Y(obj.getSbusaddress()))
			E.S("通讯地址不能为空");

		if (B.Y(obj.getSbusinessno()))
			E.S("请先上传营业执照");

		if (B.Y(obj.getScnuno()))
			E.S("请先上传承诺函");

		if (B.Y(obj.getSgxrtno()))
			E.S("请先上传关系人控制图");

		Authapply authapply = this.authapplyDao.findOne(obj.getId());

		authapply.setScnname(obj.getScnname());
		authapply.setSlinkman(obj.getSlinkman());
		authapply.setSmobile(obj.getSmobile());
		authapply.setSemail(obj.getSemail());
		authapply.setSfdlinkman(obj.getSfdlinkman());
		authapply.setSfdsmobile(obj.getSfdsmobile());
		authapply.setSfdemail(obj.getSfdemail());
		authapply.setSkzrlinkman(obj.getSkzrlinkman());
		authapply.setSkzrsmobile(obj.getSkzrsmobile());
		authapply.setSkzremail(obj.getSkzremail());

		authapply.setSbusinessno(obj.getSbusinessno());
		authapply.setScnuno(obj.getScnuno());
		authapply.setSgxrtno(obj.getSgxrtno());

		authapply.setSbusaddress(obj.getSbusaddress());
		authapply.setIprocess(MEMBER.Process.ZSJG.val());


		return this.authapplyDao.saveAndFlush(authapply);
	}

	/**
	 * 企业信息变更申请
	 *
	 * @param memVo
	 * @param authapply
	 * @param user
	 * @return
	 */
	@Override
	public Authapply changeInfo(MemVo memVo, Authapply authapply, ILoginUser user) {

		if (B.Y(authapply.getId()))
			E.S("系统警告，异常，请联系管理员");

		Authapply apply = this.authapplyDao.lock(authapply.getId());

		int iprocess = apply.getIprocess();

		int istatus = apply.getIstatus();

		List<NaturalHolder> naturalHolders = naturalHolderDao.findByPropertyName(MEMBERCol.hy_naturalholder.smemberid,authapply.getId());
		List<CompanyHolder> companyHolders = companyHolderDao.findByPropertyName(MEMBERCol.hy_companyholder.smemberid,authapply.getId());
		List<ControHolder> controHolders = controHolderDao.findByPropertyName(MEMBERCol.hy_controholder.smemberid,authapply.getId());

		naturalHolderDao.delete(naturalHolders);
		companyHolderDao.delete(companyHolders);
		controHolderDao.delete(controHolders);

		memVo.setId(apply.getId());

		//申请认证信息
		memberService.doAuthApply_b(memVo,user);

		//企业申请入住信息
		Authapply auth = applyregister(authapply,user);

		apply.setIprocess(iprocess);
		apply.setIstatus(istatus);
		apply.setIapprovalstatus(MEMBER.ApprovalStatus.WAIT.val());

		this.authapplyDao.saveAndFlush(auth);

		return apply;
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

		Authapply apply =authapplyDao.lock(id);
		if (apply == null){
			E.S("当前账户异常，请联系管理员");
		}

		if (apply.getIstatus() == CheckStatus.CHECKED.val() || apply.getIstatus() == CheckStatus.REJECT.val()){
			E.S("申请已处理");
		}

		apply.setIstatus(CheckStatus.CHECKED.val());
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
