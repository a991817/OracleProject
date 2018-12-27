package com.dgut.service.Impl;

import com.dgut.po.Student;
import com.dgut.po.StudentCustom;

import java.util.List;

public interface StudentService {
    public StudentCustom getStudentByNo(int sno);
    //根据查询条件查询学生
    public List<StudentCustom> getStudentList(Student studentVo);
    public void insertStudent(Student student);
    public void deleteStudent(int sno);
    public int updateStudent(Student student);
    //通过学号和密码判断学号密码是否正确
    public boolean isCorrect(String sno,String password);
    //修改密码
    public int changePassword(String sno,String oldPassword,String newPassword);
}
