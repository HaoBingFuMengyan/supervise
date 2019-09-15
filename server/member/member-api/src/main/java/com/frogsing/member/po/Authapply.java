package com.frogsing.member.po;
//frogsingcode//


import javax.persistence.*;

import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.operator.po.Operator;
import com.google.common.collect.Lists;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.frogsing.member.utils.MEMBERCol.hy_authapply;

import java.util.List;

//frogsingcode//
@Entity
@Table(name = "hy_authapply")
//frogsingcode//
//frogsingcode//
public class Authapply extends AuthapplyBase {

    private static final long serialVersionUID = 1L;

//frogsingcode//


    private User user;

    @ManyToOne
    @JoinColumn(name = hy_authapply.sapplyuserid, updatable = false, insertable = false)
    @NotFound(action = NotFoundAction.IGNORE)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    private Member member;

    @ManyToOne
    @JoinColumn(name = hy_authapply.smemberid, insertable = false, updatable = false)
    @JsonIgnore

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    private Operator operator;

    @ManyToOne
    @JoinColumn(name = hy_authapply.sadduser, insertable = false, updatable = false)
    @JsonIgnore
    public Operator getOperator() {
        return operator;
    }

    public void setOperator(Operator operator) {
        this.operator = operator;
    }


    private List<NaturalHolder> naturalHolders = Lists.newArrayList();

    @Transient
    public List<NaturalHolder> getNaturalHolders() {
        return naturalHolders;
    }

    public void setNaturalHolders(List<NaturalHolder> naturalHolders) {
        this.naturalHolders = naturalHolders;
    }

    private List<CompanyHolder> companyHolders = Lists.newArrayList();

    @Transient
    public List<CompanyHolder> getCompanyHolders() {
        return companyHolders;
    }

    public void setCompanyHolders(List<CompanyHolder> companyHolders) {
        this.companyHolders = companyHolders;
    }

    private List<ControHolder> controHolders = Lists.newArrayList();

    @Transient
    public List<ControHolder> getControHolders() {
        return controHolders;
    }

    public void setControHolders(List<ControHolder> controHolders) {
        this.controHolders = controHolders;
    }
    //frogsingcode//

}
