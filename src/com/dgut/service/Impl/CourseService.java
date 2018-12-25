package com.dgut.service.Impl;

import com.dgut.po.Course;
import com.dgut.po.CourseExtend;
import com.dgut.vo.SelectCourseVo;
import com.dgut.vo.SelectCourseVo;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface CourseService {
    //查询所有课程信息
    public List<Course> courseList(Course course);
    //增加一个课程
    public void insertCourse(Course course);
    //通过课程编号判断一个课程是否已经在数据库
    public boolean hasCourse(String cno);
    //根据课程编号返回一个课程对象
    public Course getCourseByCno(String cno);
    //根据课程编号删除一个课程对象
    public void deleteCourseByCno(String cno);
    //根据学号获取该学生所有未选课的课程信息
    public List<Course> getUnSelectedCourse(int sno);
    //根据学号获取该学生所有选课的课程信息
    public List<Course> getSelectedCourse(int sno);
    //获取选课vo列表
    public List<SelectCourseVo> getSelectCourseVos(int sno);

}
