package com.dy.sale.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class IndexController {


    @RequestMapping("/")
    public String index(){

        return "sale/index";
    }

}
