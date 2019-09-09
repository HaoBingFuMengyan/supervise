package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.member.IFeedbackService;
import com.frogsing.member.dao.FeedbackDao;
import com.frogsing.member.dao.MemberDao;
import com.frogsing.member.po.Feedback;
import com.frogsing.member.po.Member;
import com.frogsing.member.vo.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Component
@Transactional
public class FeedbackService implements IFeedbackService {

    @Autowired
    private IQueryService queryService;

    @Autowired
    private FeedbackDao feedbackDao;

    @Autowired
    private MemberDao memberDao;

    @Override
    public void addFeedBack(String smobile, String sinfo, LoginUser user) {
        Member member = memberDao.findOne(user.getMemberId());

        Feedback feedback = new Feedback();

        feedback.setId(null);
        feedback.setSmemberid(member.getId());
        feedback.setSmembername(member.getScnname());
        feedback.setSmobile(smobile);//反馈手机号
        feedback.setSinfo(sinfo);//反馈信息
        feedback.setDadddate(new Date());//反馈时间

        this.feedbackDao.save(feedback);
    }
}
