package com.dgut.vo;

import com.dgut.po.Course;
import com.dgut.po.Teacher;

public class SelectCourseVo{
    private Course course;
    private int sno;
    private String tname ;
    private boolean selected;

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    @Override
    public String toString() {
        return "selectCourseVo{" +
                "course=" + course +
                ", sno=" + sno +
                ", selected=" + selected +
                '}';
    }
}
