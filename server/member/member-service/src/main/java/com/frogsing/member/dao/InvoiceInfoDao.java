package com.frogsing.member.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.InvoiceInfo;


//frogsingcode//

public interface InvoiceInfoDao extends BaseDao<InvoiceInfo, String>{
//frogsingcode//
    InvoiceInfo findBySmemberidAndItype(String id,int itype);



//frogsingcode//
}

