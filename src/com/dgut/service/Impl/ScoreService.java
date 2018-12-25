package com.dgut.service.Impl;

import com.dgut.po.Score;
import com.dgut.po.ScoreExtend;
import com.dgut.vo.ScoreVo;

import java.util.List;

public interface ScoreService {
    //获取所有课程成绩
    public List<ScoreExtend> getScoreList(ScoreExtend scoreExtend);
    //根据学号和课程号查询一条记录,CS:表示cno和sno
    public ScoreExtend getScoreInfoByCS(ScoreExtend scoreExtend);
    //根据学号和课程号更新一条记录
    public void updateScoreByCS(ScoreExtend scoreExtend);
    //选课：将课程编号，学号插入到score表中
    public void selectCourse(Score score);
    //根据学号查询所有选了课的信息(包括成绩)
    public List<ScoreVo> getScoreInfoBySno(String sno);
    //更新所有学生的总学分
    public void updateAllTC();
    //更新一个学生的总学分
    public void updateTc(String sno);
}
