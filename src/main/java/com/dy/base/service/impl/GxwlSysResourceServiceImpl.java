package com.dy.base.service.impl;


import com.dy.base.domain.GxwlSysResource;
import com.dy.base.repository.GxwlSysResourceDao;
import com.dy.base.service.GxwlSysResourceService;
import com.gdgxwl.orm.service.impl.BaseServiceImpl;
import com.springmvc.exception.OperationException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service(value = "gxwlSysResourceService")
@Transactional(readOnly = true)
public class GxwlSysResourceServiceImpl extends BaseServiceImpl<GxwlSysResourceDao,GxwlSysResource,Integer> implements GxwlSysResourceService {

    @Autowired
    private GxwlSysResourceDao gxwlSysResourceDao;

    @Autowired
    public GxwlSysResourceServiceImpl(GxwlSysResourceDao gxwlSysResourceDao) {
        super(gxwlSysResourceDao);
    }


    @Transactional
    @Override
    public void doDelete(Integer id) throws Exception {
       Map<String,Object> map =  new HashMap<String,Object>();
       map.put("parentResourceId_EQ",id);
       List<GxwlSysResource> list = gxwlSysResourceDao.findByAttr(map);
        if(list.size()>0){
            throw new OperationException("存在关联的子节点，无法删除","-1");
        }else{
            super.doDelete(id);
        }
    }


    @Override
    @Transactional
    public GxwlSysResource doSave(GxwlSysResource entity) throws Exception {

        GxwlSysResource model = super.doSave(entity);
        model.setFullpath(getFullpath(model));

        return model;
    }

    private String getFullpath(GxwlSysResource resource) {
        if (resource.getParentResourceId() != null) {
            GxwlSysResource rp =  gxwlSysResourceDao.findOne(resource.getParentResourceId());
            return rp.getFullpath()
                    + resource.getId() + ".";
        }
        return resource.getId() + ".";
    }

}
