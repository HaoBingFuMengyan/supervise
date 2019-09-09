package com.frogsing.member;

import java.util.LinkedHashMap;
import java.util.List;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletResponse;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.InvoiceInfo;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.MemberAddress;
import com.frogsing.member.utils.MEMBER.MemberType;
import com.frogsing.member.vo.LoginUser;

public interface IMemberService{

	/***
	 * 根据ID查找唯一记录
	 * 
	 * @param memberID
	 * @return
	 */
	Member findByID(String memberID);


	List<Member> findByInImembertype(List<Integer> imembertype);

	Member findByMemberNo(String memberNo);

	String getMemberCompanyDescByMemberID(String sMemberID);

	/**
	 * 保存会员信息
	 * @param obj
	 * @param u
	 * @throws ServiceException
     */
	void saveMember(Member obj,ILoginUser u) throws ServiceException;

	/**
	 * 
	 * UpdateMemeberSmobile
	 */
	void UpdateMemeberSmobile(String smemberid, String smobile);

	/***
	 * 判断数据库是否已经存在当前公司名称的记录
	 */
	boolean isExistCNName(String cnName, String id);

	/***
	 * 判断数据库是否已经存在当前公司简称的记录
	 */
	boolean isExistShortName(String shortName, String id);

	/***
	 * 保存会员图片 boolean 如果某种类型的图片已经存在则修改
	 */
	String saveFtpImages(String operatorID, String memberID, String fileName, String fileAddress, int saveType)
			throws ServiceException;

	/***
	 * 会员读取图片 void
	 * 
	 * @throws ServiceException
	 */
	void getImages(HttpServletResponse response, String memberId, String imageid) throws ServiceException;

	/***
	 * 根据类型获取会员证件图片ID String
	 * 
	 * @param memberId
	 *            <String> 会员ID
	 * @param type
	 *            <int> 图片类型
	 * 
	 * @throws ServiceException
	 */
	String getImageIdByType(String memberId, int type) throws ServiceException;

	/***
	 * 检查会员资料是否完整
	 * 
	 * @param member
	 *            <Member> 会员ID
	 * @return nullStr<String> 为空的字段
	 */
	String isDataIntegrity(Member member) throws ServiceException;

	/***
	 * 根据会员类型查询所有会员
	 * 
	 * @param memberType
	 *            <int> 会员类型
	 * @return Map<String, List<Member>>
	 */
	LinkedHashMap<String, List<Member>> getAllRegMembers(int memberType);


	//void setFileStoreService(IFileStoreService fileStoreService);


	List<Member> queryMemberByKey(String str, MemberType membertype);

	void updateMemberType(String id, Integer imembertype);

	/**
	 * 企业认证
	 * @author 17783
	 * @param obj
	 * @param user
	 * @param params  可能会用到的参数
	 */
	void doAuthApply_b(Authapply obj,ILoginUser user);

	/*
	 * 查询所有的挂牌交易会员
	*/
	List<Member> findallgpmeb();

	Member checkCompanyMember(String memberid);

	/**
	 * 申请认证或修改认证资料用
	 * 
	 * @param scnname
	 * @param smemberid
	 * @return
	 */
	boolean isUniqueUserUpdate(String scnname, String smemberid);

	/**
	 * 根据条件判断是否有同名公司
	 * 
	 * @return
	 */
	boolean countCnName(int memberType, int authType, String scnname);

	/**
	 *	校验企业全称是否重复 
	 */
	Member findByScnname(String scnname);
	
	/**
	 * 认证和审核时的检查都在里面，方便检查两次
	 * @param apply
	 */
	void authRequired(Authapply apply);

	/**
	 * 保存收货地址
	 * @param memberAddress
     */
	void saveMemberAddress(MemberAddress memberAddress);

	/**
	 * 设置收货地址
	 * @param saddressid
     */
	void doSetDefaultAddress(String saddressid);

	/**
	 * 删除地址
	 * @param saddressid
     */
	void doDeleteAddress(String saddressid);

	List<InvoiceInfo> findByMemberID(String memberid);

	void saveInvoiceInfo(InvoiceInfo invoiceinfo,ILoginUser user);
	
	void saveCompanyinfo(String id,String smobile,String slinkman,String scompanydesc, ILoginUser user);

	void modifyImembertype(String id,Integer imembertype);

	/**
	 * 上传会员logo
	 * @param id
	 * @param slogo
	 */
	void memberSlogo(String id,String slogo);


	void saveQmAcount(String memberid, String signAccount);



}