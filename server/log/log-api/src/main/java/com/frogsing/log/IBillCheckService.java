package com.frogsing.log;

import com.frogsing.log.po.BillCheck;

import java.util.List;

/**
 * Description:
 * <p>
 * Created by wesson on 2018/8/7.
 **/
public interface IBillCheckService {
    /**
     * 管理后台审核通过
     * @param billid
     * @param billno
     * @param operid
     * @param opname
     * @param checkinfo
     */
    void adminok(String billid, String billno, String operid, String opname, String checkinfo);

    /**
     * 管理后台审核拒绝
     * @param billid
     * @param billno
     * @param operid
     * @param opname
     * @param checkinfo
     */
    void adminfail(String billid, String billno, String operid, String opname, String checkinfo);

    /**
     * 前台会员审核通过
     * @param billid
     * @param billno
     * @param operid
     * @param opname
     * @param membername
     * @param checkinfo
     */
    void memberok(String billid, String billno, String operid, String opname, String membername, String checkinfo);

    /**
     * 前台会员审核拒绝
     * @param billid
     * @param billno
     * @param operid
     * @param opname
     * @param membername
     * @param checkinfo
     */
    void memberfail(String billid, String billno, String operid, String opname, String membername, String checkinfo);

    /**
     * 查看审核内容
     * @param billid
     * @return
     */
    List<BillCheck> findAdminCheck(String billid);
}
