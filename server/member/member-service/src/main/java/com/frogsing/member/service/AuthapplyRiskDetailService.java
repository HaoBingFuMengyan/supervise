package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.member.IAuthapplyRiskDetailService;
import com.frogsing.member.dao.AuthapplyRiskDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by haobingfu on 2019/9/22.
 */
@Component
@Transactional
public class AuthapplyRiskDetailService implements IAuthapplyRiskDetailService {

    @Autowired
    private AuthapplyRiskDetailDao authapplyRiskDetailDao;

    @Autowired
    private IQueryService queryService;

}
