package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyRiskDetailService;
import com.frogsing.member.dao.AuthapplyRiskDetailDao;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.AuthapplyRiskDetail;
import com.frogsing.member.utils.MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * Created by haobingfu on 2019/9/22.
 */
@Component
@Transactional
public class AuthapplyRiskDetailService implements IAuthapplyRiskDetailService {

    @Autowired
    private AuthapplyRiskDetailDao authapplyRiskDetailDao;

    @Autowired
    private IQueryService queryService;

    @Override
    public void save(String id, int irisktype, AuthapplyRiskDetail authapplyRiskDetail, ILoginUser user) {
        Authapply authapply = queryService.findOne(Authapply.class,id);
        if (authapply == null)
            E.S("该企业存在异常，不能添加");

        AuthapplyRiskDetail riskDetail = new AuthapplyRiskDetail();
        riskDetail.setId(null);
        riskDetail.setSmemberid(authapply.getSmemberid());
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
                riskDetail.setSinvest(authapplyRiskDetail.getSinvest());
                riskDetail.setIrisktype(MEMBER.RiskType.WBAHHQY.val());
                break;
            //管理人合规性
            case GLRHGX:
                break;
            //基金运作情况
            case JJYZQK:
                break;
            default:
                E.S("未知类型");
                break;
        }

        this.authapplyRiskDetailDao.save(riskDetail);

    }
}
