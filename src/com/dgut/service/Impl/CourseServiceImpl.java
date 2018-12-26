package com.dgut.service.Impl;

import com.dgut.Util.ChangeToExtendUtil;
import com.dgut.Util.StringUtil;
import com.dgut.mapper.CourseMapper;
import com.dgut.mapper.TeacherMapper;
import com.dgut.po.Course;
import com.dgut.po.CourseExtend;
import com.dgut.vo.SelectCourseVo;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class CourseServiceImpl implements CourseService{
    @Autowired
    CourseMapper courseMapper;
    @Autowired
    TeacherMapper teacherMapper;

    //返回所有课程信息
    @Override
    public List<Course> courseList(Course course) {
        return courseMapper.getCourseList(course);
    }

    //插入一个课程信息，如果已经存在则更新，如果不存在则插入
    @Override
    public void insertCourse(Course course) {
        CourseExtend courseExtend = ChangeToExtendUtil.change(course);
        //如果课程号为空，即为插入
        if(courseExtend.getCno()==null){
            //获得所有课程号之后计算，最大课程编号
           List<String> cnos = courseMapper.getAllCno();
           String maxCno = StringUtil.getMaxCon(cnos);
           courseExtend.setCno(maxCno);
           courseMapper.insertCourse(courseExtend);
        }
        //如果不为空，则更新已有的课程信息
        else{
            int count = courseMapper.updateCourse(courseExtend);
            System.out.println("更新了"+count+"条信息--course");
        }

    }

    @Override
    public boolean hasCourse(String cno) {
        //如果有则返回真，否则返回假
        Course c = courseMapper.getCourseByCno(cno);
        if(c==null){
            return false;
        }
        return true;
    }

    @Override
    public CourseExtend getCourseByCno(String cno) {
        return courseMapper.getCourseByCno(cno);
    }

    @Override
    public void deleteCourseByCno(String cno) {
        courseMapper.deleteCourse(cno);
    }

    public List<Course> getUnSelectedCourse(int sno){return courseMapper.getUnSelectedCourse(sno);}

    @Override
    public List<Course> getSelectedCourse(int sno) {
        return courseMapper.getSelectedCourse(sno);
    }

    @Override
    public List<SelectCourseVo> getSelectCourseVos(int sno) {
        List<SelectCourseVo> SelectCourseVos = new ArrayList<SelectCourseVo>();
        //获取所有已选课程,添加到vo列表，并且设置为已选
        List<Course> selectedCourses = courseMapper.getSelectedCourse(sno);
        for(Course selectedCourse:selectedCourses){
            SelectCourseVo selectCourseVo = new SelectCourseVo();
            selectCourseVo.setCourse(selectedCourse);
            selectCourseVo.setSelected(true);
            selectCourseVo.setSno(sno);
            selectCourseVo.setTname(teacherMapper.getTeacherByTno(selectedCourse.getTno()));
            SelectCourseVos.add(selectCourseVo);
        }
        //获取所有未选课程,添加到vo列表，并且设置为未选
        List<Course> UnSelectedCourses = courseMapper.getUnSelectedCourse(sno);
        for(Course UnSelectedCourse:UnSelectedCourses){
            SelectCourseVo selectCourseVo = new SelectCourseVo();
            selectCourseVo.setCourse(UnSelectedCourse);
            selectCourseVo.setSelected(false);
            selectCourseVo.setSno(sno);
            selectCourseVo.setTname(teacherMapper.getTeacherByTno(UnSelectedCourse.getTno()));
            SelectCourseVos.add(selectCourseVo);
        }
        return SelectCourseVos;
    }

    @Override
    public List<CourseExtend> addTeacherName(List<Course> courses) {
        List<CourseExtend> courseExtends = new ArrayList<CourseExtend>();
        String tname = null;
        for(Course course:courses){
            tname = teacherMapper.getTeacherByTno(course.getTno());
            CourseExtend courseExtend = new CourseExtend();
            courseExtend.setCno(course.getCno());
            courseExtend.setCredit(course.getCredit());
            courseExtend.setCname(course.getCname());
            courseExtend.setTno(course.getTno());
            courseExtend.setTname(tname);
            courseExtends.add(courseExtend);
        }
        return courseExtends;
    }

}
