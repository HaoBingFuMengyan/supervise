package com.frogsing.log;

/**
 * Created by wesson on 2017/10/13.
 */

import com.frogsing.heart.web.login.ILoginUser;

/**
 * Description:
 * <p>
 * Created by wesson on 2017/10/13.
 **/
public interface IOperatorLogService {

    /**
     * 单据跟踪日志
     * 系统操作级别的日志，如新增、修改、逻辑删除操作
     * @param billId   单据ID
     * @param u  操作人：请务必传入操作员的中文名称，如果没有中文名称请传入登录名
     * @param remark  备注：写清楚是干了些什么操作，如果有必要需要指定操作方
     */
    void syslog(String billId,ILoginUser u,String remark);


    /**
     * 单据跟踪日志
     * 业务操作级别的日志，如：单据审核、单据确认、合同评价、确认发货等相关的操作
     * @param billId   单据ID
     * @param u  操作人：请务必传入操作员的中文名称，如果没有中文名称请传入登录名
     * @param remark  备注：写清楚是干了些什么操作，如果有必要需要指定操作方   如：卖方确认了合同    买方确认了合同等
     */
    void bizlog(String billId, ILoginUser u, String remark);
}
