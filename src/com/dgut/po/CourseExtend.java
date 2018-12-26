package com.dgut.po;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Size;

public class CourseExtend extends Course{
    private String cno;
    private String cname;
    private String credit;
    private String tno;
    private String tname;

    @Override
    public String getCno() {
        return cno;
    }

    @Override
    public void setCno(String cno) {
        this.cno = cno;
    }

    @Override
    public String getCname() {
        return cname;
    }

    @Override
    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String getCredit() {
        return credit;
    }

    @Override
    public void setCredit(String credit) {
        this.credit = credit;
    }

    @Override
    public String getTno() {
        return tno;
    }

    @Override
    public void setTno(String tno) {
        this.tno = tno;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

}
