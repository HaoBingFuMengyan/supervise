package com.frogsing.member.fetch;

import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.member.dao.InvoiceInfoDao;
import com.frogsing.member.dao.MemberDao;
import com.frogsing.member.po.InvoiceInfo;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.Right;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class FetchInvoiceInfo extends BaseFetch<InvoiceInfo>{

	@Autowired
	private InvoiceInfoDao invoiceInfoDao;
	@Autowired
	private MemberDao memberDao;


	@Override
	public void fetchDetailData(InvoiceInfo obj, Map<String, Object> map) {
		if (B.Y(obj.getSmemberid()))
			E.S("会员不存在!");
		Member member = memberDao.findOne(obj.getSmemberid());
        map.put("member",member);

	}
}
