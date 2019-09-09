package com.frogsing.member.service;


import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.utils.T;
import com.frogsing.member.IMemberAddressService;
import com.frogsing.member.dao.MemberAddressDao;
import com.frogsing.member.po.MemberAddress;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.member.vo.LoginUser;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.regex.Pattern;

@Component
@Transactional
public class MemberAddressService implements IMemberAddressService {

    @Autowired
    private MemberAddressDao memberAddressDao;


    /**
     * 添加收货地址信息
     *
     * @param memberAddress
     * @param user
     * @return
     */
    @Override
    public String addMemberAddressInfo(MemberAddress memberAddress, LoginUser user) {
        if (B.Y(memberAddress.getSlinkname()))
            E.S("收货人不能为空");
        if (B.Y(memberAddress.getSlinkmobile()))
            E.S("手机号不能为空");
        Pattern pattern = Pattern.compile("^(13[0-9]|15[0-9]|14[7]|17[0-9]|18[0-9])[0-9]{8}$");
        boolean flag = pattern.matcher(memberAddress.getSlinkmobile()).matches();
        if(!flag)
            E.S("请输入正确的手机号");
        if (B.Y(memberAddress.getSprovince()))
            if (memberAddress.getSprovince().equals("请选择省份"))
                E.S("省份不能为空");
        if (B.Y(memberAddress.getSaddress()))
            E.S("详细地址不能为空");
        if(B.Y(memberAddress.getScardup()))
            E.S("身份证正面照不能为空");
        if (B.Y(memberAddress.getScarddown()))
            E.S("身份证反面照不能为空");
        if(B.Y(memberAddress.getId())){
            memberAddress.setId(null);
        }

        memberAddress.setDadddate(T.now());
        memberAddress.setSaddoperator(user.getLoginName());
        memberAddress.setBisdefault(Consts.BoolType.NO.val());
        memberAddress.setSmemberid(user.getMemberId());
        this.memberAddressDao.save(memberAddress);

        return memberAddress.getId();
    }

    /**
     * 设置提货信息为默认
     *
     * @param id
     * @param smemberid
     */
    @Override
    public void defaultMemberAddress(String id, String smemberid) {
        if(B.Y(id))
            E.S("请选择要设为默认值的信息");
        MemberAddress obj = this.memberAddressDao.findOne(id);
        if(!obj.getSmemberid().equals(smemberid))
            E.S("非该会员用户，禁止操作");
        obj.setBisdefault(Consts.BoolType.YES.val());
        this.memberAddressDao.save(obj);

        List<MemberAddress> list = this.memberAddressDao.findAll(new Specification<MemberAddress>() {
            @Override
            public Predicate toPredicate(Root<MemberAddress> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder cb) {
                List<Predicate> predicateList = Lists.newArrayList();

                predicateList.add(cb.equal(MEMBERCol.hy_memberaddress.smemberid(root),smemberid));
                predicateList.add(cb.not(root.get("id").in(id)));

                return S.andList(cb,predicateList);
            }
        });

        for (MemberAddress memberAddress : list){
            memberAddress.setBisdefault(Consts.BoolType.NO.val());
            this.memberAddressDao.save(memberAddress);
        }

    }

    /**
     * 删除提货信息
     *
     * @param id
     * @param smemberid
     */
    @Override
    public void removeMemberAddress(String id, String smemberid) {
        if(B.Y(id))
            E.S("请选择要设为默认值的信息");
        MemberAddress obj = this.memberAddressDao.findOne(id);
        if(!obj.getSmemberid().equals(smemberid))
            E.S("非该会员用户，禁止操作");
        this.memberAddressDao.delete(obj);
    }
}
