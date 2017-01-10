package com.dy.sale.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class IndexController {

    @RequestMapping("/index")
    public String index(){

        return "sale/index";
    }


    @RequestMapping("/commodityType")
    public String commodityType(){

        return "sale/commodityType";
    }


}
