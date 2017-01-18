package com.dy.base.web;

import com.dy.base.domain.GxwlSysResource;
import com.dy.base.service.GxwlSysResourceService;
import com.gdgxwl.orm.core.search.SearchFilter;
import com.gdgxwl.orm.core.search.SearchUtil;
import com.springmvc.core.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(value = "/resource")
public class GxwlSysResourceController {

	@Autowired
	private GxwlSysResourceService resourceService;

	@RequestMapping(value = "/list")
	public String toList() {
		return "base/resource/resource";
	}


	// 加载资源
	@RequestMapping(value = "/get/{id}")
	public String getGxwlSysResourceById(@PathVariable Integer id,Model model) throws Exception {

		model.addAttribute("result",resourceService.doSelect(id));

		return "jsonView";
	}

	// 保存资源
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveGxwlSysResource(GxwlSysResource resource,Model model) throws Exception {
		ResultMsg msg = new ResultMsg(resourceService.doSave(resource));
		model.addAttribute("result",msg);
		return "jsonView";
	}


	// 获取菜单
	@RequestMapping(value = "/getMenu", method = RequestMethod.POST)
	public String getMenu(HttpServletRequest request,Model model) throws Exception {
		ResultMsg msg = new ResultMsg(resourceService.doSearch(SearchUtil.getSpecification(GxwlSysResource.class,request),SearchUtil.getSort("id_desc")));
		model.addAttribute("result",msg);
		return "jsonView";
	}


	// 删除
	@RequestMapping(value = "/del/{id}")
	public String delete(@PathVariable Integer id,Model model) throws Exception {
		resourceService.doDelete(id);
		model.addAttribute("result",new ResultMsg());
		return "jsonView";
	}

}
