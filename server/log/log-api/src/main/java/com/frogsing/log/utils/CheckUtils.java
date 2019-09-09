package com.frogsing.log.utils;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.log.IBillCheckService;

public class CheckUtils {
    private static Object o=new Object();
    private   static IBillCheckService s;
    private static IBillCheckService getS(){

        if(s==null){
            synchronized (o) {
                if(s==null)
                    s= SpringContextHolder.getBean(IBillCheckService.class);
                if(s==null)
                    E.S("IBillCheckService 的实现类找不到!");

            }

        }
        return s;

    }



    public static  void adminok(String billid, String billno, String checkinfo , ILoginUser u) {

        getS().adminok(billid,billno,u.getId(), B.Y(u.getName())?u.getLoginName():u.getName(),checkinfo);
    }

    public static void adminfail(String billid, String billno, String checkinfo , ILoginUser u) {
        getS().adminfail(billid,billno,u.getId(),  B.Y(u.getName())?u.getLoginName():u.getName(),checkinfo);

    }


    public static void memberok(String billid, String billno, String checkinfo , ILoginUser u) {
        getS().memberok(billid,billno,u.getId(), B.Y(u.getName())?u.getLoginName():u.getName(),u.getMemberName(),checkinfo);
    }


    public static void memberfail(String billid, String billno, String checkinfo , ILoginUser u) {
        getS().memberfail(billid,billno,u.getId(), B.Y(u.getName())?u.getLoginName():u.getName(),u.getMemberName(),checkinfo);
    }


}
