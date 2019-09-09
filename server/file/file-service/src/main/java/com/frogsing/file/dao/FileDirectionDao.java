package com.frogsing.file.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.file.po.FileDirection;
import org.springframework.data.jpa.repository.Query;


//frogsingcode//
public interface FileDirectionDao extends BaseDao<FileDirection, String>{
//frogsingcode//

    @Query("select max(isort) from FileDirection where sbillid=?1")
    Long findMaxSort(String billId);

    void deleteBySbillid(String billId);

//frogsingcode//
}

