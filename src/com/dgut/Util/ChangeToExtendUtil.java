package com.dgut.Util;

import com.dgut.po.Course;
import com.dgut.po.CourseExtend;

public class ChangeToExtendUtil {
    public static CourseExtend change(Course course){
        CourseExtend ce = new CourseExtend();
        ce.setCname(course.getCname());
        ce.setCno(course.getCno());
        ce.setCredit(course.getCredit());
        ce.setTno(course.getTno());
        return ce;
    }
}
