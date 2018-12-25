package com.dgut.service.Impl;

import com.dgut.mapper.StudentMapper;
import com.dgut.po.Student;
import com.dgut.po.StudentExtend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public Student getStudentByNo(int sno) {
        return studentMapper.getStudentByNo(sno);
    }

    @Override
    public List<Student> getStudentList(Student studentVo) {
        return studentMapper.getStudentList(studentVo);
    }

    @Override
    public void insertStudent(Student student) {
         //获得最大学号，在此基础上加1
        String maxSno = studentMapper.getMaxSno();
        String Sno = String.valueOf(Integer.parseInt(maxSno)+1);
        student.setSno(Sno);

        studentMapper.insertStudent(student);
    }

    @Override
    public void deleteStudent(int sno) {
        studentMapper.deleteStudent(sno);
    }

    @Override
    @Transactional
    public int updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }

    @Override
    public boolean isCorrect(String sno, String password) {
        String dbPassword = studentMapper.getPassword(sno);
        //如果数据库的密码和登陆密码相同则返回true
        if(dbPassword.equals(password)){
            return true;
        }
        return false;
    }

    @Override
    public int changePassword(String sno,String oldPassword,String newPassword) {
        String dbPassword = studentMapper.getPassword(sno);
        //如果数据库的密码和用户输入的旧密码相同
        if(dbPassword.equals(oldPassword)){
            Student student = new Student();
            student.setSno(sno);
            StudentExtend studentExtend = new StudentExtend();
            studentExtend.setPassword(newPassword);
            studentExtend.setStudent(student);
            studentMapper.changePassword(studentExtend);
            //成功
            return 1;
        }
        //旧密码与数据库的密码不相同
        return -1;
    }




}
