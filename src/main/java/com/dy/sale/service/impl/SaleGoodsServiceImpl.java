package com.dy.sale.service.impl;

import com.dy.sale.domain.SaleGoods;
import com.dy.sale.domain.SaleGoodsType;
import com.dy.sale.repository.SaleGoodsDao;
import com.dy.sale.repository.SaleGoodsTypeDao;
import com.dy.sale.service.SaleGoodsService;
import com.dy.sale.service.SaleGoodsTypeService;
import com.gdgxwl.orm.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
@Service("saleGoodsService")
public class SaleGoodsServiceImpl extends BaseServiceImpl<SaleGoodsDao, SaleGoods,String> implements SaleGoodsService {

    @Autowired
    private SaleGoodsDao saleGoodsDao;

    @Autowired
    public SaleGoodsServiceImpl(SaleGoodsDao saleGoodsDao) {
        super(saleGoodsDao);
    }

}
