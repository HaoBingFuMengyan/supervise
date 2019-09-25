package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.AuthapplyRiskDetail;
import com.frogsing.member.po.AuthapplyWarn;
import com.frogsing.member.vo.AuthVo;

/**
 * Created by haobingfu on 2019/9/23.
 */
public interface IAuthapplyWarnService {


    void save(AuthapplyWarn authapplyWarn, ILoginUser user);

    //authapplywarnID
    void save(String id, int irisktype, AuthapplyRiskDetail authapplyRiskDetail, ILoginUser user);


    void check(String id,int istatus,ILoginUser user);

    /**
     * 评分
     * @param authVo
     * @param user
     */
    void score(AuthVo authVo, ILoginUser user);
}
