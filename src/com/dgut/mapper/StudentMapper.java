package com.dgut.mapper;

import com.dgut.po.Course;
import com.dgut.po.Student;
import com.dgut.po.StudentExtend;

import java.util.List;

public interface StudentMapper {
    //获取所有学生的信息
    public List<Student> getStudentList(Student student);
    //根据学号查找学生
    public Student getStudentByNo(int sno);
    //增加一个学生
    public void insertStudent(Student student);
    //根据学号删除学生getCourseByCno
    public void deleteStudent(int sno);
    //更新学生信息
    public int updateStudent(Student student);
    //根据学号返回密码
    public String getPassword(String sno);
    //获得最大学号
    public String getMaxSno();
    //修改密码
    public void changePassword(StudentExtend studentExtend);
}
