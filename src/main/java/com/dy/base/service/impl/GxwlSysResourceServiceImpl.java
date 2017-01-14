package com.dy.base.service.impl;


import com.dy.base.domain.GxwlSysResource;
import com.dy.base.repository.GxwlSysResourceDao;
import com.dy.base.service.GxwlSysResourceService;
import com.gdgxwl.orm.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service(value = "gxwlSysResourceService")
@Transactional(readOnly = true)
public class GxwlSysResourceServiceImpl extends BaseServiceImpl<GxwlSysResourceDao,GxwlSysResource,Integer> implements GxwlSysResourceService {


    @Autowired
    public GxwlSysResourceServiceImpl(GxwlSysResourceDao gxwlSysResourceDao) {
        super(gxwlSysResourceDao);
    }


    @Transactional
    @Override
    public void doDelete(Integer integer) throws Exception {



        super.doDelete(integer);
    }
}
