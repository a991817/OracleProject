package com.dgut.controller;

import com.dgut.Util.StringUtil;
import com.dgut.exception.GlobalException;
import com.dgut.po.*;
import com.dgut.service.Impl.CourseService;
import com.dgut.service.Impl.ScoreService;
import com.dgut.service.Impl.TeacherService;
import com.dgut.vo.SelectCourseVo;
import com.dgut.vo.UpdateCourseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseController {
    @Autowired
    private CourseService courseService ;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ScoreService scoreService;

    @RequestMapping("/courseList")
    public ModelAndView courseList(Course course, String type,
                                   @RequestParam(defaultValue = "5")String pageSize,
                                   @RequestParam(defaultValue = "1")String pageNum,
                                   HttpSession httpSession){
        //如果查询条件不为空,则把查询条件保存到session中
        if(type==null){
            httpSession.setAttribute("courseVo",course);
        }
        //是翻页操作的话，找出保存在session中的查询条件
        if("page".equals(type)){
            course = (Course) httpSession.getAttribute("courseVo");
        }
        ModelAndView modelAndView = new ModelAndView();
        List<Course> courses = courseService.courseList(course);
        Pager pager = new Pager(Integer.parseInt(pageNum),Integer.parseInt(pageSize),courses);
        modelAndView.addObject("pager",pager);
        modelAndView.setViewName("courseList");
        return modelAndView;
    }
    @RequestMapping("/updateCoursePage")
    public ModelAndView updateCoursePage(@RequestParam(value = "cno",defaultValue="-1")String cno,
                                         HttpSession httpSession){
        ModelAndView modelAndView = new ModelAndView();
        CourseExtend course = courseService.getCourseByCno(cno);
        List<Teacher> teachers = teacherService.getAllTeacher();
        UpdateCourseVo updateCourseVo = new UpdateCourseVo(course,teachers);

        //如果数据库有这个信息，则把它填到表格中
        if(course!=null){
            //保存要修改的课程编号到session
            httpSession.setAttribute("updateCourseCno",cno);
            modelAndView.addObject("updateCourseVo",updateCourseVo);
        }
        modelAndView.addObject("updateCourseVo",updateCourseVo);
        modelAndView.setViewName("updateCourse");
        return modelAndView;

    }
    //在需要校验的pojo前面添加@Validated，在后面加BindingResult bindingResult接受校验出错的信息
    //注意：@Validated和BindingResult bindingResult配对出现，并且位置固定（一前一后）
    @RequestMapping("/insertCourse")
    public String insertCourse(Course course, BindingResult bindingResult,
                               HttpSession httpSession) throws GlobalException {

        //先把空格删了
        StringUtil.deleteSpace(course);
        //先看看数据库有没有这个课程，根据课程编号来判断；
        courseService.insertCourse(course);
        return "redirect:courseList.action";
    }
    @RequestMapping("courseTest")
    public String courseTest() throws GlobalException {

        if(1==1){
            throw new GlobalException("1居然等于1的异常！");
        }
        //courseService.insertCourse(course);
        return "redirect:studentList.action";
    }

    @RequestMapping("/deleteCourse")
    public String deleteCourse(String cno) throws GlobalException {
        if(scoreService.isFk(cno)){
            throw new GlobalException("该课程已有学生选课，不可删除");
        }
        courseService.deleteCourseByCno(cno);
        return "redirect:courseList.action";
    }
    //student
    @RequestMapping("/s_courseList")
    public ModelAndView s_courseList(String type,
                                     @RequestParam(defaultValue = "5")String pageSize,
                                     @RequestParam(defaultValue = "1")String pageNum,
                                     HttpSession httpSession){
        ModelAndView modelAndView = new ModelAndView();
        //从session中获取学号
        int sno = Integer.parseInt((String)httpSession.getAttribute("username"));
        //每次学生请求选课列表，都会拼接一次选课和未选课
        List<SelectCourseVo> selectCourseVos = courseService.getSelectCourseVos(sno);
        Pager pager = new Pager(Integer.parseInt(pageNum),Integer.parseInt(pageSize),selectCourseVos);
        modelAndView.addObject("pager",pager);
        modelAndView.setViewName("/student/selectCourse");
        return modelAndView;
    }

}
