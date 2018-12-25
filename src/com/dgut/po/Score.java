package com.dgut.po;

public class Score {
    //课程编号
    private String cno;
    //学号
    private String sno;
    //分数
    private int score;

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Score{" +
                "cno='" + cno + '\'' +
                ", sno='" + sno + '\'' +
                ", score=" + score +
                '}';
    }


}
