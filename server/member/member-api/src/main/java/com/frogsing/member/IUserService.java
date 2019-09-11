package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Actor;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.User;
import com.frogsing.member.vo.TRegister;
import com.frogsing.member.vo.UserActorVo;

import javax.frogsing.exception.ServiceException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public interface IUserService {

	/**
	 * 新增用户
	 * @param obj
	 * @param user
	 * @return
	 */
	User newUser(User obj,ILoginUser user);

	/**
	 * 修改
	 * @param obj
	 * @param user
	 * @return
	 */
	User modifyUser(User obj,ILoginUser user);


	Member findBySmemberid(String smemberid);

	List<Member> findUserByMemberName(String sMemberid, String MemberName) throws ServiceException;

	/**
	 * 
	 * UpdateUserSmobile
	 */
	void UpdateUserSmobile(String id, String smobile);

	/**
	 * 
	 * UpdateUserSpassword
	 */
	void UpdateUserSpassword(String susername, String spassword);

	void Save(User obj, String id, String[] role,ILoginUser u);

	void resetRegisterPass(String id);

	/**
	 * 管理员禁用或启用用户
	 * 
	 * @param id
	 * @param opname
	 * @param isAble
	 */
	void deleteuser(String id, String opname, int isAble);

	/**
	 *
	 * @param userid
	 * @param newpassword
	 */
	void passwd(String userid, String newpassword);

	/**
	 * 已选中的角色
	 * 
	 * @param userid
	 * @return
	 */
	List<Actor> findCheckedActor(String userid);

	/**
	 * 未选中的角色
	 * 
	 * @param userid
	 * @return
	 */
	List<Actor> findNotCheckedActor(String userid);

	/**
	 * 保存用户角色
	 * 
	 * @param userid
	 * @param checkRoleId
	 */
	void useractorsave(String userid, String checkRoleId);

	/**
	 * 保存销客
	 * 
	 * @param user
	 * @param m
	 */
	void salesmanSave(User user, Member m,ILoginUser u);

	/**
	 * 会员注册
	 * 
	 * @return
	 * @throws Exception
	 */
	Member register(TRegister vo) throws Exception;

	void CheckWord(TRegister r);

	/**
	 * 验证手机号格式及是否重复
	 * 
	 * @param smobile
	 */
	void CheckWord(String smobile);

	/**
	 * 添加交易员
	 * 
	 * @param obj
	 */
	void addUser(User obj,ILoginUser u);

	/**
	 * 前台修改交易员信息
	 * 
	 * @param user
	 */
	void updateUser(User user,ILoginUser u);

	List<Actor> findDefaultRole(int authType, int memberType, String smemberid);

	List<UserActorVo> userRoleList(int authType, int roleType, String smemberid, String userid);

	User findAdminByMember(String memberId) throws ServiceException;

	List<User> findByMember(String memberId) throws ServiceException;

	int sendSiteMsg(String title, String msg, User o);

	User findByUser(String userName) throws ServiceException;

	void adminUpdatePassword(String newpassword, String userid, String memberid, int type);

	void checkTradePasswd(String userId, String password) throws ServiceException;

	/**
	 * 根据类型修改用户的密码
	 * 
	 * @param oldpassord
	 *            旧密码
	 * @param newpassword
	 * @param userid
	 * @param memberid
	 * @param type
	 *            0 登录密码 1 交易密码
	 */
	void updatePassword(String oldpassord, String newpassword, String userid, String memberid, int type);

	// 设置交易密码
	void firstTradePwd(String userid, String stradepassword);

	void findPassword(String userName, String smobile);

	void findTradePassword(String id);

	boolean isUniqueUser(String susername);

	void BaseDelete(String[] checkboxId) throws ServiceException;

	void newPassword(String newpassword, String userid);

	User findnewPassword(String userName, String smobile);

	boolean findBySusernameAndSmobile(String susername, String smobile);

	long getCurrMonthCount(String firstday, String lastday);

	User findBySusernameOrSmobile(String susername, String smobile);

	Collection<String> getAllPurview(int membertype, int authtype, String memberId);

	void updateLoginTime(String id, Date currentDateTime);
	void doLoginFail(String username,Date currentDateTime);

	Collection<String> getAllPurview(String id);

	Collection<String> getAllSpecialPurview(int membertype, String memberId);

	User fetchUser(String id);

	User findOne(String id);


	void saveUser(String id,User user);
	
	User findOneBySmobile(String smobile);

	void tradepassword(String suserid,String oldpwd,String newpwd);

	User getBisadmin(String smemberid);

	List<User> findUserByRight(String right);

	List<User> findUserByRole(String role);

	void updateTerminal(String userid,int terminaltype,String clientid);
}