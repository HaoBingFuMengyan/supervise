package com.frogsing.file.service;

import com.frogsing.file.IFileStoreService;
import com.frogsing.file.dao.FileDirectionDao;
import com.frogsing.file.po.FileDirection;
import com.frogsing.file.utils.FILECol;
import com.frogsing.file.utils.FtpUtils;
import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * 文件存储仓库Service
 * 
 * @author <a href="mailto:service@frogsing.com">sandy</a>
 * @since version1.0
 */
@Component
@Transactional
public class FileStoreService implements IFileStoreService {
	@Autowired
	private FileDirectionDao fileDirectionDao;

	@Override
	public String[] uploadPriFile(boolean bisdefault, String billId, String sremark,String serverPath,String filename) {
		//String path= FtpUtils.uploadToFtpServer(file,FtpUtils.getPrivateDir(servicePath));
		FileDirection fileDirection = this.buildEntity(filename,bisdefault,serverPath,billId,sremark);
		if(B.N(billId)){
			fileDirection.setBisused(Consts.BoolType.YES.val());
			//查找排序号
			Long max=this.fileDirectionDao.findMaxSort(billId);
			if (max == null) {
				max=1L;
			}
			fileDirection.setIsort(max.intValue());
		}
		this.fileDirectionDao.save(fileDirection);
		return new String[]{fileDirection.getId(),serverPath,filename};
	}

	@Override
	public String[] uploadFile( boolean bisdefault, String billId,String sremark,String serverPath,String filename) {
		//String path= FtpUtils.uploadToFtpServer(file,FtpUtils.getPublicDir(servicePath));
		FileDirection fileDirection = this.buildEntity(filename,bisdefault,serverPath,billId,sremark);
		if(B.N(billId)){
			fileDirection.setBisused(Consts.BoolType.YES.val());
			//查找排序号
			Long max=this.fileDirectionDao.findMaxSort(billId);
			if (max == null) {
				max=1L;
			}
			fileDirection.setIsort(max.intValue());
		}
		this.fileDirectionDao.save(fileDirection);
		return new String[]{fileDirection.getId(),serverPath,filename};
	}

	@Override
	public void updateFileBillId(String fileId, String billId) {
		FileDirection file = this.fileDirectionDao.findOne(fileId);
		if (file != null) {
			Long max=this.fileDirectionDao.findMaxSort(billId);
			if (max == null) {
				max=0L;
			}
			file.setIsort(max.intValue()+1);
			file.setSbillid(billId);
			file.setBisused(Consts.BoolType.YES.val());
			this.fileDirectionDao.save(file);
		}
	}

	@Override
	public void delFileByBillId(String billId) {
		this.fileDirectionDao.deleteBySbillid(billId);
	}

	@Override
	public void delFileById(String id) {
		this.fileDirectionDao.delete(id);
	}

	private FileDirection buildEntity(String fileName, boolean bisdefault,String path,String billId,String remark){
		FileDirection file = new FileDirection();
		file.setId(null);
		file.setBisdefault(bisdefault?Consts.BoolType.YES.val():Consts.BoolType.NO.val());
		file.setBisused(Consts.BoolType.NO.val());
		file.setDadddate(T.now());
		file.setIsort(0);
		file.setSbillid(billId);
		file.setSfilename(fileName);
		file.setSfilepath(path);
		file.setSremark(remark);

		return file;
	}


	@Override
	public FileDirection findBysbillidAndisort(final String sbillid, final int isort) {
		return fileDirectionDao.findOne(new Specification<FileDirection>(){
			@Override
			public Predicate toPredicate(Root<FileDirection> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder cb) {
				return cb.and(cb.equal(root.get(FILECol.wj_filedirection.sbillid), sbillid),
						cb.equal(root.get(FILECol.wj_filedirection.isort), isort));
			}
		});
	}

	@Override
	public List<FileDirection> findBySbillid(String sbillid) {
		return fileDirectionDao.findAll(new Specification<FileDirection>(){
			@Override
			public Predicate toPredicate(Root<FileDirection> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder cb) {
				return cb.equal(root.get(FILECol.wj_filedirection.sbillid), sbillid);
			}
		});
	}
}
