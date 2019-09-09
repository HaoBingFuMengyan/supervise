package com.frogsing.operator;

import com.frogsing.operator.po.Operator;

public interface IOperatorService {

//根据用户名密码查询管理员表
 Operator operatorLogin(String username, String olderPassword);
//修改密码
 void updatePassword(Operator operator ,String snewpassword);

    void updateTerminal(String id, int terminal, String clientid);

    void updatePassword(String soldpassword, String snewpassword, String id);
}