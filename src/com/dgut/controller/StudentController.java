package com.dgut.controller;

import com.dgut.Util.StringUtil;
import com.dgut.po.Pager;
import com.dgut.po.Student;
import com.dgut.service.Impl.StudentService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.Repeat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("/studentList")
    public String studentList(){
        return "redirect:searchStudent.action";
    }
    //查询学生,根据学号、姓名、性别查询,type判断用户是否点击页码翻页操作(有翻页操作和查询操作)
    @RequestMapping("/searchStudent")
    public ModelAndView searchStudent(Student student,String type,
                                      @RequestParam(defaultValue = "5")String pageSize,
                                      @RequestParam(defaultValue = "1")String pageNum,
                                      HttpSession httpSession){
        //如果查询条件不为空,则把查询条件保存到session中
        if(type==null){
            httpSession.setAttribute("studentVo",student);
        }
        //是翻页操作的话，找出保存在session中的查询条件
        if("page".equals(type)){
            student = (Student) httpSession.getAttribute("studentVo");
        }
        ModelAndView modelAndView = new ModelAndView();
        //把1、0转换成男和女
        student = StringUtil.changeStudentSex(student);
        List<Student> students = studentService.getStudentList(student);
        Pager pager = new Pager(Integer.parseInt(pageNum),Integer.parseInt(pageSize),students);
        modelAndView.addObject("pager",pager);
        modelAndView.setViewName("studentList");
        return modelAndView;
    }
//插入一个学生
    @RequestMapping("/insertStudent")
    public String insertStudent(Student student, HttpServletRequest request){
        //先看看数据库有没有这个学生，根据学号来判断；
        student = StringUtil.deleteSpace(student);
        //insertAStudent方法中判断是插入还是更新
        insertAStudent(student);
        //如果是管理员的话就跳转到学生列表
        if("root".equals((String)request.getSession().getAttribute("username")))
            return "redirect:studentList.action";
        //如果是学生的话就跳转到学生个人信息页面
        else
            return "redirect:studentInfo.action";
    }
    @RequestMapping("/test")
    public String test(){
        Student student = new Student();
        student.setSno("2");
        student.setSname("潘晓波");
        student.setSsex("男");
        Date date= new java.sql.Date(new java.util.Date().getTime());
        //student.setSbirthday(date);
        student.setSpeciality("软工");
        student.setTc("2");
        student.setSclass("1");
        studentService.updateStudent(student);
        return "redirect:studentList.action";
    }

//删除学生，删除之后跳转到学生列表
    @RequestMapping("/deleteStudent")
    public String deleteStudent(int sno){
        studentService.deleteStudent(sno);
        return "redirect:studentList.action";
    }
//    跳转到修改页面
    @RequestMapping("/updateStudentPage")
    public ModelAndView updateStudent(@RequestParam(value = "sno",defaultValue="-1")Integer sno){
        ModelAndView modelAndView = new ModelAndView();
        if(sno!=-1) {
            //先找到这个学生的信息
            Student student = studentService.getStudentByNo(sno);
            modelAndView.addObject("student", student);
        }
        modelAndView.setViewName("updateStudent");
        return modelAndView;
    }

    //查询学生学号界面
    @RequestMapping("/queryStudentPage")
    public String queryStudent(){
        return "queryStudent";
    }
    //查询学生
    @RequestMapping("/queryStudent")
    public @ResponseBody Student queryStudent(Integer sno){
        Student student=null;
       if(sno!=null) {
           student = studentService.getStudentByNo(sno);
           //如果查询的学生不存在,返回一个学号为-1的学生
           if(student==null){
               student = new Student();
               student.setSno("-1");
           }
       }
       //返回-2表示没有输入学号
       else{
           student = new Student();
           student.setSno("-2");
       }
        return student;
    }
//    student
    //从session中获取该学生的信息
    @RequestMapping("/studentInfo")
    public ModelAndView studentInfo(HttpSession httpSession){
        ModelAndView modelAndView = new ModelAndView();
        String username = (String) httpSession.getAttribute("username");
        Student student = studentService.getStudentByNo(Integer.parseInt(username));
        modelAndView.addObject("student",student);
        modelAndView.setViewName("/student/studentInfo");
        return modelAndView;
    }

    @RequestMapping("/updateStudentInfoPage")
    public ModelAndView updateStudentInfoPage(String sno){
        ModelAndView modelAndView = new ModelAndView();
        Student student = studentService.getStudentByNo(Integer.parseInt(sno));
        modelAndView.addObject("student",student);
        modelAndView.setViewName("/student/s_updateStudent");
        return modelAndView;
    }

    @RequestMapping("/changePasswordPage")
    public String changePasswordPage(){
        return "student/changePassword";
    }

    @RequestMapping("/changePassword")
    public @ResponseBody String changePassword(HttpSession httpSession,String oldPassword,String newPassword){
        String username = (String) httpSession.getAttribute("username");
        if(studentService.changePassword(username,oldPassword,newPassword)==-1){
            return "false";
        }
        return "true";
    }


    public void insertAStudent(Student student){
        //如果没有则插入
        if(student.getSno() == null) {
            //默认值为0
            student.setTc("0");
            studentService.insertStudent(student);
        }
        //如果有则更新
        else{
            int count = studentService.updateStudent(student);
            System.out.println("更新了"+count+"行");
        }
    }










}
