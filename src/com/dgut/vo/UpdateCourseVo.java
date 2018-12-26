package com.dgut.vo;

import com.dgut.po.CourseExtend;
import com.dgut.po.Teacher;

import java.util.List;

public class UpdateCourseVo {
    CourseExtend courseExtend;
    List<Teacher> teachers;

    public UpdateCourseVo() {
    }

    public UpdateCourseVo(CourseExtend courseExtend, List<Teacher> teachers) {
        this.courseExtend = courseExtend;
        this.teachers = teachers;
    }

    public CourseExtend getCourseExtend() {
        return courseExtend;
    }

    public void setCourseExtend(CourseExtend courseExtend) {
        this.courseExtend = courseExtend;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }
}
