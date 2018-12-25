package com.dgut.controller;

import com.dgut.po.Course;
import com.dgut.po.Pager;
import com.dgut.po.Score;
import com.dgut.po.ScoreExtend;
import com.dgut.service.Impl.ScoreService;
import com.dgut.vo.ScoreVo;
import com.dgut.vo.SelectCourseVo;
import javafx.scene.Scene;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ScoreController {
    @Autowired
    ScoreService scoreService;

    @RequestMapping("/scoreList")
    public ModelAndView scoreList(ScoreExtend scoreExtend, String type,
                                  @RequestParam(defaultValue = "5")String pageSize,
                                  @RequestParam(defaultValue = "1")String pageNum,
                                  HttpSession httpSession){

        ModelAndView modelAndView = new ModelAndView();
        List<ScoreExtend> scores = scoreService.getScoreList(scoreExtend);
        Pager pager = new Pager(Integer.parseInt(pageNum),Integer.parseInt(pageSize),scores);
        modelAndView.addObject("pager",pager);
        modelAndView.setViewName("scoreList");
        return modelAndView;
    }
    @RequestMapping("/updateScorePage")
    public ModelAndView updateScorePage(String cno, String sno){
        ModelAndView modelAndView = new ModelAndView();
        //查询条件,根据cno,sno联合主键查询一条记录,该记录显示在updateScore.jsp上
        ScoreExtend se = new ScoreExtend();
        se.setCno(cno);
        se.setSno(sno);
        ScoreExtend scoreExtend = scoreService.getScoreInfoByCS(se);
        modelAndView.addObject("score",scoreExtend);
        modelAndView.setViewName("updateScore");
        return modelAndView;
    }
    //从updateScore.jsp中传递sno,cno,score填充到scoreExtend
    @RequestMapping("/updateCourse")
    public String updateCourse(ScoreExtend scoreExtend){
        //更新之后跳转
        scoreService.updateScoreByCS(scoreExtend);
        return "redirect:scoreList.action";
    }
    @RequestMapping("/selectCourse")
    public @ResponseBody String selectCourse(Score score){
        scoreService.selectCourse(score);
        String message="{'status','sucess'}";
        return message;
    }

    @RequestMapping("/scoreInfo")
    public ModelAndView scoreInfo(String type,
                                  @RequestParam(defaultValue = "5")String pageSize,
                                  @RequestParam(defaultValue = "1")String pageNum,
                                  HttpSession httpSession){
        ModelAndView modelAndView = new ModelAndView();
        List<ScoreVo> scoreVos = scoreService.getScoreInfoBySno((String) httpSession.getAttribute("username"));
        Pager pager = new Pager(Integer.parseInt(pageNum),Integer.parseInt(pageSize),scoreVos);
        modelAndView.addObject("pager",pager);
        modelAndView.setViewName("/student/scoreInfo");
        return modelAndView;
    }



}
