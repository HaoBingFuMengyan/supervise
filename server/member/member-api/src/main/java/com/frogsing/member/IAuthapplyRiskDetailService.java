package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.AuthapplyRiskDetail;

/**
 * Created by haobingfu on 2019/9/22.
 */
public interface IAuthapplyRiskDetailService {

    //id 认证公司ID
    void save(String id, int irisktype, AuthapplyRiskDetail authapplyRiskDetail, ILoginUser user);
}
