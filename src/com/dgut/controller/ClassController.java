package com.dgut.controller;

import com.dgut.po.*;
import com.dgut.po.Class;
import com.dgut.service.Impl.ClassService;
import com.dgut.vo.UpdateStudentVo;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ClassController {
    @Autowired
    ClassService classService;
    @RequestMapping("/classList")
    public ModelAndView classList(Class c, String type,
                                  @RequestParam(defaultValue = "5")String pageSize,
                                  @RequestParam(defaultValue = "1")String pageNum,
                                  HttpSession httpSession){
        //如果查询条件不为空,则把查询条件保存到session中
        if(type==null){
            httpSession.setAttribute("c",c);
        }
        //是翻页操作的话，找出保存在session中的查询条件
        if("page".equals(type)){
            c = (Class) httpSession.getAttribute("c");
        }
        ModelAndView modelAndView = new ModelAndView();
        List<Class> classes = classService.getAllClass(c);
        Pager pager = new Pager(Integer.parseInt(pageNum),Integer.parseInt(pageSize),classes);
        modelAndView.addObject("pager",pager);
        modelAndView.setViewName("classList");
        return modelAndView;
    }
    //    跳转到修改页面
    @RequestMapping("/updateClassPage")
    public ModelAndView updateClass(@RequestParam(value = "cno",defaultValue="default")String cno,
                                    HttpSession httpSession){
        ModelAndView modelAndView = new ModelAndView();
        //如果不是默认的 情况
        if(!("default".equals(cno))) {
            //把课程号保存在session中
            httpSession.setAttribute("cno",cno);
            //先找到该课程
            Class c = classService.getClassByCno(cno);
            modelAndView.addObject("c", c);
        }
        modelAndView.setViewName("updateClass");
        return modelAndView;
    }
    @RequestMapping("/insertClass")
    public String insertClass(HttpSession httpSession,String cname){
        String cno = (String) httpSession.getAttribute("cno");
        //交给service判断是更新还是插入
        classService.insertAClass(cno,cname);
        //用完就删除
        httpSession.removeAttribute("cno");
        return "redirect:classList.action";
    }
}
