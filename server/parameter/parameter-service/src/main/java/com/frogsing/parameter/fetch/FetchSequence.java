package com.frogsing.parameter.fetch;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.parameter.dao.SequenceDao;
import com.frogsing.parameter.po.Sequence;
import com.frogsing.parameter.utils.PARAMETERCol.cs_sequence;

@Component
public class FetchSequence extends BaseFetch<Sequence>{
	
	@Autowired
	private SequenceDao sequenceDao;

	@Override
	public void commonCheck(Sequence vo, ILoginUser u) {
		
		long i = sequenceDao.count(cs_sequence.scode, vo.getScode(),vo.getId());
		if(i>0){
			E.S("编号生成器已存在!");
		}
	}
	
	
}
