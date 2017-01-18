package com.dy.sale.service.impl;


import com.dy.base.domain.GxwlSysResource;
import com.dy.base.repository.GxwlSysResourceDao;
import com.dy.sale.domain.SaleGoodsType;
import com.dy.sale.repository.SaleGoodsTypeDao;
import com.dy.sale.service.SaleGoodsTypeService;
import com.gdgxwl.orm.service.impl.BaseServiceImpl;
import com.springmvc.exception.OperationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service(value = "saleGoodsTypeService")
@Transactional(readOnly = true)
public class SaleGoodsTypeServiceImpl extends BaseServiceImpl<SaleGoodsTypeDao, SaleGoodsType,Integer> implements SaleGoodsTypeService {

    @Autowired
    private SaleGoodsTypeDao saleGoodsTypeDao;

    @Autowired
    public SaleGoodsTypeServiceImpl(SaleGoodsTypeDao saleGoodsTypeDao) {
        super(saleGoodsTypeDao);
    }


    @Transactional
    @Override
    public void doDelete(Integer id) throws Exception {
        Map<String,Object> map =  new HashMap<String,Object>();
        map.put("parentTypeId_EQ",id);
        List<SaleGoodsType> list = saleGoodsTypeDao.findByAttr(map);
        if(list.size()>0){
            throw new OperationException("存在关联的子节点，无法删除","-1");
        }else{
            super.doDelete(id);
        }
    }


    @Override
    @Transactional
    public SaleGoodsType doSave(SaleGoodsType entity) throws Exception {

        SaleGoodsType model = super.doSave(entity);
        model.setFullpath(getFullpath(model));

        return model;
    }

    private String getFullpath(SaleGoodsType resource) {
        if (resource.getParentTypeId() != null) {
            SaleGoodsType rp =  saleGoodsTypeDao.findOne(resource.getParentTypeId());
            return rp.getFullpath()
                    + resource.getTypeId() + ".";
        }
        return resource.getTypeId() + ".";
    }

}
