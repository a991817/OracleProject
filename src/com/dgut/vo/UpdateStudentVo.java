package com.dgut.vo;

import com.dgut.po.Class;
import com.dgut.po.StudentCustom;

import java.util.List;

public class UpdateStudentVo {
    StudentCustom studentCustom;
    List<Class> classes;

    public UpdateStudentVo() {
    }

    public UpdateStudentVo(StudentCustom studentCustom, List<Class> classes) {
        this.studentCustom = studentCustom;
        this.classes = classes;
    }

    public StudentCustom getStudentCustom() {
        return studentCustom;
    }

    public void setStudentCustom(StudentCustom studentCustom) {
        this.studentCustom = studentCustom;
    }

    public List<Class> getClasses() {
        return classes;
    }

    public void setClasses(List<Class> classes) {
        this.classes = classes;
    }
}
