package com.frogsing.log.service;

import java.util.Date;

import com.frogsing.heart.utils.T;
import com.frogsing.log.IBillCheckService;
import com.frogsing.log.dao.BillCheckDao;
import com.frogsing.log.po.BillCheck;
import com.frogsing.log.utils.LOG.CheckStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
/**
 * Description:
 * <p>
 * Created by wesson on 2018/8/7.
 **/
@Component
@Transactional
public class BillCheckService implements IBillCheckService {
    @Autowired
    private BillCheckDao billCheckDao;

    @Override
    public void adminok(String billid, String billno, String operid, String opname, String checkinfo){
        BillCheck obj=this.billCheck(billid,billno,operid,opname,"", CheckStatus.Pass.val(),checkinfo);
        this.billCheckDao.save(obj);
    }

    @Override
    public void adminfail(String billid, String billno, String operid, String opname, String checkinfo){
        BillCheck obj=this.billCheck(billid,billno,operid,opname,"", CheckStatus.Reject.val(),checkinfo);
        this.billCheckDao.save(obj);
    }

    @Override
    public void memberok(String billid, String billno, String operid, String opname, String membername, String checkinfo){
        BillCheck obj=this.billCheck(billid,billno,operid,opname,membername, CheckStatus.Pass.val(),checkinfo);
        this.billCheckDao.save(obj);
    }

    @Override
    public void memberfail(String billid, String billno, String operid, String opname, String membername, String checkinfo){
        BillCheck obj=this.billCheck(billid,billno,operid,opname,membername, CheckStatus.Reject.val(),checkinfo);
        this.billCheckDao.save(obj);
    }

    public BillCheck billCheck(String billid,String billno,String operid,String opname,String opmember,int checkstatus,String checkinfo){
        BillCheck obj=new BillCheck();
        obj.setSbillid(billid);
        obj.setSbillno(billno);
        obj.setSoperatorid(operid);
        obj.setSoperator(opname);
        obj.setSoperatormember(opmember);
        obj.setIstatus(checkstatus);
        obj.setSremark(checkinfo);
        obj.setDaddtime(T.now());
        obj.setId(null);

        return obj;
    }

    public List<BillCheck> findAdminCheck(String billid) {

        return this.billCheckDao.findByBillid(billid);
    }

}
