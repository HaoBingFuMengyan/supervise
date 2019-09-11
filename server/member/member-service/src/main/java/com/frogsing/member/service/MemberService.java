/** 
 * MemberService.java
 * create on 2011-1-21
 * Copyright 2011-2015 Frongsing All Rights Reserved.
 */
package com.frogsing.member.service;

import com.frogsing.common.utils.NoticeUtils;
import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.DateUtils;
import com.frogsing.heart.utils.StringHelper;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IMemberService;
import com.frogsing.member.dao.AuthapplyDao;
import com.frogsing.member.dao.MemberAddressDao;
import com.frogsing.member.dao.MemberDao;
import com.frogsing.member.dao.MemberImageDao;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.MemberAddress;
import com.frogsing.member.po.MemberImage;
import com.frogsing.member.utils.MEMBER.*;
import com.frogsing.member.utils.MEMBERCol.hy_authapply;
import com.frogsing.member.utils.MEMBERCol.hy_member;
import com.frogsing.parameter.utils.ParaUtils;
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
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 会员Service类
 * 
 * @author <a href="mailto:service@frogsing.com">chain</a>
 * @since version1.0
 */
@Component
@Transactional
public class MemberService  implements IMemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private MemberImageDao memberImageDao;
	@Autowired
	private MemberAddressDao memberAddressDao;



	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#findByID(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public Member findByID(String memberID) {
		Member _member = null;
		if (!B.Y(memberID))
			_member = memberDao.findOne(memberID);
		return _member;
	}



	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#findByInImembertype(java.util.List)
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Member>  findByInImembertype(List<Integer> imembertype){
		return memberDao.findByInImembertype(imembertype);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#findByMemberNo(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public Member findByMemberNo(String memberNo) {
		return memberDao.findBySmemberno(memberNo);

	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#getMemberCompanyDescByMemberID(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public String getMemberCompanyDescByMemberID(String sMemberID) {
		Object rs = memberDao.getFieldValue("select scompanydesc from hy_member where sguid=?", sMemberID);
		return rs == null ? "" : rs.toString();

	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#saveMember(com.frogsing.po.entity.hy.Member)
	 */
	@Override
	public void saveMember(final Member obj,ILoginUser u) throws ServiceException {
		Authapply apply = authapplyDao.findOneByPropertyName(hy_authapply.smemberid, obj.getId());
		if (B.Y(obj.getId())) {// 添加会员
			E.S("不支持后台新增");
			obj.setId(null);
			obj.setBdelete(0);
			obj.setDadddate(DateUtils.getCurrentDateTime());
			//obj.setBisspread(0);
			String memberno = ParaUtils.seqno("hy_member");
			obj.setSmemberno(memberno);
			obj.setSadduser(u.getLoginName());
			obj.setImembertype(MemberType.MEMBER.val());
			if(StringHelper.hasCn(obj.getScnname())){
				obj.setSpyname((StringHelper.getFullSpell(obj.getScnname())));
				obj.setSjpname(StringHelper.getFirstSpell(obj.getScnname()));
			}else{
				obj.setSpyname(obj.getScnname());
				obj.setSjpname(obj.getScnname());
			}
			obj.setDapplydate(DateUtils.getCurrentDateTime());
			obj.setSregmoneytype("人民币");
			obj.setIscope(0);
			obj.setIauthtype(AuthenticateType.No.val());
			obj.setImemberstatus(MemberStatus.NORMAL.val());
			obj.setBismembercert(Consts.BoolType.NO.val());
			memberDao.save(obj);
		} else {// 修改会员
			Member m =Objects.requireNonNull(memberDao.findOne(obj.getId()),"会员不存在");
			//需要修改的字段
			if(m.getIauthtype()==AuthenticateType.No.val())
				m.setScnname(obj.getScnname());
			m.setSshortname(obj.getSshortname());				//中文简称
			m.setSbusinessmode(obj.getSbusinessmode());			//经营模式
			m.setSmemberkind(obj.getSmemberkind());				//企业性质
			m.setSlegalperson(obj.getSlegalperson());			//法人
			m.setSlegalpersoncode(obj.getSlegalpersoncode());   //法人身份证
			m.setIemployeeamount(obj.getIemployeeamount()==null?0:obj.getIemployeeamount());   	//员工人数
			m.setIregmoney(obj.getIregmoney()) ;				//注册资金
			m.setSprovince(obj.getSprovince());
			m.setScity(obj.getScity());         
			m.setSbusaddress(obj.getSbusaddress());             //详细地址
			m.setSremark(obj.getSremark());
			m.setDmodifydate(DateUtils.getCurrentDateTime());
			m.setSmodifyoperator(u.getLoginName());
			memberDao.save(m);
		}
		
	}


	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#UpdateMemeberSmobile(java.lang.String, java.lang.String)
	 */
	@Override
	public void UpdateMemeberSmobile(String smemberid, String smobile) {
		if (B.Y(smemberid))
			E.S("会员ID不能为空！");
		if (B.Y(smobile))
			E.S("手机号不能为空！");
		Member member = memberDao.findOne(smemberid);
		if (member.getSmobile().equals(smobile))
			E.S("原手机号和新手机号重复不能进行更换操作！");
		member.setSmobile(smobile);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#isExistCNName(java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public boolean isExistCNName(final String cnName, final String id) {
		int flag = 0;
		if (!B.Y(cnName)) {
			if (B.Y(id))
				flag += memberDao.countCnName(MemberType.MEMBER.val(), AuthenticateType.Company.val(), cnName);
			else
				flag += memberDao.countCnName(MemberType.MEMBER.val(), AuthenticateType.Company.val(), cnName, id);
			// flag += (bankMemberDao.count(rz_bankmember.scnname,cnName,
			// id)?1:0);
		}
		return flag > 0 ? true : false;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#isExistShortName(java.lang.String, java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public boolean isExistShortName(final String shortName, final String id) {
		int flag = 0;
		if (!B.Y(shortName)) {
			if (B.Y(id))
				flag += memberDao.countShortName(MemberType.MEMBER.val(), AuthenticateType.Company.val(), shortName);
			else
				flag += memberDao.countShortName(MemberType.MEMBER.val(), AuthenticateType.Company.val(), shortName,
						id);
			// flag += (bankMemberDao.count(rz_bankmember.sshortname,shortName,
			// id)?1:0);
		}
		return flag > 0 ? true : false;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#saveFtpImages(java.lang.String, java.lang.String, java.lang.String, java.lang.String, int)
	 */
	@Override
	public String saveFtpImages(String operatorID, String memberID, String fileName, String fileAddress, int saveType)
			throws ServiceException {
		String imageId = null;
		if (B.Y(operatorID) || B.Y(memberID) || B.Y(fileName) || B.Y(fileAddress)) {
			throw new ServiceException("输入参数为空！");
		}
		MemberImage _memberImage = memberImageDao.findBySmemberidAndIimagetype(memberID, saveType);
		if (_memberImage == null)
			_memberImage = new MemberImage();
		_memberImage.setSimageno("");
		_memberImage.setSmemberid(memberID);
		_memberImage.setSimagename(fileName);
		_memberImage.setIimagetype(saveType);
		_memberImage.setSaddress(fileAddress);
		_memberImage.setSuserid(operatorID);
		_memberImage.setDaddtime(T.now());

		memberImageDao.save(_memberImage);
		return imageId;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#getImages(javax.servlet.http.HttpServletResponse, java.lang.String, java.lang.String)
	 */
	@Override
	public void getImages(final HttpServletResponse response, final String memberId, final String imageid)
			throws ServiceException {
		if (response == null || B.Y(memberId) || B.Y(imageid))
			throw new ServiceException("输入参数为空！");
		// 查找该会员是否拥有此图片
		MemberImage _memberImage = memberImageDao.findBySmemberidAndId(memberId, imageid);
		if (_memberImage == null)
			throw new ServiceException("图片信息不存在！");
		try {
			//fileStoreService.getImg(response, imageid);
		} catch (Exception e) {
			throw new ServiceException("读取图片失败！");
		}
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#getImageIdByType(java.lang.String, int)
	 */
	@Override
	@Transactional(readOnly = true)
	public String getImageIdByType(final String memberId, final int type) throws ServiceException {
		String _imageid = null;
		if (!B.Y(memberId)) {
			MemberImage _memberImage = memberImageDao.findBySmemberidAndIimagetype(memberId, type);
			if (_memberImage != null)
				_imageid = _memberImage.getSaddress();
		} else
			throw new ServiceException("服务器忙，请稍后再试！");
		return _imageid;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#isDataIntegrity(com.frogsing.po.entity.hy.Member)
	 */
	@Override
	@Transactional(readOnly = true)
	public String isDataIntegrity(final Member member) throws ServiceException {
		StringBuffer nullStr = new StringBuffer("");
		if (member != null) {
			if (B.Y(member.getScnname())) // 公司名称
				nullStr.append("企业全称，");
		}
		String errorStr = nullStr.toString();
		return B.Y(errorStr) ? null : errorStr.substring(0, errorStr.length() - 1);
	}


	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#getAllRegMembers(int)
	 */
	@Override
	public LinkedHashMap<String, List<Member>> getAllRegMembers(int memberType) {
		LinkedHashMap<String, List<Member>> mListMap = new LinkedHashMap<String, List<Member>>();
		List<Member> list = memberDao.findByImembertype(memberType);
		if (list != null && list.size() > 0) {
			List<Member> nList = null;
			for (int i = 0; i < list.size(); i++) {
				// 当前会员
				Member _member = list.get(i);
				// 当前会员的简拼字母
				String word = null;
				if (!B.Y(_member.getSjpname())) {
					word = _member.getSjpname().substring(0, 1);
				} else {
					word = StringHelper.getFirstSpell(_member.getScnname().trim()).substring(0, 1);
				}

				if (mListMap.containsKey(word)) {
					mListMap.get(word).add(_member);
				} else {
					nList = new ArrayList<Member>();
					nList.add(_member);
					mListMap.put(word, nList);
				}
			}
		}
		return mListMap;
	}


	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#setMemberDao(com.frogsing.dao.hy.MemberDao)
	 */
	@Autowired
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	
	@Override
	public List<Member> queryMemberByKey(final String str, MemberType membertype) {

		if (!StringUtils.isNumeric(str)) {
			return this.memberDao.findAllLimit(new Specification<Member>() {
				@Override
				public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					return cb.and(cb.equal(hy_member.imemberstatus(root),MemberStatus.NORMAL.val()),
							cb.equal(hy_member.imembertype(root),membertype.val()),
							cb.or(
									cb.like(hy_member.scnname(root),"%"+str.trim()+"%"),
									cb.like(hy_member.sshortname(root),"%"+str.trim()+"%"),
									cb.like(hy_member.sshortnamejpname(root),"%"+str.trim()+"%"),
									cb.like(hy_member.sshortnamepyname(root),"%"+str.trim()+"%"),
									cb.like(hy_member.sjpname(root),"%"+str.trim()+"%"),
									cb.like(hy_member.spyname(root),"%"+str.trim()+"%")
							)
					);
				}
			},new Sort(Direction.DESC,hy_member.dadddate),10);
		} else {
			return this.memberDao.findAllLimit(new Specification<Member>() {
				@Override
				public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					return cb.and(cb.equal(hy_member.imemberstatus(root),MemberStatus.NORMAL.val()),
							cb.equal(hy_member.imembertype(root),membertype.val()),
							cb.like(hy_member.scnname(root),"%"+str.trim()+"%")
					);
				}
			},new Sort(Direction.DESC,hy_member.dadddate),10);
		}


	}

	
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#updateMemberType(java.lang.String, java.lang.Integer)
	 */
	@Override
	public void updateMemberType(String id,Integer imembertype){
		Member member = memberDao.findOne(id);
		if(member != null)
			member.setImembertype(imembertype);
	}
	@Autowired
	private AuthapplyDao authapplyDao;


	/**
	 * 申请认证
	 * @author XiaoYao
	 * @param obj   //页面上的vo
	 * @user  //LoginUser
	 */
	@Override
	public void doAuthApply_b(final Authapply obj,ILoginUser user) { 
		Member member = memberDao.lock(user.getMemberId());
		//普通的检查，与authapply相关的检查都在里面了，方便审核的时候再检查一遍
		authRequired(obj);
		boolean b = isUniqueUserUpdate(obj.getScnname().replace(" ",""), member.getId());
		if (!b) {
			E.S("该公司名已被使用");
		}
		
		
		List<Authapply> applylist =authapplyDao.findAll(new Specification<Authapply>() {
			
			@Override
			public Predicate toPredicate(Root<Authapply> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
				return cb.and(cb.equal(root.get(hy_authapply.smemberid), user.getMemberId()),cb.equal(root.get(hy_authapply.istatus), CheckStatus.WAIT.val()));
			}
		});
		List<Authapply> sapplylist =authapplyDao.findAll(new Specification<Authapply>() {

			@Override
			public Predicate toPredicate(Root<Authapply> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
				return cb.and(cb.equal(root.get(hy_authapply.ssocialcreditno), obj.getSsocialcreditno()),cb.equal(root.get(hy_authapply.istatus), CheckStatus.CHECKED.val()));
			}
		});
		if(B.N(sapplylist)){
			E.S("统一社会代码已存在");
		}
				//authapplyDao.findOneByPropertyName(hy_authapply.smemberid, obj.getSmemberid());
		Authapply apply=null;
		if(B.N(applylist))
			apply=applylist.get(0);
		if (apply == null) {   //第一次申请
			apply = new Authapply();
			apply.setSmemberid(member.getId());
			apply.setSmemberno(member.getSmemberno());
			

			apply.setSapplyuserid(user.getId()); //申请人
			apply.setDapplydate(new Date());
			apply.setDadddate(new Date());
			apply.setSadduser(user.getName());
			apply.setSapplyuserid(user.getId());
			apply.setIapplytype(AuthenticateType.Company.val());
		}
		if(apply.getIauthtype()==AuthenticateType.Company.val()){
			E.S("已经通过企业认证了");
		}
		apply.setDmodifydate(new Date());    
		apply.setSmodifyoperator(user.getName());    
		//需要保存的字段
		//认证的数据

		apply.setScnname(obj.getScnname().replace(" ",""));
		if(StringHelper.hasCn(obj.getScnname())){
			apply.setSpyname(StringHelper.getFullSpell(obj.getScnname()));  //拼音名
			apply.setSjpname(StringHelper.getFirstSpell(obj.getScnname()));	//简拼名
		}else{
			apply.setSenname(obj.getScnname());
			apply.setSjpname(StringHelper.getFirstSpell(obj.getScnname()));	//简拼名
		}
		apply.setSsocialcreditno(obj.getSsocialcreditno());
		apply.setSbusinessno(obj.getSbusinessno());
		apply.setIstatus(CheckStatus.WAIT.val());
		apply.setSlinkman(obj.getSlinkman());
		apply.setSmobile(member.getSmobile());
		apply.setSphone(obj.getSphone());

		apply.setScountry(obj.getScountry());
		apply.setSprovince(obj.getSprovince());
		apply.setScity(obj.getScity());
		apply.setSregion(obj.getSregion());
		apply.setSbusaddress(obj.getSbusaddress());
		apply.setSbusinessmode(obj.getSbusinessmode());//经营模式
		apply.setSopenbank(obj.getSopenbank());//开户行
		apply.setSopenname(obj.getSopenname());//开户名称
		apply.setSopenaccount(obj.getSopenaccount());//开户行账号
		apply.setSunionaccount(obj.getSunionaccount());//联行号
		//apply.setIcompanytype(obj.getIcompanytype());//公司类型 int
		apply.setScompanydesc(obj.getScompanydesc()); //公司简介
		authapplyDao.save(apply);
		// 企业认证申请发短信
		Map<String, Object> ma = new HashMap<String, Object>();
		ma.put(NoticeUtils.SendMessageType.SENDTYPE, NoticeUtils.SendMessageType.ToUser.val());
		ma.put(NoticeUtils.SendMessageType.NODECODE, "CompanyApply");
		ma.put(NoticeUtils.SendMessageType.TOUSERID, apply.getSapplyuserid());
		ma.put("obj", apply);
//		JobUtils.nowJob(ITaskSendMemberMsg.class, "企业认证申请提交成功给会员发短信", ma);

		//企业认证申请通知平台客服
		Map<String, Object> _map_zhujun = new HashMap<String, Object>();
		_map_zhujun.put(NoticeUtils.SendMessageType.SENDTYPE, NoticeUtils.SendMessageType.ToPlatRight.val());
		_map_zhujun.put(NoticeUtils.SendMessageType.NODECODE, "CompanyApplyToPingtai");
		_map_zhujun.put(NoticeUtils.SendMessageType.SENDRIGHT, "companyapply:send");
		_map_zhujun.put("scnname",apply.getScnname());//企业名称
//		JobUtils.nowJob(ITaskSendMemberMsg.class, "企业认证申请发送短信给客服", _map_zhujun);
	}


	/**
	 * 与认证有关的检查，方便审核的时候再检查一遍
	 * @author XiaoYao
	 */
	public void authRequired(Authapply obj){
		if(B.Y(obj.getScnname())){
			E.S("请填写公司名称");
		}
		if(B.Y(obj.getSsocialcreditno())){
			E.S("请填写统一社会信用代码");
		}
		if (B.Y(obj.getSopenbank()))
			E.S("开户行不能为空");
		if (B.Y(obj.getSopenname()))
			E.S("账户全称不能为空");
		if (B.Y(obj.getSopenaccount()))
			E.S("开户行账号不能为空");
		if(B.Y(obj.getSlinkman())){
			E.S("请填写联系人");
		}
		if(B.Y(obj.getSphone())){
			E.S("请填写公司电话");
		}
		if(obj.getIcompanytype()==null){
			E.S("请填写公司类型");
		}
		if (memberImageDao.countImageType(obj.getSmemberid(), ImageType.BUSINESSNO.val()) == 0){
			E.S("请先上传营业执照副本");
		}
		if(B.Y(obj.getSprovince())|| B.Y(obj.getScity())){
			E.S("请填写完整的公司所在地");
		}
		if (B.Y(obj.getSbusaddress())) {
			E.S("请填写公司详细地址");
		}
		
		if (obj.getIapplytype() != AuthenticateType.Company.val()){
			E.S("认证类型不正确");
		}
	}
	
	
	

	/*
	 * 查询所有的挂牌交易会员
	*/
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#findallgpmeb()
	 */
	@Override
	public List<Member> findallgpmeb() {
		return memberDao.findAll(new Specification<Member>() {

			@Override
			public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

				return cb.equal(root.get(hy_member.iauthtype), AuthenticateType.Company.val());
			}

		});
	}


	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#checkCompanyMember(java.lang.String)
	 */
	@Override
	public Member checkCompanyMember(String memberid) {
		Member member = memberDao.findOne(memberid);
		if (member == null)
			E.S("会员不存在");
		if (Consts.BoolType.YES.isEq(member.getBdelete()))
			E.S("会员不存在");
		if (MemberStatus.NORMAL.isNot(member.getImemberstatus()))
			E.S("会员状态不正常");

		// if(AuthenticateType.Company.isNot(member.getIauthtype()) ||
		// AuthenticateType.VIP.isNot(member.getIauthtype()))
		// E.S("会员还没有进行企业认证，请先完成企业认证");
		return member;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#isUniqueUserUpdate(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean isUniqueUserUpdate(String scnname, String smemberid) {
		if (B.Y(scnname))
			return true;// 为空时,不验证
		long c = memberDao.countIgnoreCaseMember(hy_member.scnname, scnname.trim());
		if (c > 0) {
			List<Member> m = this.memberDao.findByPropertyName(hy_member.scnname, scnname);
			if(m.size()>1)
				return false;
			if (m.get(0).getIauthtype() > 0 && !m.get(0).getId().equals(smemberid)) {
				return false;
			}
			return true;
		} else
			return true;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#countCnName(int, int, java.lang.String)
	 */
	@Override
	public boolean countCnName(int memberType,int authType,String scnname){
		if (memberDao.countCnName(memberType,authType,scnname) > 0) {
			return false;
		}
		return true;
	}
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMemberService#findByScnname(java.lang.String)
	 */
	@Override
	public Member findByScnname(String scnname){
		return memberDao.findByScnname(scnname);
	}


	@Override
	public void saveMemberAddress(MemberAddress memberAddress) {

		if(memberAddress.getBisdefault()==1){  //如果是默认地址，先把原先的默认地址改成不默认
			memberAddressDao.executeNativeSql("update hy_memberaddress set bisdefault=0 where smemberid='"+memberAddress.getSmemberid()+"'");
		}
		memberAddressDao.save(memberAddress);
	}

	@Override
	public void doSetDefaultAddress(String saddressid) {
		MemberAddress memberAddress = this.memberAddressDao.findOne(saddressid);
		if(memberAddress==null)
			E.S("收货地址不存在!");

		memberAddressDao.executeNativeSql("update hy_memberaddress set bisdefault=0 where smemberid='"+memberAddress.getSmemberid()+"'");
		memberAddress.setBisdefault(Consts.BoolType.YES.getVal());
		memberAddressDao.save(memberAddress);
	}

	@Override
	public void doDeleteAddress(String saddressid) {

		MemberAddress memberAddress = this.memberAddressDao.findOne(saddressid);
		if(memberAddress==null)
			E.S("收货地址不存在!");

		memberAddressDao.delete(memberAddress);
	}

	@Override
	public void saveCompanyinfo(String id,String smobile,String slinkman,String scompanydesc, ILoginUser user) {
		if(B.Y(id))
			E.S("会员不存在");
		Authapply a=authapplyDao.lock(id);
		a.setSmobile(smobile);
		a.setSlinkman(slinkman);
		a.setScompanydesc(scompanydesc);
		authapplyDao.save(a);
		Member meb=memberDao.lock(a.getSmemberid());
		meb.setSmobile(smobile);
		meb.setSlinkman(slinkman);
		meb.setScompanydesc(scompanydesc);
		memberDao.save(meb);
	}

	@Override
	public void modifyImembertype(String id, Integer imembertype) {
		Member member = this.memberDao.findOne(id);

		if (member == null)
			E.S("会员不存在，请检查");
		if (AuthenticateType.No.isEq(member.getIauthtype()))
			E.S("还未通过认证，请先认证");

		member.setImembertype(imembertype);
		member.setDmodifydate(new Date());

		this.memberDao.save(member);

	}

	/**
	 * 上传会员logo
	 *
	 * @param id
	 * @param slogo
	 */
	@Override
	public void memberSlogo(String id, String slogo) {
		Member member = this.memberDao.findOne(id);

		if (member == null)
			E.S("会员不存在，请检查");
		member.setSlogo(slogo);
		member.setDmodifydate(new Date());

		this.memberDao.save(member);
	}


	@Override
	public void saveQmAcount(String memberid,String signAccount) {
		if (B.Y(signAccount)) {
			E.S("上上签账户不能为空");
		}
		Member member = memberDao.lock(Optional.ofNullable(memberid).orElse(""));
		if (member == null) {
			E.S("会员不存在");
		}

        member.setSsignaccount(signAccount);
		member.setBisbestsign(Consts.BoolType.YES.val());
		memberDao.save(member);
	}





}
