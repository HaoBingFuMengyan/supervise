package com.frogsing.log.service;/**
 * Created by wesson on 2017/10/13.
 */

import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.log.IOperatorLogService;
import com.frogsing.log.dao.OperateLogDao;
import com.frogsing.log.po.OperateLog;
import com.frogsing.log.utils.LOG;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Description:
 * <p>
 * Created by wesson on 2017/10/13.
 **/
@Component
@Transactional
public class OperatorLogService implements IOperatorLogService {

    @Autowired
    private OperateLogDao operateLogDao;

    @Override
    public void syslog(String billId, ILoginUser u, String remark) {
        this.buildEntity(LOG.OperatorLogLevel.System.val(),billId,u,remark);
    }

    @Override
    public void bizlog(String billId,ILoginUser u, String remark) {
        this.buildEntity(LOG.OperatorLogLevel.Bussiness.val(),billId, u,remark);
    }

    private OperateLog buildEntity(int level, String billId, ILoginUser u, String remark){
        OperateLog log = new OperateLog();
        log.setId(null);
        log.setDadddate(T.now());
        log.setIlevel(level);
        log.setSaddoperator(B.Y(u.getName())?u.getLoginName():u.getName());
        log.setSoperatekey(billId);
        log.setSoperateremark(remark);
        this.operateLogDao.save(log);
        return log;
    }
}
