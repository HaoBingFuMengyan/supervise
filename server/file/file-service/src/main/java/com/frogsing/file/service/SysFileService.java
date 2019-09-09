package com.frogsing.file.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.frogsing.file.ISysFileService;
import com.frogsing.file.dao.SysFileDao;
import com.frogsing.file.po.SysFile;

/**
 * 文件存储仓库Service
 * 
 * @author <a href="mailto:service@frogsing.com">sandy</a>
 * @since version1.0
 */
@Component
@Transactional
public class SysFileService implements ISysFileService {

	@Autowired
	private SysFileDao sysFileDao;
	
	@Override
	public void dosave(SysFile obj) {
		sysFileDao.save(obj);
	}
	
}
