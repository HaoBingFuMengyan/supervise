package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyWarnService;
import com.frogsing.member.dao.AuthapplyRiskDetailDao;
import com.frogsing.member.dao.AuthapplyWarnDao;
import com.frogsing.member.po.AuthapplyRiskDetail;
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

    @Autowired
    private AuthapplyRiskDetailDao authapplyRiskDetailDao;


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

    @Override
    public void save(String id, int irisktype, AuthapplyRiskDetail authapplyRiskDetail, ILoginUser user) {
        AuthapplyWarn authapply = queryService.findOne(AuthapplyWarn.class,id);
        if (authapply == null)
            E.S("该企业存在异常，不能添加");

        AuthapplyRiskDetail riskDetail = new AuthapplyRiskDetail();
        riskDetail.setId(null);
        riskDetail.setSmemberid("");
        riskDetail.setSauthapplyid(authapply.getId());
        riskDetail.setDdate(new Date());
        riskDetail.setSadduserid(user.getId());
        riskDetail.setSaddusername(user.getLoginName());

        MEMBER.RiskType riskType = MEMBER.RiskType.get(irisktype);
        switch (riskType){
            //机构自身
            case JGSELF:
                riskDetail.setScnname(authapplyRiskDetail.getScnname());
                riskDetail.setSmanager(authapplyRiskDetail.getSmanager());
                riskDetail.setIrisktype(MEMBER.RiskType.JGSELF.val());
                break;
            //核心人员
            case HXRY:
                riskDetail.setSname(authapplyRiskDetail.getSname());
                riskDetail.setScard(authapplyRiskDetail.getScard());
                riskDetail.setScardno(authapplyRiskDetail.getScardno());
                riskDetail.setIrisktype(MEMBER.RiskType.HXRY.val());
                break;
            //关联企业
            case GLQY:
                riskDetail.setScnname(authapplyRiskDetail.getScnname());
                riskDetail.setScard(authapplyRiskDetail.getScard());
                riskDetail.setIrisktype(MEMBER.RiskType.GLQY.val());
                break;
            //在管企业
            case ZGQY:
                riskDetail.setStrustname(authapplyRiskDetail.getStrustname());
                riskDetail.setScnname(authapplyRiskDetail.getScnname());
                riskDetail.setStype(authapplyRiskDetail.getStype());
                riskDetail.setIrisktype(MEMBER.RiskType.ZGQY.val());
                break;
            //未备案的合伙企业
            case WBAHHQY:
                riskDetail.setScnname(authapplyRiskDetail.getScnname());
                riskDetail.setDsetdate(authapplyRiskDetail.getDsetdate());
                riskDetail.setFnum(authapplyRiskDetail.getFnum());
                riskDetail.setFnaturalnum(authapplyRiskDetail.getFnaturalnum());
                riskDetail.setIrisktype(MEMBER.RiskType.WBAHHQY.val());
                break;
            //管理人合规性
            case GLRHGX:
                riskDetail.setScnname(authapplyRiskDetail.getScnname());
                riskDetail.setIrisktype(MEMBER.RiskType.GLRHGX.val());
                break;
            //基金运作情况
            case JJYZQK:
                riskDetail.setSname(authapplyRiskDetail.getSname());
                riskDetail.setDsetdate(authapplyRiskDetail.getDsetdate());//备案日期
                riskDetail.setStrustname(authapplyRiskDetail.getStrustname());
                riskDetail.setIrisktype(MEMBER.RiskType.JJYZQK.val());
                break;
            default:
                E.S("未知类型");
                break;
        }

        this.authapplyRiskDetailDao.save(riskDetail);
    }

    @Override
    public void check(String id, int istatus, ILoginUser user) {
        AuthapplyWarn authapplyWarn = authapplyWarnDao.findOne(id);
        if (authapplyWarn == null)
            E.S("该企业存在异常，请勿操作");

        if (MEMBER.CheckStatus.WAIT.isNot(authapplyWarn.getIstatus()))
            E.S("请勿重复操作");

        authapplyWarn.setIstatus(istatus);
        authapplyWarn.setScheckuser(user.getId());
        authapplyWarn.setDcheckdate(new Date());
        authapplyWarn.setScheckinfo("");

        this.authapplyWarnDao.save(authapplyWarn);

    }
}
