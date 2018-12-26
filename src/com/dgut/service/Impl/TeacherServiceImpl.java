package com.dgut.service.Impl;

import com.dgut.mapper.TeacherMapper;
import com.dgut.po.Teacher;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TeacherServiceImpl implements TeacherService{
    @Autowired
    TeacherMapper teacherMapper;
    @Override
    public List<Teacher> getAllTeacher() {
        return teacherMapper.getAllTeacher();
    }
}
