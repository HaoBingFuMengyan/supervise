package com.frogsing.member.service;

import com.frogsing.common.utils.JobUtils;
import com.frogsing.common.utils.NoticeUtils;
import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.consts.Consts.BoolType;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.log.Lg;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.security.utils.MD5;
import com.frogsing.heart.utils.*;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IMemberService;
import com.frogsing.member.IUserService;
import com.frogsing.member.dao.*;
import com.frogsing.member.po.*;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBER.AuthenticateType;
import com.frogsing.member.utils.MEMBER.MemberStatus;
import com.frogsing.member.utils.MEMBER.MemberType;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.member.utils.MEMBERCol.hy_member;
import com.frogsing.member.utils.MEMBERCol.hy_user;
import com.frogsing.member.vo.TRegister;
import com.frogsing.member.vo.UserActorVo;
import com.frogsing.parameter.utils.ParaUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.*;
import javax.persistence.criteria.CriteriaBuilder.In;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Component
@Transactional
public class UserService implements IUserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserActorDao userActorDao;
    @Autowired
    private MemberDao memberDao;

    @Autowired
    private ActorDao actorDao;

    @Autowired
    private ActorService actorService;

    @Autowired
    private IMemberService memberService;

    @Autowired
    private IQueryService queryService;


    /**
     * 新增用户
     *
     * @param obj
     * @param user
     * @return
     */
    @Override
    public User newUser(User obj, ILoginUser user) {
        if (userDao.countSusername(obj.getSusername()) > 0) {
            throw new ServiceException("用户名不能重复");
        }
        Member memberBean = new Member();
        memberBean.setIregsource(MEMBER.IRegSource.PARTNER.val());

        memberBean.setImembertype(MemberType.MEMBER.val());// 公司类型（交易会员）
        memberBean.setIscope(BoolType.NO.val());
        Date currDate = DateUtils.getCurrentDateTime();
        memberBean.setSmemberno(ParaUtils.seqno(hy_member.tablename));
        memberBean.setScountry("");// 默认中国
        memberBean.setBcaflag(0);// 默认设置使用CA
        memberBean.setDapplydate(currDate);// 申请日期
        memberBean.setDadddate(currDate);// 设置会员注册日期
        memberBean.setDmodifydate(currDate);// 设置最后修改日期
        memberBean.setImemberstatus(MemberStatus.NORMAL.val());// 设置会员为待完善资料
        memberBean.setBdelete(0);// 设置会员是否删除
        memberBean.setIauthtype(AuthenticateType.No.val());
        memberBean.setSmobile(obj.getSmobile());
        memberBean.setScnname("");
        memberBean.setSpyname("");// 设置拼音全称
        memberBean.setSjpname("");// 设置拼音简称
        memberBean.setBisinit(BoolType.NO.val());
        memberBean.setSadduser(user.getId());

        // 地理位置信息
        memberBean.setSlocation("");

        memberDao.save(memberBean);

        User operatorBean = new User();
        operatorBean.setSoperatorno(ParaUtils.seqno(hy_user.tablename));// 设置交易员编号
        operatorBean.setSusername(obj.getSusername());// 交易员登录名 //fan:手机号可以改,所以手机号不要作为用户名
        operatorBean.setSname(obj.getSname());// 交易员名称
        operatorBean.setSmobile(obj.getSmobile());// 联系手机
        operatorBean.setSemail(obj.getSemail());// 联系邮箱
        operatorBean.setSphone(obj.getSphone());// 联系电话

        operatorBean.setSmemberid(memberBean.getId());// 设置会员ID
        operatorBean.setSpassword(MD5.encode(obj.getSpassword()));// 加密密码
        operatorBean.setDadddate(currDate);// 设置交易员添加日期
        operatorBean.setDmodifydate(currDate);// 设置最后修改日期
        operatorBean.setBisadmin(Consts.BoolType.YES.val());// 设置为默认管理员
        operatorBean.setBisvalid(Consts.BoolType.YES.val());// 设置交易员是否有效
        operatorBean.setBisdelete(Consts.BoolType.NO.val());// 设置交易员是否删除
        operatorBean.setBisymobile(1);
        operatorBean.setBisyemail(0);
        operatorBean.setSaddoperator(user.getId());//添加人
        operatorBean.setSqq(obj.getSqq());
        operatorBean.setIsex(obj.getIsex());
        userDao.saveAndFlush(operatorBean);// 保存交易员信息

        return operatorBean;
    }

    /**
     * 修改
     *
     * @param obj
     * @param user
     * @return
     */
    @Override
    public User modifyUser(User obj, ILoginUser user) {
        User operatorBean = this.userDao.findOne(obj.getId());

        operatorBean.setSmobile(obj.getSmobile());// 联系手机
        operatorBean.setSemail(obj.getSemail());// 联系邮箱
        operatorBean.setSphone(obj.getSphone());// 联系电话
        operatorBean.setSqq(obj.getSqq());
        operatorBean.setIsex(obj.getIsex());
        operatorBean.setDmodifydate(new Date());// 设置最后修改日期
        operatorBean.setSmodifyoperator(user.getId());//添加人
        operatorBean.setBisvalid(obj.getBisvalid());// 设置交易员是否有效

        this.userDao.save(operatorBean);
        return operatorBean;
    }

    @Override
    public User updateSpasswordAndSmobile(String id,String smobile,String spassword) {

        User u = this.userDao.findOne(id);

        u.setSpassword(MD5.encode(spassword));
        u.setSmobile(smobile);
        this.userDao.save(u);

        Member member = memberDao.findOne(u.getSmemberid());

        member.setBisinit(BoolType.YES.val());

        memberDao.save(member);
        return u;
    }

    @Override
    public Member findBySmemberid(String smemberid) {
        return memberService.findByID(smemberid);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Member> findUserByMemberName(final String sMemberid, final String MemberName) throws ServiceException {
        return memberDao.findAll(new Specification<Member>() {

            @Override
            public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                List<Predicate> list = Lists.newArrayList();
                list.add(cb.notEqual(root.get("id"), sMemberid));
                //	list.add(cb.equal(hy_member.bismembercert(root), 1));
                if (B.N(MemberName))
                    list.add(cb.like(hy_member.scnname(root), S.like(MemberName)));
                return S.andList(cb, list);
            }
        });
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#UpdateUserSmobile(java.lang.String, java.lang.String)
     */
    @Override
    public void UpdateUserSmobile(String id, String smobile) {
        if (B.Y(id))
            E.S("ID不能为空！");
        if (B.Y(smobile))
            E.S("手机号不能为空！");
        User user = userDao.findOne(id);
        if (user.getSmobile().equals(smobile))
            E.S("原手机号和新手机号重复不能进行绑定操作！");
        user.setSmobile(smobile);
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#UpdateUserSpassword(java.lang.String, java.lang.String)
     */
    @Override
    public void UpdateUserSpassword(String susername, String spassword) {
        if (B.Y(susername))
            E.S("账户名不能为空");
//        User user = userDao.findBySusername(susername);
        if (B.Y(spassword)) {
            E.S("密码不能为空");
        }
        User user = userDao.findBySmobile(susername);
        user.setSpassword(MD5.encode(spassword));
    }


    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#Save(com.frogsing.po.entity.hy.User, java.lang.String, java.lang.String[])
     */
    @Override
    public void Save(User obj, String id, String[] role, ILoginUser u) {
        if (B.Y(obj.getSmemberid()))
            E.S("会员不存在!");
        /*long count = userDao.countUser(obj.getSmemberid());
        if (userDao.count(new Specification<User>() {
			@Override
			public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate p = cb.equal(root.get(hy_user.smobile), obj.getSmobile());
				if (B.Y(obj.getId()))
					return p;
				else
					return cb.and(cb.notEqual(root.get("id"), obj.getId()), p);
			}
		}) > 0) {
			E.S("手机重复！");
		}*/
        Member m = memberDao.findOne(obj.getSmemberid());
        if (m == null) {
            E.S("会员不存在!");
        }
        long mobileCount = userDao.count(hy_user.xspec().and(SearchFilter.eq(hy_user.smobile, obj.getSmobile()), SearchFilter.ne("id", obj.getId())));
        if (mobileCount > 0) {
            E.S("手机号已被使用");
        }
        if (B.Y(obj.getId())) {
            if (0 < userDao.countIgnoreCase(hy_user.susername, obj.getSusername(), obj.getId()))
                E.S("用户名已存在!");
            obj.setDadddate(DateUtils.getCurrentDateTime());
            obj.setSaddoperator(u.getLoginName());
            obj.setBisdelete(Consts.BoolType.NO.val());
            String userno = ParaUtils.seqno(hy_user.tablename);
            obj.setSoperatorno(userno);
            obj.setBisymobile(Consts.BoolType.YES.val());
            obj.setBisyemail(Consts.BoolType.NO.val());
            obj.setBisvalid(Consts.BoolType.YES.val());
            obj.setSpassword(ShiroUtils.EncodePassword(obj.getSpassword()));

            obj = userDao.save(obj);
        } else {
//			List<UserActor> userActor = userActorDao.findBySuserid(obj.getId());
//			if(userActor.size()>0){
//				for(UserActor actor : userActor){
//					userActorDao.delete(actor);
//				}
//			}
            User us = userDao.findOne(obj.getId());
            us.setDmodifydate(DateUtils.getCurrentDateTime());
            us.setSmodifyoperator(u.getLoginName());
            us.setSusername(obj.getSusername());
            us.setSname(obj.getSname());
            us.setSmobile(obj.getSmobile());
            us.setSemail(obj.getSemail());
            us.setSphone(obj.getSphone());
            us.setIsex(obj.getIsex());
            us.setSqq(obj.getSqq());
            us.setBisadmin(obj.getBisadmin());
            us.setBisvalid(BoolType.YES.val());
            userDao.saveAndFlush(us);
        }

        if (role.length > 0) {
            for (int i = 0; i < role.length; i++) {
                UserActor userActor = new UserActor();
                userActor.setId(null);
                userActor.setSuserid(obj.getId());
                userActor.setSroleid(role[i]);
                userActorDao.save(userActor);
            }
        } else
            E.S("保存失败，用户角色不能为空");

    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#resetRegisterPass(java.lang.String)
     */
    @Override
    public void resetRegisterPass(String id) {
        User user = userDao.findOne(id);
        if (user == null)
            E.S("用户不存在!");
        String password = "a" + RandomStringUtils.randomNumeric(6);
        System.out.println(password);
        user.setSpassword(ShiroUtils.EncodePassword(password));
        userDao.save(user);
        if (B.N(user.getSmobile())) {
            //重置会员密码发短信
            Map<String, Object> map = new HashMap<String, Object>();
            map.put(NoticeUtils.SendMessageType.SENDTYPE, NoticeUtils.SendMessageType.ToUser.val());
            map.put(NoticeUtils.SendMessageType.NODECODE, "findpasswd");
            map.put(NoticeUtils.SendMessageType.TOUSERID, user.getId());
            map.put("code", password);
//            JobUtils.nowJob(ITaskSendMemberMsg.class, "重置会员密码", map);
            //NoticeUtils.sendSmsWithNode("findpasswd", user.getSmobile(), map);
        }
    }

    /**
     * 禁用或启用会员
     */
    @Override
    public void deleteuser(String id, String opname, int isAble) {
        User user = this.userDao.findOne(id);
        if (null == user || null == opname) {
            E.S("操作出错!");
        }
        user.setBisvalid(isAble);
        user.setDmodifydate(new Date());
        user.setSmodifyoperator(opname);
        this.userDao.save(user);
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#passwd(java.lang.String, java.lang.String)
     */
    @Override
    public void passwd(String userid, String newpassword) {

        User user = userDao.findOne(userid);
        if (user == null)
            E.S("用户不存在!");
        user.setSpassword(ShiroUtils.EncodePassword("123456"));
        userDao.save(user);

    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findCheckedActor(java.lang.String)
     */
    @Override
    public List<Actor> findCheckedActor(String userid) {

        int membertype = userDao.findMemberByUserid(userid);

        return userDao.findCheckedActor(membertype, userid);

    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findNotCheckedActor(java.lang.String)
     */
    @Override
    public List<Actor> findNotCheckedActor(String userid) {
        Member member = userDao.findMemberByUser(userid);
        List<Actor> list = userDao.findNotCheckedActor(member.getImembertype(), userid, member.getIauthtype(),
                0, member.getId());
        List<Actor> list2 = userDao.findSpecialNotCheckActor(member.getImembertype(), userid, member.getId());
        if (list == null)
            list = Lists.newArrayList();
        if (list2 != null)
            list.addAll(list2);
        return list;
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#useractorsave(java.lang.String, java.lang.String)
     */
    @Override
    public void useractorsave(String userid, String checkRoleId) {
        // 先删除角色对应的权限
        userDao.deleteUserActor(userid);
        String[] roleids = checkRoleId.split(",");
        for (String roleId : roleids) {
            Actor actor = actorDao.findOne(roleId);
            UserActor u = new UserActor();
            u.setSuserid(userid);
            if (actor.getBisspecial() == Consts.BoolType.YES.val())
                u.setSroleid(actor.getSspecialroleid());
            else
                u.setSroleid(roleId);
            userActorDao.save(u);
        }

    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#salesmanSave(com.frogsing.po.entity.hy.User, com.frogsing.po.entity.hy.Member)
     */
    @Override
    public void salesmanSave(User user, Member m, ILoginUser u) {

        if (B.Y(m.getScnname()))
            E.S("会员名称不能为空!");
        if (B.Y(user.getId())) {
            m.setId(null);
            m.setImaxoperator(1);
            //m.setImembertype(MemberType.MARKET.val());
            String memberno = ParaUtils.seqno("xk_salesman");

            m.setSmemberno(memberno);
            m.setImemberstatus(MemberStatus.NORMAL.val());
            m.setSshortname(m.getScnname());
            m.setDadddate(DateUtils.getCurrentDateTime());
            m.setDapplydate(m.getDadddate());
            m.setSadduser(u.getLoginName());

            memberDao.save(m);
            user.setSmemberid(m.getId());
            this.userDao.save(user);
        } else {
            Member old = memberDao.findOne(user.getSmemberid());
            if (old == null)
                E.S("会员不存在!");
            old.setScnname(m.getScnname());
//			if (m.getImembertype() != MemberType.MARKET.val())
//				E.S("会员类型有问题,期待销客类型!");
            old.setDmodifydate(DateUtils.getCurrentDateTime());
            old.setSmodifyoperator(u.getLoginName());
            memberDao.save(old);

            this.userDao.save(user);

        }

    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#register(com.frogsing.vo.hy.TRegister, int)
     */
    @Override
    public Member register(TRegister vo) throws Exception {
        if (vo == null) {
            E.S("非法操作");
        }
        // 会员信息记录到会员表,交易员信息记录到交易员表,初始化系统信息
        if (B.Y(vo.getSmobile())) {
            E.S("请输入手机号码");
        }
        if (B.Y(vo.getSpassword())) {
            E.S("请输入用户密码");
        }
        if (vo.getSpassword().length() < 6) {
            E.S("密码长度不能少于6位");
        }
        if (userDao.countMobile(vo.getSmobile()) > 0) {
            throw new ServiceException("手机号不能重复！");
        }

        Member memberBean = new Member();
        memberBean.setIregsource(1);

        memberBean.setImembertype(MemberType.MEMBER.val());// 公司类型（交易会员）
        memberBean.setIscope(0);
        Date currDate = DateUtils.getCurrentDateTime();
        memberBean.setSmemberno(ParaUtils.seqno(hy_member.tablename));
        memberBean.setScountry("中国");// 默认中国
        memberBean.setBcaflag(0);// 默认设置使用CA
        memberBean.setDapplydate(currDate);// 申请日期
        memberBean.setDadddate(currDate);// 设置会员注册日期
        memberBean.setDmodifydate(currDate);// 设置最后修改日期
        memberBean.setImemberstatus(MemberStatus.NORMAL.val());// 设置会员为待完善资料
        memberBean.setBdelete(0);// 设置会员是否删除
        memberBean.setIauthtype(AuthenticateType.No.val());
        memberBean.setSmobile(vo.getSmobile());
        if (vo.getScnname() != null) {
            memberBean.setScnname(vo.getScnname().trim());
            memberBean.setSpyname(StringHelper.getFullSpell(vo.getScnname().trim()));// 设置拼音全称
            memberBean.setSjpname(StringHelper.getFirstSpell(vo.getScnname().trim()));// 设置拼音简称
        }
        String memberno = ParaUtils.seqno(hy_member.tablename);
        memberBean.setSmemberno(memberno);

        // 地理位置信息
        memberBean.setSlocation(vo.getSlocation());

        memberDao.save(memberBean);// 保存会员信息
        User operatorBean = new User();
        operatorBean.setSoperatorno(ParaUtils.seqno(hy_user.tablename));// 设置交易员编号
        operatorBean.setSusername(operatorBean.getSoperatorno());// 交易员登录名 //fan:手机号可以改,所以手机号不要作为用户名
        operatorBean.setSname(vo.getSname());// 交易员名称
        operatorBean.setSpassword(vo.getSpassword());
        operatorBean.setSmobile(vo.getSmobile());// 联系手机
        operatorBean.setSemail(vo.getSemail());// 联系邮箱
        operatorBean.setSphone(vo.getSphone());// 联系电话

        operatorBean.setSmemberid(memberBean.getId());// 设置会员ID
        operatorBean.setSpassword(MD5.encode(vo.getSpassword()));// 加密密码
        operatorBean.setDadddate(currDate);// 设置交易员添加日期
        operatorBean.setDmodifydate(currDate);// 设置最后修改日期
        operatorBean.setBisadmin(Consts.BoolType.YES.val());// 设置为默认管理员
        operatorBean.setBisvalid(Consts.BoolType.YES.val());// 设置交易员是否有效
        operatorBean.setBisdelete(Consts.BoolType.NO.val());// 设置交易员是否删除
        operatorBean.setBisymobile(1);
        operatorBean.setBisyemail(0);
        userDao.saveAndFlush(operatorBean);// 保存交易员信息
        Map<String, Object> map = new HashMap<String, Object>();
        map.put(NoticeUtils.SendMessageType.SENDTYPE, NoticeUtils.SendMessageType.ToMember.val());
        map.put(NoticeUtils.SendMessageType.NODECODE, "remindCompanyApply");
        map.put(NoticeUtils.SendMessageType.TOMEMBERID, memberBean.getId());
//        JobUtils.nowJob(ITaskSendMemberMsg.class, "提醒会员认证", map);


        return memberBean;
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#CheckWord(com.frogsing.vo.hy.TRegister)
     */
    @Override
    public void CheckWord(TRegister r) {

//		final String mobile = r.getSmobile();
        if (B.Y(r.getSmobile()))
            E.S("手机号格式不正确!");
        /*if (userDao.count(new Specification<User>() {
            @Override
			public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate p = cb.equal(root.get(hy_user.smobile), mobile);
				return p;
			}
		}) >= 1) {

			E.S("该手机号已经被注册！");
		}*/

    }

    /**
     * (non-Javadoc)
     * 验证手机号格式是否正确，并且判断是否已经注册
     */
    @Override
    public void CheckWord(final String smobile) {
        if (B.Y(smobile))
            E.S("手机号不能为空！");
        Pattern pattern = Pattern.compile("^1[0-9]{10}$");
        boolean flag = pattern.matcher(smobile).matches();//验证手机号码是否正确
        if (!flag)
            E.S("" + smobile + "手机号格式不正确！");

        if (userDao.count(new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate p = cb.equal(root.get(hy_user.smobile), smobile);
                return p;
            }
        }) >= 1) {
            E.S("该手机号已经被注册！");
        }

    }

    /**
     * 添加交易员
     *
     * @param obj
     * @param u
     */
    @Override
    public void addUser(User obj, ILoginUser u) {

    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#updateUser(com.frogsing.po.entity.hy.User)
     */
    @Override
    public void updateUser(final User user, ILoginUser iu) {

        User u = this.userDao.findOne(user.getId());
        if (u == null)
            E.S("用户不存在!");
        if (!u.getSmemberid().equals(user.getSmemberid()))
            E.S("会员不存在!");
//        if (B.Y(user.getSmobile()))
//            E.S("手机号不能为空!");

        u.setSname(user.getSname());
        u.setIsex(user.getIsex());
        u.setBisvalid(user.getBisvalid());
        u.setSphone(user.getSphone());
        u.setSfax(user.getSfax());

        //   u.setSmobile(user.getSmobile());
        u.setSemail(user.getSemail());
        u.setSqq(user.getSqq());
        u.setSmsn(user.getSmsn());
        u.setSlikename(user.getSlikename());
        Date date = DateUtils.getCurrentDateTime();
        u.setDmodifydate(date);
        u.setSmodifyoperator(iu.getLoginName());
        this.userDao.save(u);

//        if (u.getBisadmin() == Consts.BoolType.NO.val()) {
//            userActorDao.deleteByUserid(u.getId());
//            String[] actorids = user.getSroleids();
//            if(actorids!=null)
//            for (String id : actorids) {
//                UserActor e = new UserActor();
//                e.setSroleid(id);
//                e.setSuserid(u.getId());
//                userActorDao.save(e);
//            }
//        }
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findDefaultRole(int, int, java.lang.String)
     */
    @Override
    public List<Actor> findDefaultRole(int authType, int memberType, String smemberid) {


        return actorDao.findByImemberstatusAndIroletypeOrSmemberidOrderByIsortnoAsc(authType, memberType, smemberid);
    }


    @Override
    public List<UserActorVo> userRoleList(int authType, int roleType, String smemberid, String userid) {
        List<Actor> defaults = this.findDefaultRole(authType, roleType, smemberid);
        List<UserActorVo> userActorVos = Lists.newArrayList();
        List<String> actorids = Lists.newArrayList();
        if (B.N(userid)) {
            List<UserActor> userActors = queryService.list(null, MEMBERCol.hy_useractor.xspec().and(SearchFilter.eq(MEMBERCol.hy_useractor.suserid, userid)));
            actorids = userActors.stream().map(UserActor::getSroleid).collect(Collectors.toList());
        }
        for (Actor actor : defaults) {
            UserActorVo userActorVo = new UserActorVo();
            userActorVo.setSroleid(actor.getId());
            userActorVo.setSrolename(actor.getSrolename());
            userActorVo.setIschecked(actorids.contains(actor.getId()));
            userActorVos.add(userActorVo);
        }
        return userActorVos;
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findAdminByMember(java.lang.String)
     */
    @Override
    public User findAdminByMember(String memberId) throws ServiceException {
        return userDao.findBySmemberidAndBisadmin(memberId, Consts.BoolType.YES.val());
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findByMember(java.lang.String)
     */
    @Override
    public List<User> findByMember(String memberId) throws ServiceException {
        return userDao.findBySmemberid(memberId);
    }


    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findByUser(java.lang.String)
     */
    @Override
    public User findByUser(String userName) throws ServiceException {
        if (B.Y(userName))
            E.S("用户名不能为空");
//        return this.userDao.findBySusername(userName);
        return this.userDao.findBySmobile(userName);
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#adminUpdatePassword(java.lang.String, java.lang.String, java.lang.String, int)
     */
    @Override
    public void adminUpdatePassword(String newpassword, String userid, String memberid, int type) {
        if (B.Y(newpassword))
            E.S("密码不能为空");
        if (newpassword.length() < 6)
            E.S("密码长度不能少于6位");

        User user = userDao.findOne(userid);
        if (user == null)
            E.S("用户不存在!");
        if (!user.getSmemberid().equals(memberid))
            E.S("无权改修非本会员用户密码!");

        if (0 == type) {
            user.setSpassword(ShiroUtils.EncodePassword(newpassword));
        } else {
            user.setStradepassword(ShiroUtils.EncodePassword(newpassword));
        }
        this.userDao.saveAndFlush(user);
        if (0 != type) {
            // 发送短信
            Map<String, Object> map = Maps.newHashMap();
            //ITaskSendMemberMsg.toUser(user.getId(), "SetTradePassword", "重置密码", map);
            NoticeUtils.sendToUser("SetTradePassword", user.getId(), map);
        }
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#checkTradePasswd(java.lang.String, java.lang.String)
     */
    @Override
    public void checkTradePasswd(String userId, String password) throws ServiceException {
        if (B.Y(password))
            E.S("请输入交易密码");
        User user = this.userDao.findOne(userId);
        if (user == null)
            E.S("用户不存在");
        if (B.Y(user.getStradepassword()))
            E.S("您还未设置交易密码，请先设置交易密码");
        //E.REDIRECT("请先设置交易密码", "/hy/user/gotradepassword.shtml");
        if (!user.getStradepassword().equals(ShiroUtils.EncodePassword(password)))
            E.S("交易密码输入有误");
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#updatePassword(java.lang.String, java.lang.String, java.lang.String, java.lang.String, int)
     */
    @Override
    public void updatePassword(String oldpassord, String newpassword, String userid, String memberid, int type) {
        if (B.Y(newpassword) || B.Y(oldpassord))
            E.S("密码不能为空");
        if (newpassword.length() < 6)
            E.S("密码长度不能少于6位");

        User user = userDao.findOne(userid);
        if (user == null)
            E.S("用户不存在!");
        if (!user.getSmemberid().equals(memberid))
            E.S("无权改修非会员用户密码!");

        if (0 == type) {
            if (!user.getSpassword().equals(ShiroUtils.EncodePassword(oldpassord)))
                E.S("旧登录密码不正确!");

            user.setSpassword(ShiroUtils.EncodePassword(newpassword));
        } else {
            if (B.N(user.getStradepassword())
                    && !user.getStradepassword().equals(ShiroUtils.EncodePassword(oldpassord)))
                E.S("旧交易密码不正确!");
            user.setStradepassword(ShiroUtils.EncodePassword(newpassword));
        }
        this.userDao.saveAndFlush(user);
        if (0 != type) {
            // 发送短信
            Map<String, Object> map = Maps.newHashMap();
            //ITaskSendMemberMsg.toUser(user.getId(), "SetTradePassword", "重置密码", map);
            NoticeUtils.sendToUser("SetTradePassword", user.getId(), map);
        }
    }

    // 设置交易密码
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IUserService#firstTradePwd(java.lang.String, java.lang.String)
	 */
    @Override
    public void firstTradePwd(String userid, String stradepassword) {
        if (B.Y(stradepassword)) {
            E.S("密码不能为空");
        }
        if (stradepassword.length() < 6) {
            E.S("密码长度不能少于6位");
        }
        User user = userDao.findOne(userid);
        if (user == null) {
            E.S("用户不存在!");
        }
        if (B.N(user.getStradepassword())) {
            E.S("交易密码已存在,请前往个人中心-->交易密码进行重置");
        }
        user.setStradepassword(ShiroUtils.EncodePassword(stradepassword));
        this.userDao.saveAndFlush(user);
        //Map<String, String> map = new HashMap<String, String>();
        //NoticeUtils.sendToUser("SetTradePassword", user.getId(), map);
        Map<String, Object> map = Maps.newHashMap();
        //ITaskSendMemberMsg.toUser(user.getId(), "SetTradePassword", "重置密码", map);
        NoticeUtils.sendToUser("SetTradePassword", user.getId(), map);
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findPassword(java.lang.String, java.lang.String)
     */
    @Override
    public void findPassword(String userName, String smobile) {
        if (B.Y(userName))
            E.S("登录名不能为空");
        if (B.Y(smobile))
            E.S("预留的手机不能为空");
        User user = this.userDao.findBySusername(userName);
        if (user == null)
            E.S("登录名不存在，请重新输入");
        if (B.Y(user.getSmobile()) || !user.getSmobile().trim().equalsIgnoreCase(smobile.trim())) {
            E.S("预留的手机号码不正确，请重新输入");
        }
        this.resetRegisterPass(user.getId());
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findTradePassword(java.lang.String)
     */
    @Override
    public void findTradePassword(String id) {
        User user = this.userDao.findOne(id);
        if (user == null)
            E.S("用户不存在");
        user.setStradepassword("");
        this.userDao.save(user);
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#isUniqueUser(java.lang.String)
     */
    @Override
    public boolean isUniqueUser(String susername) {
        if (B.Y(susername))
            return true;// 为空时,不验证
        if (userDao.countIgnoreCase(hy_user.susername, susername.trim()) > 0)
            return false;
        else
            return true;
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#BaseDelete(java.lang.String[])
     */
    @Override
    public void BaseDelete(String[] checkboxId) throws ServiceException {
        try {
            for (String id : checkboxId) {
                if (B.N(id)) {

                    User u = this.userDao.findOne(id);
                    if (u != null) {
                        u.setBisdelete(1);
                        userDao.save(u);
                    }
                }
            }
        } catch (Exception ex) {

            ex.printStackTrace();
            throw new ServiceException("删除失敗" + ex.getMessage());
        }
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#newPassword(java.lang.String, java.lang.String)
     */
    @Override
    public void newPassword(String newpassword, String userid) {
        if (B.Y(newpassword))
            E.S("密码不能为空");
        if (newpassword.length() < 6)
            E.S("密码长度不能少于6位");
        User user = userDao.findOne(userid);
        if (user == null)
            E.S("用户不存在!");
        user.setSpassword(ShiroUtils.EncodePassword(newpassword));
        this.userDao.saveAndFlush(user);
    }

    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findnewPassword(java.lang.String, java.lang.String)
     */
    @Override
    public User findnewPassword(String userName, String smobile) {
        if (B.Y(userName))
            E.S("登录名不能为空");
        if (B.Y(smobile))
            E.S("预留的手机不能为空");
        User user = this.userDao.findBySusername(userName);
        if (user == null)
            E.S("登录名不存在，请重新输入");
        if (B.Y(user.getSmobile()) || !user.getSmobile().trim().equalsIgnoreCase(smobile.trim())) {
            E.S("预留的手机号码不正确，请重新输入");
        }
        //this.resetRegisterPass(user.getId());
        return user;
    }


    /* (non-Javadoc)
     * @see com.frogsing.service.hy.IUserService#findBySusernameAndSmobile(java.lang.String, java.lang.String)
     */
    @Override
    public boolean findBySusernameAndSmobile(String susername, String smobile) {
        if (B.Y(susername))
            return false;//为空时不验证
        if (B.Y(smobile))
            return false;//为空时不验证
        else {
            User user = userDao.findBySusernameAndSmobile(susername, smobile);
            if (user != null)
                return true;
            else
                return false;
        }

    }

    /**
     * 获取本月客户数量
     */
    @Override
    public long getCurrMonthCount(String dbegindate, String denddate) {
//		String val = userDao.getFieldValue("select count(*) from hy_user t where trunc(t.dadddate) >= trunc(to_date(?,'YYYY-MM-DD')) and"
//				+ " trunc(t.dadddate) <= trunc(to_date(?,'YYYY-MM-DD')) order by t.dadddate desc",dbegindate,denddate)==null?"0":userDao.getFieldValue("select count(*) from hy_user t where trunc(t.dadddate) >= trunc(to_date(?,'YYYY-MM-DD')) and"
//						+ " trunc(t.dadddate) <= trunc(to_date(?,'YYYY-MM-DD')) order by t.dadddate desc",dbegindate,denddate).toString();
//		return Long.parseLong(val);
        return 0L;
    }

    @Override
    public User findBySusernameOrSmobile(String susername, String smobile) {

        User rs = userDao.findBySusernameOrSmobile(susername, smobile);
        if (rs == null)
            return null;
        //rs.getMember().getBisbond();
        return rs;
    }

    @Override
    public User findBySusername(String susername) {
        User rs = userDao.findBySusernameAndBisvalid(susername,BoolType.YES.val());
        if (rs == null)
            return null;
        return rs;
    }

    @Override
    public Collection<String> getAllPurview(int membertype, int iauthtype, String smemberid) {
        return userDao.getAllPurview(membertype, iauthtype, smemberid);
    }

    @Override
    public void updateLoginTime(String userid, Date currentDateTime) {
        userDao.updateLoginTime(userid, DateUtils.getCurrentDateTime());

    }

    /**
     * 登录失败处理,
     *
     * @param currentDateTime
     */
    @Override
    public void doLoginFail(String username, Date currentDateTime) {

        userDao.updateErrorCount(username, currentDateTime);

    }

    @Override
    public Collection<String> getAllPurview(String userid) {
        return userDao.getAllPurview(userid);
    }

    @Override
    public Collection<String> getAllSpecialPurview(int membertype, String smemberid) {
        return this.userDao.getAllSpecialPurview(membertype, smemberid);


    }

    @Override
    public int sendSiteMsg(String title, String msg, User o) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public User fetchUser(String id) {
        return this.userDao.fetchOne(id);

    }

    @Override
    public User findOne(String id) {
        return userDao.findOne(id);
    }

    @Override
    public void saveUser(String id, User user) {

        User u = userDao.findOne(id);
        u.setSname(user.getSname());
        u.setSqq(user.getSqq());
        u.setSemail(user.getSemail());
        u.setSremark(user.getSremark());
        u.setSlikename(user.getSname());//联系人
        userDao.save(u);

    }

    @Override
    public User findOneBySmobile(String smobile) {
        if (B.Y(smobile))
            E.S("手机号不能为空");
        List<User> list = userDao.findByPropertyName(hy_user.smobile, smobile);
        if (B.N(list))
            return list.get(0);
        else
            return null;
    }

    /**
     * 设置和更新交易密码
     *
     * @param suerid
     * @param oldpwd
     * @param newpwd
     */
    @Override
    public void tradepassword(String suerid, String oldpwd, String newpwd) {
        if (B.Y(suerid))
            E.S("用户不存在");
        User u = userDao.findOne(suerid);
        if (u == null)
            E.S("用户不存在");
        if (B.Y(u.getStradepassword())) {
            this.firstTradePwd(suerid, newpwd);
        } else {
            this.updatePassword(oldpwd, newpwd, suerid, u.getSmemberid(), 1);
        }

    }

    /**
     * 获取管理员账户
     *
     * @param smemberid
     * @return
     */
    public User getBisadmin(String smemberid) {
        List<User> userList = this.userDao.findByPropertyName(MEMBERCol.hy_user.smemberid, smemberid);
        User user = new User();
        for (User obj : userList) {
            if (Consts.BoolType.YES.isEq(obj.getBisadmin())) {
                user = obj;
                break;
            }
        }
        if (user == null)
            E.S("会员不存在");
        return user;
    }


    @Override
    public List<User> findUserByRight(String right) {
        List<Actor> roles = this.actorService.findActorsByRight(right);
        final List<String> rolses = Lists.newArrayList();
        roles.forEach(actor -> {
            rolses.add(actor.getId());
        });


        return this.userDao.findAll(new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                ListJoin<User, Actor> join = root.join(root.getModel().getList("actorList", Actor.class), JoinType.LEFT);
                In<Object> inO = cb.in(join.get("id"));
                return inO.value(rolses);
            }
        });
    }

    @Override
    public List<User> findUserByRole(String role) {
        Actor actor = this.actorDao.findBySrolecode(role);
        if (actor == null)
            return Lists.newArrayList();
        return this.userDao.findAll(new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                ListJoin<User, Actor> join = root.join(root.getModel().getList("actorList", Actor.class), JoinType.LEFT);
                return cb.equal(join.get("id"), actor.getId());
            }
        });
    }

    @Override
    public void updateTerminal(String userid, int terminaltype, String clientid) {
        User user = this.userDao.lock(userid);
        user.setIlastterminaltype(terminaltype);
        user.setSlastterminalid(clientid);

        this.userDao.save(user);
    }

}
