package com.dy.sale.web;

import com.dy.sale.domain.SaleGoods;
import com.dy.sale.domain.SaleGoodsType;
import com.dy.sale.service.SaleGoodsService;
import com.gdgxwl.orm.core.search.SearchUtil;
import com.springmvc.core.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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


    @RequestMapping("/add")
    private String add(@RequestParam(value = "goodsId",defaultValue = "") String goodsId , Model model){

        model.addAttribute("goodsId",goodsId);

        return "sale/goods/goods";
    }




    // 保存
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(SaleGoods saleGoods, Model model) throws Exception {
        ResultMsg msg = new ResultMsg(saleGoodsService.doSave(saleGoods));
        model.addAttribute("result",msg);
        return "jsonView";
    }


    //获取
    @RequestMapping(value = "/get/{id}")
    public String getType(@PathVariable String id, Model model) throws Exception {

        model.addAttribute("result",saleGoodsService.doSelect(id));

        return "jsonView";
    }

    // 删除
    @RequestMapping(value = "/del/{id}")
    public String delete(@PathVariable String id,Model model) throws Exception {
        saleGoodsService.doDelete(id);
        model.addAttribute("result",new ResultMsg());
        return "jsonView";
    }


    @RequestMapping("/search")
    private String list(HttpServletRequest request, Model model) throws Exception {

        Page<SaleGoods> page = saleGoodsService.doSearch(
                SearchUtil.getSpecification(SaleGoods.class, request),
                SearchUtil.getPageableWithOrderBy(request, "goodsId_DESC"));

        ResultMsg msg = new ResultMsg(page);

        model.addAttribute("result",msg);

        return "jsonView";
    }

}
