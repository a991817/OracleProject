package com.dgut.po;

public class ScoreExtend extends Score{
    private String sname;
    private String cname;
    private String cno;

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String getCno() {
        return cno;
    }

    @Override
    public void setCno(String cno) {
        this.cno = cno;
    }

    @Override
    public String toString() {
        return "ScoreExtend{" +
                "sname='" + sname + '\'' +
                ", cname='" + cname + '\'' +
                '}';
    }
}
