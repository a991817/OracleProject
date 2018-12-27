package com.dgut.mapper;

import com.dgut.po.Class;

import java.util.List;

public interface ClassMapper {
    public List<Class> getAllClass(Class c);
    public void updateNumbers(String cno);
    public void insertAClass(Class c);
    //获得所有班级号
    public List<String> getAllCno();
    public Class getClassByCno(String cno);
    //更新班级
    public void updateClassName(Class c);
}
