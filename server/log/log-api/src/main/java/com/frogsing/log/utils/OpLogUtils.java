package com.frogsing.log.utils;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.log.IOperatorLogService;

public class OpLogUtils {
    private static Object o=new Object();
    private   static IOperatorLogService s;
    private static IOperatorLogService getS(){

        if(s==null){
            synchronized (o) {
                if(s==null)
                    s= SpringContextHolder.getBean(IOperatorLogService.class);
                if(s==null)
                    E.S("IOperatorLogService的实现类找不到!");

            }

        }
        return s;

    }
   public static void sys(String billId, ILoginUser u, String remark){

       getS().syslog(billId,u,remark);

   }


    /**
     * 单据跟踪日志
     * 业务操作级别的日志，如：单据审核、单据确认、合同评价、确认发货等相关的操作
     * @param billId   单据ID
     * @param u  操作人：请务必传入操作员的中文名称，如果没有中文名称请传入登录名
     * @param remark  备注：写清楚是干了些什么操作，如果有必要需要指定操作方   如：卖方确认了合同    买方确认了合同等
     */
    public static void biz(String billId, ILoginUser u, String remark){

        getS().bizlog(billId,u,remark);
    }


}
