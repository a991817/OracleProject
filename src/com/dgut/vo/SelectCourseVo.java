package com.dgut.vo;

import com.dgut.po.Course;

public class SelectCourseVo{
    private Course course;
    private int sno;
    private boolean selected;

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
