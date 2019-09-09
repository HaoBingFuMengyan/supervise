package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.PayAccount;

public interface IPayAccountService {
    void save(PayAccount payaccount, ILoginUser u);
    void edit(PayAccount payaccount, ILoginUser u);
}
