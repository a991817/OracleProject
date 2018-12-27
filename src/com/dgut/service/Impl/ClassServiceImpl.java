package com.dgut.service.Impl;

import com.dgut.Util.StringUtil;
import com.dgut.mapper.ClassMapper;
import com.dgut.po.Class;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassMapper classMapper;
    @Override
    public List<Class> getAllClass(Class c) {
        return classMapper.getAllClass(c);
    }

    @Override
    public void insertAClass(String cno,String cname) {
        //表示更新
        if(cno!=null) {
            Class c = new Class();
            c.setCno(cno);
            c.setCname(cname);
            classMapper.updateClassName(c);
            //表示
        }else{
            List<String> clnos = classMapper.getAllCno();
            String clno = StringUtil.getMaxClon(clnos);
            Class c = new Class();
            c.setCname(cname);
            c.setCno(clno);
            classMapper.insertAClass(c);
        }
    }

    @Override
    public Class getClassByCno(String cno) {
        return classMapper.getClassByCno(cno);
    }
}
