package com.dgut.exception;

import org.omg.CORBA.UserException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GlobalExceptionResolver implements HandlerExceptionResolver {

    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response,
                                         Object handler,
                                         Exception ex) {
        GlobalException globalException = null;

        //如果是自定义异常则跳转到异常界面
        if(ex instanceof GlobalException){
            globalException = (GlobalException)ex;
        }else{
            //打印出来
            ex.printStackTrace();
            globalException = new GlobalException("未知错误");
        }
        String message = globalException.getMessage();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message",message);
        modelAndView.setViewName("error");
        return modelAndView;
    }




}
