package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.AuthapplyWarn;

/**
 * Created by haobingfu on 2019/9/23.
 */
public interface IAuthapplyWarnService {


    void save(AuthapplyWarn authapplyWarn, ILoginUser user);
}
