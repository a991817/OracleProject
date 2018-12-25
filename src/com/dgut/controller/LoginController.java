package com.dgut.controller;

import com.dgut.exception.GlobalException;
import com.dgut.service.Impl.ScoreService;
import com.dgut.service.Impl.StudentService;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    StudentService studentService;
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession httpSession) throws GlobalException {
        //如果用户名为空,表示不是从登陆页面来的，则跳转到登陆页面
        if(username==null){
            return "login";
        }
        //如果是管理员登陆,则保存root到session，并跳转到管理员的学生列表页面
        if(isRoot(username,password)){
            httpSession.setAttribute("username","root");
            return "redirect:studentList.action";
        }
        //如果是学生登陆
        //如果正确,把学号保存到session中,跳转到学生自己信息的页面
        if(studentService.isCorrect(username,password)){
            httpSession.setAttribute("username",username);
            return "redirect:studentInfo.action";
        }
        //如果都错误则抛出异常，跳转到异常页面
        else{
            throw new GlobalException("用户名或密码错误");
        }
    }
    //当点击退出的时候，清空session并跳转到登陆界面
    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){
        httpSession.invalidate();
        return "login";
    }
    //判断是否是管理员登陆
    public boolean isRoot(String username,String password){
        if("root".equals(username) && "root".equals(password)){
            return true;
        }
        else
            return false;
    }
}
