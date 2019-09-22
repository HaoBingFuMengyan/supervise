package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyRiskExceService;
import com.frogsing.member.dao.AuthapplyRiskExceDao;
import com.frogsing.member.po.AuthapplyRiskExce;
import com.frogsing.member.utils.MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by haobingfu on 2019/9/22.
 */
@Component
@Transactional
public class AuthapplyRiskExceService implements IAuthapplyRiskExceService {

    @Autowired
    private IQueryService queryService;

    @Autowired
    private AuthapplyRiskExceDao authapplyRiskExceDao;


    @Override
    public void save(String id, int iexceptiontype, AuthapplyRiskExce authapplyRiskExce, ILoginUser user) {

        AuthapplyRiskExce riskExce = new AuthapplyRiskExce();

        riskExce.setId(null);
        riskExce.setSriskdetailid(id);
        riskExce.setScontent(authapplyRiskExce.getScontent());

        MEMBER.ExceptionType exceptionType = MEMBER.ExceptionType.get(iexceptiontype);
        switch (exceptionType){
            //司法异常
            case SFYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.SFYC.val());
                break;
            //行政处罚
            case XZCF:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.XZCF.val());
                break;
            //经营情况
            case JYQK:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.JYQK.val());
                break;
            //涉诉情况
            case SSQK:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.SSQK.val());
                break;
            //披露异常
            case PLYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.PLYC.val());
                break;
            //清算异常
            case QSYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.QSYC.val());
                break;
            //可疑交易
            case KYJY:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.KYJY.val());
                break;
            default:
                E.S("未知类型");
                break;
        }

        this.authapplyRiskExceDao.save(riskExce);
    }
}
