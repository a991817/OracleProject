package com.dgut.mapper;

import com.dgut.po.Course;
import com.dgut.po.CourseExtend;
import com.dgut.po.Student;

import java.util.List;

public interface CourseMapper {
    //获取所有课程信息
    public List<Course> getCourseList(Course course);
    //根据课程编号查找课程
    public CourseExtend getCourseByCno(String cno);
    //增加一个课程
    public void insertCourse(CourseExtend courseExtend);
    //更新课程信息
    public int updateCourse(CourseExtend courseExtend);
    //删除课程信息
    public void deleteCourse(String cno);
    //获得最大课程号
    public List<String> getAllCno();
    //根据学号获取该学生所有未选课的课程信息
    public List<Course> getUnSelectedCourse(int sno);
    //根据学号获取该学生所有选课的课程信息
    public List<Course> getSelectedCourse(int sno);

}
