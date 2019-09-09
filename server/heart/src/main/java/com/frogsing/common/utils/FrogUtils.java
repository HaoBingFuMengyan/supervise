package com.frogsing.common.utils;

import com.frogsing.common.iface.IFrogService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.web.vo.FrogVo;

import javax.frogsing.exception.ServiceException;
import java.util.List;

public class FrogUtils {

	private static IFrogService s;
	private static Object o = new Object();

	public static List<FrogVo> getAllFrog(String type) throws ServiceException {
		if (s == null) {
			synchronized (o) {
				if (s == null)
					s = SpringContextHolder.getBean(IFrogService.class);
				if (s == null)
					E.S("IFrogService实现类未找到");
			}

		}
		return s.getAllFrog(type);

	}

}
