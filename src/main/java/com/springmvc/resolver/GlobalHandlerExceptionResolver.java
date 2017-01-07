package com.springmvc.resolver;

import com.springmvc.core.ResultMsg;
import com.springmvc.exception.SuperException;
import org.springframework.beans.BeanUtils;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局自定义异常
 */

public class GlobalHandlerExceptionResolver implements HandlerExceptionResolver {



    @Override
    public ModelAndView resolveException(HttpServletRequest request,
                                         HttpServletResponse response, Object handler, Exception exception) {

            ModelAndView modelAndView = new ModelAndView("jsonView");

           if(exception instanceof SuperException){
               SuperException supers = (SuperException) exception;
               modelAndView.getModel().put("result",supers.getResultMsg());
           }else{
               ResultMsg msg = new ResultMsg("系统出错","-1");
               modelAndView.getModel().put("result",msg);
           }

        return modelAndView;
    }

}
