package com.springmvc.resolver;

import com.springmvc.exception.SuperException;
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

            ModelAndView modelAndView = null;

           if(exception instanceof SuperException){
               SuperException supes = (SuperException) exception;
               modelAndView = new ModelAndView("jsonView");
           }

        return modelAndView;
    }

}
