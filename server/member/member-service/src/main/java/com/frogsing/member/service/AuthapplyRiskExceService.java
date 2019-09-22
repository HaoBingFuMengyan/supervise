package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyRiskExceService;
import com.frogsing.member.dao.AuthapplyRiskDetailDao;
import com.frogsing.member.dao.AuthapplyRiskExceDao;
import com.frogsing.member.po.AuthapplyRiskDetail;
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

    @Autowired
    private AuthapplyRiskDetailDao authapplyRiskDetailDao;


    @Override
    public void save(String id, int iexceptiontype, AuthapplyRiskExce authapplyRiskExce, ILoginUser user) {
        AuthapplyRiskDetail authapplyRiskDetail = queryService.findOne(AuthapplyRiskDetail.class,id);

        if (authapplyRiskDetail == null)
            E.S("系统异常，请联系管理员");

        AuthapplyRiskExce riskExce = new AuthapplyRiskExce();

        riskExce.setId(null);
        riskExce.setSriskdetailid(id);
        riskExce.setScontent(authapplyRiskExce.getScontent());

        MEMBER.ExceptionType exceptionType = MEMBER.ExceptionType.get(iexceptiontype);
        switch (exceptionType){
            //司法异常
            case SFYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.SFYC.val());

                authapplyRiskDetail.setSsfexce(String.valueOf(Integer.valueOf(authapplyRiskDetail.getSsfexce() + 1)));
                break;
            //行政处罚
            case XZCF:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.XZCF.val());

                authapplyRiskDetail.setSxzcfexce(String.valueOf(Integer.valueOf(authapplyRiskDetail.getSxzcfexce() + 1)));
                break;
            //经营情况
            case JYQK:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.JYQK.val());

                authapplyRiskDetail.setSjjinvice(String.valueOf(Integer.valueOf(authapplyRiskDetail.getSjjinvice() + 1)));
                break;
            //涉诉情况
            case SSQK:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.SSQK.val());

                authapplyRiskDetail.setSshensuexce(String.valueOf(Integer.valueOf(authapplyRiskDetail.getSshensuexce() + 1)));
                break;
            //披露异常
            case PLYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.PLYC.val());

                authapplyRiskDetail.setSplexce(String.valueOf(Integer.valueOf(authapplyRiskDetail.getSplexce() + 1)));
                break;
            //清算异常
            case QSYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.QSYC.val());

                authapplyRiskDetail.setSqsexce(String.valueOf(Integer.valueOf(authapplyRiskDetail.getSqsexce() + 1)));
                break;
            //可疑交易
            case KYJY:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.KYJY.val());

                authapplyRiskDetail.setSkyjiaoyi(String.valueOf(Integer.valueOf(authapplyRiskDetail.getSkyjiaoyi() + 1)));
                break;
            default:
                E.S("未知类型");
                break;
        }

        this.authapplyRiskExceDao.save(riskExce);
        this.authapplyRiskDetailDao.save(authapplyRiskDetail);
    }
}
