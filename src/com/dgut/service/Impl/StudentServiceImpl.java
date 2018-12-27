package com.dgut.service.Impl;

import com.dgut.mapper.ClassMapper;
import com.dgut.mapper.ScoreMapper;
import com.dgut.mapper.StudentMapper;
import com.dgut.po.Student;
import com.dgut.po.StudentCustom;
import com.dgut.po.StudentExtend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ClassMapper classMapper;
    @Autowired
    private ScoreMapper scoreMapper;

    @Override
    public StudentCustom getStudentByNo(int sno) {
        return studentMapper.getStudentByNo(sno);
    }

    @Override
    public List<StudentCustom> getStudentList(Student studentVo) {
        return studentMapper.getStudentList(studentVo);
    }

    @Override
    public void insertStudent(Student student) {
         //获得最大学号，在此基础上加1
        String maxSno = studentMapper.getMaxSno();
        String Sno = String.valueOf(Integer.parseInt(maxSno)+1);
        student.setSno(Sno);
        studentMapper.insertStudent(student);
        //插入一个学生之后，更新该班级人数
        classMapper.updateNumbers(student.getSclass());
    }

    @Override
    public void deleteStudent(int sno) {
        Student student = getStudentByNo(sno);
        //删除成绩
        scoreMapper.deleteAllScoreBySno(String.valueOf(sno));
        studentMapper.deleteStudent(sno);
        //删除一个学生之后，更新该班级人数
        classMapper.updateNumbers(student.getSclass());
    }

    @Override
    @Transactional
    public int updateStudent(Student student) {

        int count = studentMapper.updateStudent(student);
        //更新一个学生之后，更新该班级人数
        classMapper.updateNumbers(student.getSclass());
        return count;

    }

    @Override
    public boolean isCorrect(String sno, String password) {
        //如果学号不存在返回false
        if(studentMapper.getStudentByNo(Integer.parseInt(sno))==null){
            return false;
        }
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
