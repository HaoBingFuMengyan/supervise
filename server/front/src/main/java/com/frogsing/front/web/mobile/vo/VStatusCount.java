package com.frogsing.front.web.mobile.vo;

public class VStatusCount {
    private long wait;
    private long checked;
    private long reject;
    private long all;

    public long getWait() {
        return wait;
    }

    public void setWait(long wait) {
        this.wait = wait;
    }

    public long getChecked() {
        return checked;
    }

    public void setChecked(long checked) {
        this.checked = checked;
    }

    public long getReject() {
        return reject;
    }

    public void setReject(long reject) {
        this.reject = reject;
    }

    public long getAll() {
        return all;
    }

    public void setAll(long all) {
        this.all = all;
    }

    public long getSign() {
        return sign;
    }

    public void setSign(long sign) {
        this.sign = sign;
    }

    private long sign;

}
