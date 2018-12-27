package com.dgut.service.Impl;

import com.dgut.po.Class;

import java.util.List;

public interface ClassService {
    public List<Class> getAllClass(Class c);
    public void insertAClass(String cno,String cname);
    public Class getClassByCno(String cno);
}
