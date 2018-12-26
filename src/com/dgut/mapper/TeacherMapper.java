package com.dgut.mapper;

import com.dgut.po.Teacher;

import java.util.List;

public interface TeacherMapper {
    public List<Teacher> getAllTeacher();
    public String getTeacherByTno(String tno);
}
