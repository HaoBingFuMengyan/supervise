package com.frogsing.common.utils;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: WangJiangLin
 * @Date: Created in 9:14 PM 2018/11/19
 * @Description:
 */
public class EmailCodeUtils {

    public static final int itimer = 60;
    public static final String REG_EMAIL_LAST_SEND_TIME = "REG_EMAIL_LAST_SEND_TIME";
    public static final String REG_EMAIL_LAST_SEND_CODE = "REG_EMAIL_LAST_SEND_CODE";
    public static final String REG_EMAIL_LAST_SEND_MOBILE = "REG_EMAL_LAST_SEND_MOBILE";
    public final static String EMAIL_INTO_TYPE="EMAIL_INTO_TYPE";

    private static enum InfoType{
        SMS(0,"短信"),
        SITE(1,"站内信"),
        VOICE(2,"语音"),
        EMAIL(3,"邮件");
        public  static EmailCodeUtils.InfoType get(int i){
            switch(i)
            {
                case 0:
                    return EmailCodeUtils.InfoType.SMS;
                case 1:
                    return EmailCodeUtils.InfoType.SITE;
                case 2:
                    return EmailCodeUtils.InfoType.VOICE;
                case 3:
                    return EmailCodeUtils.InfoType.EMAIL;
            }
            return null;
        }


        private   int   nCode ;
        private   InfoType ( int   _nCode,String _nlabel) {
            this. nCode  = _nCode;
        }

        public int val(){
            return nCode;
        }

    }


    /**
     *
     * @param session
     * @param semail
     * @param scode
     * @param flag，业务类型
     * @throws ServiceException
     */
    public static void checkCode(HttpSession session, String semail, String scode, String flag)
            throws ServiceException {
        if (B.Y(semail))
            E.S("邮箱不能为空");
        if (B.Y(scode)) {
            E.S("验证码不能为空");
        }
        System.out.println(session.getAttribute(flag + "~" + REG_EMAIL_LAST_SEND_CODE)+",flag="+flag);
        if (!scode.equals(session.getAttribute(flag + "~" + REG_EMAIL_LAST_SEND_CODE))) {
            E.S("验证码错误!");
        }
        if (!semail.equals(session.getAttribute(flag + "~" + REG_EMAIL_LAST_SEND_MOBILE)))
            E.S("邮箱变更需要重发验证码!");
        session.removeAttribute(flag + "~" + REG_EMAIL_LAST_SEND_CODE);
        session.removeAttribute(flag + "~" + REG_EMAIL_LAST_SEND_MOBILE);
        session.removeAttribute(flag + "~" + REG_EMAIL_LAST_SEND_TIME);
    }



    /**
     * 发送验证码
     *
     * @param session
     * @param smobile
     * @param flag,业务类型
     * @return
     */
    public static int emailCodeHandle(HttpSession session, String smobile, String flag) {
        Long lasttime = (Long) session.getAttribute(flag + "~" + EmailCodeUtils.REG_EMAIL_LAST_SEND_TIME);

        if (lasttime == null) {
            lasttime = System.currentTimeMillis();
            session.setAttribute(flag + "~" + EmailCodeUtils.REG_EMAIL_LAST_SEND_TIME, lasttime);
            sendEmailCode(session, smobile, flag, InfoType.EMAIL.val());
            return 0;
        } else {
            Long nowtime = System.currentTimeMillis();
            if ((nowtime - lasttime) / 1000 > (EmailCodeUtils.itimer - 1)) {
                sendEmailCode(session, smobile, flag, EmailCodeUtils.InfoType.EMAIL.val());
                session.setAttribute(flag + "~" + EmailCodeUtils.REG_EMAIL_LAST_SEND_TIME, nowtime);
                return 0;
            } else
                return (int) (EmailCodeUtils.itimer - (nowtime - lasttime) / 1000);
        }
    }

    /**
     *
     * @param session
     * @param semail
     * @param flag,业务类型
     */
    private static void sendEmailCode(HttpSession session, String semail, String flag,int infotype) {
        String code = String.valueOf(System.currentTimeMillis());
        int len = code.length();
        code = code.substring(len - 5, len - 1);
        session.setAttribute(flag + "~" + EmailCodeUtils.REG_EMAIL_LAST_SEND_CODE, code);
        session.setAttribute(flag + "~" + EmailCodeUtils.REG_EMAIL_LAST_SEND_MOBILE, semail);
        Map<String, String> map = new HashMap<String, String>();
        map.put("code", code);
        if(-1 != infotype)
            map.put(EmailCodeUtils.EMAIL_INTO_TYPE, String.valueOf(infotype));
        System.out.println(session.getId() + "验证码:" + code+",flag="+flag);
        NoticeUtils.sendSmsWithNode(flag, semail, map);

    }
}
