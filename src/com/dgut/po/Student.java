package com.dgut.po;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Student {
    private String sno; //学号
    private String sname;   //姓名
    private String ssex;    //性别
    private String speciality;  //专业
    private Date sbirthday; //出生日期
    private String sclass;  //班号
    private String tc;  //总学分

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public Date getSbirthday() {
        return sbirthday;
    }


//    public void setSbirthday(Date sbirthday) {
//        this.sbirthday = sbirthday;
//    }
    public void setSbirthday(String str) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday;
        try {
            birthday = sdf.parse(str);
            this.sbirthday = birthday;
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public String getSclass() {
        return sclass;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public String getTc() {
        return tc;
    }

    public void setTc(String tc) {
        this.tc = tc;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno='" + sno + '\'' +
                ", sname='" + sname + '\'' +
                ", ssex='" + ssex + '\'' +
                ", speciality='" + speciality + '\'' +
                ", sbirthday=" + sbirthday +
                ", sclass='" + sclass + '\'' +
                ", tc='" + tc + '\'' +
                '}';
    }
}
