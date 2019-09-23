package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyWarnService;
import com.frogsing.member.dao.AuthapplyWarnDao;
import com.frogsing.member.po.AuthapplyWarn;
import com.frogsing.member.utils.MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by haobingfu on 2019/9/23.
 */
@Component
@Transactional
public class AuthapplyWarnService implements IAuthapplyWarnService {

    @Autowired
    private IQueryService queryService;

    @Autowired
    private AuthapplyWarnDao authapplyWarnDao;


    @Override
    public void save(AuthapplyWarn authapplyWarn, ILoginUser user) {
        AuthapplyWarn warn = new AuthapplyWarn();

        warn.setId(null);
        warn.setIbiztype(authapplyWarn.getIbiztype());
        warn.setScnname(authapplyWarn.getScnname());
        warn.setSsocialcreditno(authapplyWarn.getSsocialcreditno());
        warn.setSname(authapplyWarn.getSname());
        warn.setIcardtype(authapplyWarn.getIcardtype());
        warn.setScardno(authapplyWarn.getScardno());
        warn.setIkrzcardtype(authapplyWarn.getIkrzcardtype());
        warn.setSkzrname(authapplyWarn.getSkzrname());
        warn.setSkzrcardno(authapplyWarn.getSkzrcardno());

        warn.setIstatus(MEMBER.CheckStatus.WAIT.val());
        warn.setDadddate(new Date());
        warn.setSadduser(user.getId());


        this.authapplyWarnDao.save(warn);

    }
}
