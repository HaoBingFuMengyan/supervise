package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IAuthapplyRiskExceService;
import com.frogsing.member.dao.AuthapplyDao;
import com.frogsing.member.dao.AuthapplyRiskDetailDao;
import com.frogsing.member.dao.AuthapplyRiskExceDao;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.AuthapplyRiskDetail;
import com.frogsing.member.po.AuthapplyRiskExce;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBERCol;
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

    @Autowired
    private AuthapplyDao authapplyDao;


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

                authapplyRiskDetail.setSsfexce(String.valueOf(authapplyRiskDetail.getSsfexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSsfexce()) + 1));
                break;
            //行政处罚
            case XZCF:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.XZCF.val());

                authapplyRiskDetail.setSxzcfexce(String.valueOf(authapplyRiskDetail.getSxzcfexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSxzcfexce()) + 1));
                break;
            //经营情况
            case JYQK:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.JYQK.val());

                authapplyRiskDetail.setSjjinvice(String.valueOf(authapplyRiskDetail.getSjjinvice() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSjjinvice()) + 1));
                break;
            //涉诉情况
            case SSQK:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.SSQK.val());

                authapplyRiskDetail.setSshensuexce(String.valueOf(authapplyRiskDetail.getSshensuexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSshensuexce()) + 1));
                break;
            //披露异常
            case PLYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.PLYC.val());

                authapplyRiskDetail.setSplexce(String.valueOf(authapplyRiskDetail.getSplexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSplexce()) + 1));
                break;
            //清算异常
            case QSYC:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.QSYC.val());

                authapplyRiskDetail.setSqsexce(String.valueOf(authapplyRiskDetail.getSqsexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSqsexce()) + 1));
                break;
            //可疑交易
            case KYJY:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.KYJY.val());

                authapplyRiskDetail.setSkyjiaoyi(String.valueOf(authapplyRiskDetail.getSkyjiaoyi() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSkyjiaoyi()) + 1));
                break;
            //对外投资情况
            case DWTZQk:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.DWTZQk.val());

                authapplyRiskDetail.setSinvest(String.valueOf(authapplyRiskDetail.getSinvest() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSinvest()) + 1));
                break;
            //中基协处罚情况
            case ZJXCFQK:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.ZJXCFQK.val());

                authapplyRiskDetail.setSzjxcfexce(String.valueOf(authapplyRiskDetail.getSzjxcfexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSzjxcfexce()) + 1));
                break;
            //风险预警
            case FXYJ:
                riskExce.setIexceptiontype(MEMBER.ExceptionType.FXYJ.val());

                authapplyRiskDetail.setIwarnnum(authapplyRiskDetail.getIwarnnum() +1);

                Authapply authapply = queryService.findOne(Authapply.class,authapplyRiskDetail.getSauthapplyid());

                if (authapply != null) {
                    authapply.setFwarnnum(authapplyRiskDetail.getIwarnnum().doubleValue() + 1);

                    authapplyDao.saveAndFlush(authapply);
                }
                break;
            default:
                E.S("未知类型");
                break;
        }

        this.authapplyRiskExceDao.save(riskExce);
        this.authapplyRiskDetailDao.save(authapplyRiskDetail);
    }

    /**
     * 删除
     *
     * @param id
     * @param user
     */
    @Override
    public void delete(String id, ILoginUser user) {
        AuthapplyRiskExce authapplyRiskExce = authapplyRiskExceDao.findOne(id);

        if (authapplyRiskExce == null)
            E.S("该风险异常不存在，不能删除");

        AuthapplyRiskDetail authapplyRiskDetail = queryService.findOne(AuthapplyRiskDetail.class,authapplyRiskExce.getSriskdetailid());

        if (authapplyRiskDetail == null)
            E.S("系统异常，请联系管理员");

        MEMBER.ExceptionType exceptionType = MEMBER.ExceptionType.get(authapplyRiskExce.getIexceptiontype());
        switch (exceptionType){
            //司法异常
            case SFYC:
                authapplyRiskDetail.setSsfexce(String.valueOf(authapplyRiskDetail.getSsfexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSsfexce()) - 1));
                break;
            //行政处罚
            case XZCF:
                authapplyRiskDetail.setSxzcfexce(String.valueOf(authapplyRiskDetail.getSxzcfexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSxzcfexce()) - 1));
                break;
            //经营情况
            case JYQK:
                authapplyRiskDetail.setSjjinvice(String.valueOf(authapplyRiskDetail.getSjjinvice() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSjjinvice()) - 1));
                break;
            //涉诉情况
            case SSQK:
                authapplyRiskDetail.setSshensuexce(String.valueOf(authapplyRiskDetail.getSshensuexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSshensuexce()) - 1));
                break;
            //披露异常
            case PLYC:
                authapplyRiskDetail.setSplexce(String.valueOf(authapplyRiskDetail.getSplexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSplexce()) - 1));
                break;
            //清算异常
            case QSYC:
                authapplyRiskDetail.setSqsexce(String.valueOf(authapplyRiskDetail.getSqsexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSqsexce()) - 1));
                break;
            //可疑交易
            case KYJY:
                authapplyRiskDetail.setSkyjiaoyi(String.valueOf(authapplyRiskDetail.getSkyjiaoyi() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSkyjiaoyi()) - 1));
                break;
            //对外投资情况
            case DWTZQk:
                authapplyRiskDetail.setSinvest(String.valueOf(authapplyRiskDetail.getSinvest() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSinvest()) - 1));
                break;
            //中基协处罚情况
            case ZJXCFQK:
                authapplyRiskDetail.setSzjxcfexce(String.valueOf(authapplyRiskDetail.getSzjxcfexce() == null ? 0 : Integer.valueOf(authapplyRiskDetail.getSzjxcfexce()) - 1));
                break;
            //风险预警
            case FXYJ:
                authapplyRiskDetail.setIwarnnum(authapplyRiskDetail.getIwarnnum() -1);

                Authapply authapply = queryService.findOne(Authapply.class,authapplyRiskDetail.getSauthapplyid());

                if (authapply == null)
                    E.S("该企业不存在");

                authapply.setFwarnnum(authapplyRiskDetail.getIwarnnum().doubleValue() -1);

                authapplyDao.saveAndFlush(authapply);
                break;
            default:
                E.S("未知类型");
                break;
        }

        this.authapplyRiskExceDao.delete(authapplyRiskExce);
        this.authapplyRiskDetailDao.save(authapplyRiskDetail);

    }
}
