package com.frogsing.member;

import com.frogsing.member.po.Member;
import com.frogsing.member.po.MemberShopApply;
import com.frogsing.member.vo.LoginUser;

import java.util.List;

public interface IMemberShopApplyService {

    /**
     * 会员开通店铺
     * @param memberShopApply
     * @param user
     */
    void memberShopApplyOpen(MemberShopApply memberShopApply, LoginUser user);

    MemberShopApply findBySmemberidAndIstatusOrIstatusOrderByDapplydateDesc(String smemberid,Integer istatus,Integer status);

    void memberShopApply(Member member,int type, String slogo, String sbannerurl, String scompanydesc, String ssuccessexam);
}
