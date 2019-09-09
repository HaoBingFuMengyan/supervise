package com.frogsing.member;


import com.frogsing.member.po.MemberAddress;
import com.frogsing.member.vo.LoginUser;

public interface IMemberAddressService {


    /**
     * 添加收货地址信息
     * @param memberAddress
     * @param user
     * @return
     */
    String addMemberAddressInfo(MemberAddress memberAddress, LoginUser user);

    /**
     * 设置提货信息为默认
     * @param id
     * @param smemberid
     */
    void defaultMemberAddress(String id,String smemberid);

    /**
     * 删除提货信息
     * @param id
     * @param smemberid
     */
    void removeMemberAddress(String id,String smemberid);

}
