/** 
 * Filename IParameterService.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.service;

import java.util.Date;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public interface IPlanJobService {
	
	 void newjob(int taskType, Class<?> cls, boolean bisfailstop, String taskname, Date jobTime, String para);

	
}
