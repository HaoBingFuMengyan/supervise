package com.frogsing.project.service;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.project.dao.ContractmsgDao;
import com.frogsing.project.po.Contractmsg;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @Author: WangJiangLin
 * @Date: Created in 17:02 2019-05-15
 * @Description:
 */
@Component
@Transactional
public class ContractmsgService {


    @Autowired
    private ContractmsgDao contractmsgDao;

    public Contractmsg save(Contractmsg obj, ILoginUser user) {

        Contractmsg contractmsg = null;
        try {
            if(StringUtils.isNotBlank(obj.getId())){
                contractmsg = contractmsgDao.findOne(obj.getId());
            }else{
                contractmsg = new Contractmsg();
                contractmsg.setDadddate(new Date());
                contractmsg.setSaddoperator(user.getLoginName());
            }

            contractmsg.setSpic(obj.getSpic());
            contractmsg.setSmaincontractname(obj.getSmaincontractname());
            contractmsg.setFmaincontractprice(obj.getFmaincontractprice());
            contractmsg.setSnextcontractname(obj.getSnextcontractname());
            contractmsg.setFnextcontractprice(obj.getFnextcontractprice());
            contractmsg.setSnextnextcontractname(obj.getSnextnextcontractname());
            contractmsg.setFnextnextcontractprice(obj.getFnextnextcontractprice());
            contractmsgDao.save(contractmsg);
        }catch (Exception e){
            E.S("系统出现异常！");
        }
        return contractmsg;
    }
}
