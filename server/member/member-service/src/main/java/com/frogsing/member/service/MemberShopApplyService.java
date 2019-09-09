package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.utils.B;
import com.frogsing.member.IMemberShopApplyService;
import com.frogsing.member.dao.MemberDao;
import com.frogsing.member.dao.MemberShopApplyDao;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.MemberShopApply;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.member.vo.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Component
@Transactional
public class MemberShopApplyService implements IMemberShopApplyService {

    @Autowired
    private MemberShopApplyDao memberShopApplyDao;

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private IQueryService queryService;

    /**
     * 会员开通店铺
     *
     * @param memberShopApply
     * @param user
     */
    @Override
    public void memberShopApplyOpen(MemberShopApply memberShopApply, LoginUser user) {
        if (B.Y(memberShopApply.getSlinkname().trim()))
            E.S("联系人不能为空");
        if (B.Y(memberShopApply.getSlinkmobile().trim()))
            E.S("联系电话不能为空");

        Member member = memberDao.findOne(user.getMemberId());
        if (member == null)
            E.S("会员不存在");
        if (MEMBER.AuthenticateType.Company.isNot(member.getIauthtype()))
            E.S("抱歉，请先通过企业认证");

        MemberShopApply obj = null;
        if (B.Y(memberShopApply.getId())) {//新增申请
            obj = setMemberShopApply(obj,member);
        } else {//修改
            obj = memberShopApplyDao.findByIdAndIstatus(memberShopApply.getId(), MEMBER.ShopStatus.Apply.val());
            if (obj == null)
                obj = setMemberShopApply(obj,member);
        }

        obj.setSlinkname(memberShopApply.getSlinkname().trim());
        obj.setSlinkmobile(memberShopApply.getSlinkmobile().trim());
        obj.setSdesc(memberShopApply.getSdesc());
        obj.setSbusiness(memberShopApply.getSbusiness());
        obj.setSlogo(memberShopApply.getSlogo());
        obj.setDapplydate(new Date());

        this.memberShopApplyDao.save(obj);
    }

    private MemberShopApply setMemberShopApply(MemberShopApply obj,Member member){
        obj = new MemberShopApply();

        obj.setId(null);
        obj.setSmemberid(member.getId());
        obj.setSshopname(member.getScnname());
        obj.setSbannerurl(null);
        obj.setSqq(null);
        obj.setSwx(null);
        obj.setSdomain(null);
        obj.setScheckmark(null);
        obj.setIstatus(MEMBER.ShopStatus.Apply.val());
        obj.setSregion(member.getSprovince() + member.getScity() + member.getSregion());

        return obj;
    }

    @Override
    public MemberShopApply findBySmemberidAndIstatusOrIstatusOrderByDapplydateDesc(String smemberid, Integer istatus,Integer status) {
        List<MemberShopApply> list = this.memberShopApplyDao.findBySmemberidAndIstatusOrIstatusOrderByDapplydateDesc(smemberid, istatus,status);
        MemberShopApply memberShopApply = null;
        if (list.size() > 0)
            memberShopApply = list.get(0);
        else
            memberShopApply = new MemberShopApply();
        return memberShopApply;
    }

    @Override
    public void memberShopApply(Member member,int type, String slogo, String sbannerurl, String scompanydesc, String ssuccessexam) {
        XSpec<MemberShopApply> xSpec = MEMBERCol.hy_membershopapply.xspec().and(SearchFilter.eq(MEMBERCol.hy_membershopapply.smemberid,member.getId()),
                SearchFilter.eq(MEMBERCol.hy_membershopapply.istatus,MEMBER.ShopStatus.Apply.val()));

        MemberShopApply memberShopApply = queryService.fetchOne(xSpec);
        if (memberShopApply == null)
            E.S("请先申请开通店铺");

        if (type == 0)
            memberShopApply.setSlogo(slogo);
        else if (type == 1)
            memberShopApply.setSbannerurl(sbannerurl);
        else if (type == 2)
            memberShopApply.setScompanydesc(scompanydesc);
        else
            memberShopApply.setSsuccessexam(ssuccessexam);

        this.memberShopApplyDao.save(memberShopApply);

    }

}
