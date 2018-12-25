package com.dgut.mapper;

import com.dgut.po.Score;
import com.dgut.po.ScoreExtend;
import com.dgut.vo.ScoreVo;
import com.dgut.vo.UpdateTcVo;

import java.util.List;

public interface ScoreMapper {
    //查询所有课程成绩
    public List<ScoreExtend> scoreList(ScoreExtend scoreExtend);
    //根据学号和课程号查询一条记录,CS:表示cno和sno
    public ScoreExtend getScoreInfoByCS(ScoreExtend scoreExtend);
    //根据学号和课程号更新一条记录
    public int updateScoreByCS(ScoreExtend scoreExtend);
    //选课：即插入课程号和学号但是没有成绩，成绩默认为0
    public void selectCourse(Score score);
    //根据学号查询所有选了课的信息(包括成绩)
    public List<ScoreVo> getScoreInfoBySno(String sno);
    //更新总学分TC
    public void updateTC(UpdateTcVo updateTcVo);
    //根据学号查询所有成绩
    public List<ScoreVo> selectAllScore(String sno);
    //查询所有学号
    public List<String> selectAllSno();
}
