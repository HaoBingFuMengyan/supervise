package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.AuthapplyRiskExce;

/**
 * Created by haobingfu on 2019/9/22.
 */
public interface IAuthapplyRiskExceService {

    //id 风险ID
    void save(String id, int iexceptiontype, AuthapplyRiskExce authapplyRiskExce, ILoginUser user);

    /**
     * 删除
     * @param id
     * @param user
     */
    void delete(String id,ILoginUser user);
}
