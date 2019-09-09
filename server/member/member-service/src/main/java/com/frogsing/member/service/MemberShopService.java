package com.frogsing.member.service;

import com.frogsing.common.utils.NoticeUtils;
import com.frogsing.heart.consts.Consts.BoolType;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.ObjectUtils;
import com.frogsing.member.IMemberService;
import com.frogsing.member.IMemberShopService;
import com.frogsing.member.dao.MemberDao;
import com.frogsing.member.dao.MemberShopApplyDao;
import com.frogsing.member.dao.MemberShopDao;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.MemberShop;
import com.frogsing.member.po.MemberShopApply;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBER.AuthenticateType;
import com.frogsing.member.utils.MEMBER.ImageType;
import com.frogsing.member.utils.MEMBER.ShopStatus;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.member.utils.MEMBERCol.hy_authapply;
import com.frogsing.member.utils.MEMBERCol.hy_member;
import com.frogsing.member.utils.MEMBERCol.hy_membershop;
import com.frogsing.member.vo.LoginUser;
import com.frogsing.parameter.utils.PARAMETER.SysParaType;
import com.frogsing.parameter.utils.ParaUtils;
import com.google.common.collect.Lists;
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
public class MemberShopService implements IMemberShopService{


	@Autowired
	private IMemberService iMemberService;

	@Autowired
	private MemberShopDao memberShopDao;

	@Autowired
	private MemberShopApplyDao memberShopApplyDao;

	@Autowired
	private IQueryService queryService;

	@Autowired
	private MemberDao memberDao;


	/**
	 * 最新的申请记录
	 * @author XiaoYao
	 * @param memberid
	 * @return
	 */
	public MemberShop findLastApply(String memberid) {
		List<MemberShop> list = memberShopDao.findAll(new Specification<MemberShop>() {
			@Override
			public Predicate toPredicate(Root<MemberShop> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.get(hy_membershop.smemberid), memberid);
			}
		}, new Sort(Direction.DESC, hy_membershop.dapplydate));
		if (list != null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	/**
	 * 审核店铺
	 * @author XiaoYao
	 * @param id
	 */
	@Override
	public void check(String id,boolean checkok,String text){
		MemberShopApply shop=Objects.requireNonNull(queryService.fetchOne(MemberShopApply.class,Objects.requireNonNull(id)));
		if (shop == null)
			E.S("店铺不存在");
		shop.setScheckmark(text);

		Member member = Objects.requireNonNull(queryService.fetchOne(Member.class,shop.getSmemberid()));
		if(shop.getIstatus()>ShopStatus.Apply.val()){
			E.S("申请已处理");
		}

		if(checkok){      //审核通过
			if(countByShopNameAndStatus(shop.getSshopname(),ShopStatus.Open.val())>0){
				throw new ServiceException("已有同名店铺");
			}
			shop.setDopendate(new Date());
			shop.setIstatus(ShopStatus.Open.val());

			//保存会员
			member.setBisopenshop(BoolType.YES.val());
			memberDao.save(member);

			MemberShop ms=new MemberShop();
			List<MemberShop> mlist=memberShopDao.findByPropertyName(hy_membershop.smemberid, shop.getSmemberid());
			if(B.N(mlist))
				ms=mlist.get(0);
			ObjectUtils.copyObjValue(shop, ms);

			memberShopDao.save(ms);
		}else{
			shop.setIstatus(ShopStatus.Refuse.val());
		}

		memberShopApplyDao.save(shop);

//		if(checkok){
//			NoticeUtils.sendToUser("openShopSuccess",Objects.requireNonNull(auth.getSapplyuserid()), null);
//		}else{
//			NoticeUtils.sendToUser("OpenShopFailed",Objects.requireNonNull(auth.getSapplyuserid()), null);
//		}

	}

	/**
	 * 根据shopname和状态统计条数
	 * @return
	 */
	@Override
	public long countByShopNameAndStatus(String shopName,int istatus) {
		if(StringUtils.isEmpty(shopName)){
			throw new ServiceException("店铺名称不能为空");
		}
		return 	memberShopDao.countByShopNameAndStatus(shopName,istatus);
	}

	/**
	 * 修改店铺logo
	 *
	 * @param id
	 * @param slogo
	 */
	@Override
	public void modifyMemberShopSlogo(String id,String slogo) {
		MemberShop memberShop = this.memberShopDao.findOne(id);

		if (memberShop == null)
			E.S("店铺还未开通");
		if (ShopStatus.Open.isNot(memberShop.getIstatus()))
			E.S("店铺状态不正确，不能修改logo");

		memberShop.setSlogo(slogo);

		this.memberShopDao.save(memberShop);

	}

	@Override
	public MemberShop findBySmemberid(String smemberid) {
		return this.memberShopDao.findBySmemberid(smemberid);
	}

	@Override
	public void memberShopApply(Member member,int type, String slogo, String sbannerurl, String scompanydesc, String ssuccessexam) {
		MemberShop memberShop = queryService.findOneByProperty(MemberShop.class, MEMBERCol.hy_membershop.smemberid,member.getId());
		if (memberShop == null)
			E.S("请先申请开通店铺");

		if (type == 0)
			memberShop.setSlogo(slogo);
		else if (type == 1)
			memberShop.setSbannerurl(sbannerurl);
		else if (type == 2)
			memberShop.setScompanydesc(scompanydesc);
		else
			memberShop.setSsuccessexam(ssuccessexam);

		this.memberShopDao.save(memberShop);
	}


}




