package com.dgut.po;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Course {
    //非空校验
    @Size(min = 1,max = 3,message = "{course.cno.error}")
    private String cno;
    @Size(min = 1,max = 10,message = "{course.cname.error}")
    private String cname;
    @DecimalMin(value = "1")
    private String credit;
    private String tno;

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    @Override
    public String toString() {
        return "Course{" +
                "cno='" + cno + '\'' +
                ", cname='" + cname + '\'' +
                ", credit='" + credit + '\'' +
                ", tno='" + tno + '\'' +
                '}';
    }
}
