package com.frogsing.member.fetch;

import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.member.dao.InvoiceInfoDao;
import com.frogsing.member.dao.MemberDao;
import com.frogsing.member.po.Actor;
import com.frogsing.member.po.InvoiceInfo;
import com.frogsing.member.po.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class FetchActor extends BaseFetch<Actor>{


	@Override
	public void fetchDetailData(Actor obj, Map<String, Object> map) {

	}
}
