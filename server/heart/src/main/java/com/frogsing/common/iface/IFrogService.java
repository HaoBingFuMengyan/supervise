/** 
 * Filename IParameterService.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.common.iface;

import java.util.List;

import com.frogsing.heart.web.vo.FrogVo;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">fanyijie</a>
 * @since version1.0
 */
public interface IFrogService {

	List<FrogVo> getAllFrog(String type);
	
}
