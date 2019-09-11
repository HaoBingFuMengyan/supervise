package com.frogsing.member.fetch;

import com.frogsing.heart.data.BaseFetch;
import com.frogsing.member.po.Actor;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class FetchActor extends BaseFetch<Actor>{


	@Override
	public void fetchDetailData(Actor obj, Map<String, Object> map) {

	}
}
