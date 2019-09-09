/** 
 * Filename IParameterService.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.web.utils;

import com.frogsing.heart.web.vo.FrogVo;

import java.util.List;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">fanyijie</a>
 * @since version1.0
 */
public interface IFrogService {

	List<FrogVo> getAllFrog(String type);
	
}
