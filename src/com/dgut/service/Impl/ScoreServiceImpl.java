package com.dgut.service.Impl;

import com.dgut.mapper.ScoreMapper;
import com.dgut.po.Score;
import com.dgut.po.ScoreExtend;
import com.dgut.vo.ScoreVo;
import com.dgut.vo.UpdateTcVo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class ScoreServiceImpl implements ScoreService{
    @Autowired
    ScoreMapper scoreMapper;

    @Override
    public List<ScoreExtend> getScoreList(ScoreExtend scoreExtend) {
        return scoreMapper.scoreList(scoreExtend);
    }
    @Override
    public ScoreExtend getScoreInfoByCS(ScoreExtend scoreExtend) {
        return scoreMapper.getScoreInfoByCS(scoreExtend);
    }
    @Override
    public void updateScoreByCS(ScoreExtend scoreExtend) {
        int count = scoreMapper.updateScoreByCS(scoreExtend);
        //计算总分
        updateAllTC();
        System.out.println("更新了"+count+"行------score");
    }
    @Override
    public void selectCourse(Score score) {
        scoreMapper.selectCourse(score);
    }
    @Override
    public List<ScoreVo> getScoreInfoBySno(String sno) {
       return scoreMapper.getScoreInfoBySno(sno);
    }

    @Override
    public void updateAllTC() {
        //找到所有学号
        List<String> snos = scoreMapper.selectAllSno();
        for (String sno:snos){
            updateTc(sno);
        }
    }

    @Override
    public void updateTc(String sno) {
        int sum = 0;
        //根据学号获取这个同学的所有分数
        List<ScoreVo> scores = scoreMapper.selectAllScore(sno);
        for(ScoreVo scoreVo:scores){
            //若分数及格
            if(scoreVo.getScore()>=60){
                sum+=Integer.parseInt(scoreVo.getCredit());
            }
        }
        UpdateTcVo updateTcVo = new UpdateTcVo();
        updateTcVo.setSno(sno);
        updateTcVo.setTc(String.valueOf(sum));
        scoreMapper.updateTC(updateTcVo);
    }

    @Override
    public boolean isFk(String cno) {
        if(scoreMapper.selectScoreByCno(cno).size()>0){
            return true;
        }
        return false;
    }

}
