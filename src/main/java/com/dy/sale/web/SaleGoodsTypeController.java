package com.dy.sale.web;

import com.dy.base.domain.GxwlSysResource;
import com.dy.sale.domain.SaleGoodsType;
import com.dy.sale.service.SaleGoodsTypeService;
import com.gdgxwl.orm.core.search.SearchUtil;
import com.springmvc.core.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/saleGoodsType")
public class SaleGoodsTypeController {



    @Autowired
    private SaleGoodsTypeService saleGoodsTypeService;

    @RequestMapping(value = "/list")
    public String toList() {
        return "sale/goods/goodsType";
    }

    // 获取菜单
    @RequestMapping(value = "/getTypes", method = RequestMethod.POST)
    public String getTypes(HttpServletRequest request,Model model) throws Exception {
        ResultMsg msg = new ResultMsg(saleGoodsTypeService.doSearch(SearchUtil.getSpecification(SaleGoodsType.class,request),SearchUtil.getSort("typeId_desc")));
        model.addAttribute("result",msg);
        return "jsonView";
    }

    //获取
    @RequestMapping(value = "/get/{id}")
    public String getType(@PathVariable Integer id, Model model) throws Exception {

        model.addAttribute("result",saleGoodsTypeService.doSelect(id));

        return "jsonView";
    }

    // 保存
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(SaleGoodsType saleGoodsType, Model model) throws Exception {
        ResultMsg msg = new ResultMsg(saleGoodsTypeService.doSave(saleGoodsType));
        model.addAttribute("result",msg);
        return "jsonView";
    }


    // 删除
    @RequestMapping(value = "/del/{id}")
    public String delete(@PathVariable Integer id,Model model) throws Exception {
        saleGoodsTypeService.doDelete(id);
        model.addAttribute("result",new ResultMsg());
        return "jsonView";
    }


}
