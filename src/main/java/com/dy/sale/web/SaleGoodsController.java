package com.dy.sale.web;

import com.dy.sale.domain.SaleGoods;
import com.dy.sale.service.SaleGoodsService;
import com.gdgxwl.orm.core.search.SearchUtil;
import com.springmvc.core.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


@Controller
@RequestMapping("/goods")
public class SaleGoodsController {

    @Autowired
    private SaleGoodsService saleGoodsService;

    @RequestMapping("/list")
    private String toPage(){

        return "sale/goods/goodsList";
    }


    @RequestMapping("/search")
    private String list(HttpServletRequest request, Model model) throws Exception {

        ResultMsg msg = new ResultMsg(saleGoodsService.doSearch(
                SearchUtil.getSpecification(SaleGoods.class, request),
                SearchUtil.getPageableWithOrderBy(request, "goodsId_DESC")));

        model.addAttribute("result",msg);

        return "jsonView";
    }

}
