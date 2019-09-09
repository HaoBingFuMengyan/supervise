package com.frogsing.member.vo;

import java.io.Serializable;

public class UserActorVo implements Serializable {

    private String sroleid;

    private String srolename;

    private boolean ischecked;


    public String getSroleid() {
        return sroleid;
    }

    public void setSroleid(String sroleid) {
        this.sroleid = sroleid;
    }

    public String getSrolename() {
        return srolename;
    }

    public void setSrolename(String srolename) {
        this.srolename = srolename;
    }

    public boolean isIschecked() {
        return ischecked;
    }

    public void setIschecked(boolean ischecked) {
        this.ischecked = ischecked;
    }
}
