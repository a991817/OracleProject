package com.dgut.Util;

import com.dgut.po.Course;
import com.dgut.po.Student;

import java.util.List;

public class StringUtil {
    public static Student deleteSpace(Student student){
        student.setSsex(student.getSsex().replace(" ", ""));
        if(student.getSno()!=null)
            student.setSno(student.getSno().replace(" ", ""));
        student.setSname(student.getSname().replace(" ", ""));
        student.setSpeciality(student.getSpeciality().replace(" ", ""));
        student.setSclass(student.getSclass().replace(" ", ""));
        return student;
    }
    public static Course deleteSpace(Course course){
        course.setCname(course.getCname().replace(" ", ""));
        if(course.getCno()!=null)
            course.setCno(course.getCno().replace(" ", ""));
        course.setCredit(course.getCredit().replace(" ", ""));
        course.setTno(course.getTno().replace(" ", ""));
        return course;
    }

    public static String getMaxCon(List<String> cnos){
        int max = 0;
        //找出最大的数
        for(String cno:cnos){
            cno = cno.substring(1);
            int cnoInt = Integer.parseInt(cno);
            if(max<cnoInt){
                max = cnoInt;
            }
        }
        String maxStr = String.valueOf(max+1);
        maxStr = "c"+maxStr;
        return maxStr;
    }

    public static Student changeStudentSex(Student student){
        if("1".equals(student.getSsex())){
            student.setSsex("男");
        }else if("2".equals(student.getSsex())){
            student.setSsex("女");
        }else if("0".equals(student.getSsex())){
            student.setSsex("");
        }
        return student;
    }
}
