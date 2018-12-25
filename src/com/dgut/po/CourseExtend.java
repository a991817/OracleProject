package com.dgut.po;

public class CourseExtend extends Course{
    private String lastCno;

    public String getLastCno() {
        return lastCno;
    }

    public void setLastCno(String lastCno) {
        this.lastCno = lastCno;
    }

    @Override
    public String toString() {
        return "CourseExtend{" +
                "lastCno='" + lastCno + '\'' +
                '}';
    }
}
