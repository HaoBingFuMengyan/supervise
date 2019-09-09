package com.frogsing.project.fetch;

import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.project.po.Contractmsg;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author: WangJiangLin
 * @Date: Created in 16:26 2019-05-15
 * @Description:
 */
@Component
public class FetchContractmsg extends BaseFetch<Contractmsg> {

    @Override
    public void beforeSave(Contractmsg vo, Contractmsg po, ILoginUser u) {
        if(B.Y(vo.getId()))
            vo.setDadddate(new Date());
            vo.setSaddoperator(u.getLoginName());
    }
}
