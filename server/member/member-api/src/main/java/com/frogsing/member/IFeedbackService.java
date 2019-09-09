package com.frogsing.member;


import com.frogsing.member.vo.LoginUser;

public interface IFeedbackService {

    void addFeedBack(String smobile, String sinfo, LoginUser user);
}
