package com.dy.sale.domain;

import com.dy.base.core.BaseEntity;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * 商品类
 * Created by hellow on 2017/1/18.
 */
@Table(name="SALE_GOODS")
@Entity
public class SaleGoods extends BaseEntity {


    /**
     * ID
     */
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @Column(name = "GOODS_ID")
    private String goodsId;


    /**
     * 类型
     */
    @Column(name = "GOODS_TYPE")
    private Integer goodsType;


    /**
     * 商品名称
     */
    @Column(name = "GOODS_NAME")
    private String goodsName;


    /**
     * 商品编号
     */
    @Column(name = "GOODS_CODE")
    private String goodsCode;


    /**
     * 零售价
     */
    @Column(name = "RETAIL_PRICE")
    private Double retailPrice;


    /**
     * 成本价
     */
    @Column(name = "COST_PRICE")
    private Double costPrice;


    /**
     * 计量单位
     */
    @Column(name = "UNITS")
    private String units;


    /**
     * 规格
     */
    @Column(name = "SPECIFICATION")
    private String specification;


    /**
     * 是否热销
     */
    @Column(name = "IS_HOT")
    private String isHot;


    /**
     * 是否支持打折
     */
    @Column(name = "IS_DISCOUNT")
    private String isDiscount;


    /**
     * 是否上架
     */
    @Column(name = "IS_PUT")
    private String isPut;


    /**
     * 默认折扣
     */
    @Column(name = "DEFAULT_DISCOUNT")
    private Double defaultDiscount;


    /**
     * 最低折扣
     */
    @Column(name = "LOWEST_DISCOUNT")
    private Double lowestDiscount;


    /**
     * 商品图片
     */
    @Column(name = "FILE_ID")
    private String fileId;


    /**
     * 库存
     */
    @Column(name = "INVENTORY_NUM")
    private Double inventoryNum;

    /**
     * 是否有效
     */
    @Column(name = "enable")
    private String enable;


    /**
     * 描述
     */
    @Column(name = "REMARK")
    private String remark;


    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(Integer goodsType) {
        this.goodsType = goodsType;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsCode() {
        return goodsCode;
    }

    public void setGoodsCode(String goodsCode) {
        this.goodsCode = goodsCode;
    }

    public Double getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(Double retailPrice) {
        this.retailPrice = retailPrice;
    }

    public Double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(Double costPrice) {
        this.costPrice = costPrice;
    }

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getIsHot() {
        return isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getIsDiscount() {
        return isDiscount;
    }

    public void setIsDiscount(String isDiscount) {
        this.isDiscount = isDiscount;
    }

    public String getIsPut() {
        return isPut;
    }

    public void setIsPut(String isPut) {
        this.isPut = isPut;
    }

    public Double getDefaultDiscount() {
        return defaultDiscount;
    }

    public void setDefaultDiscount(Double defaultDiscount) {
        this.defaultDiscount = defaultDiscount;
    }

    public Double getLowestDiscount() {
        return lowestDiscount;
    }

    public void setLowestDiscount(Double lowestDiscount) {
        this.lowestDiscount = lowestDiscount;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }

    public Double getInventoryNum() {
        return inventoryNum;
    }

    public void setInventoryNum(Double inventoryNum) {
        this.inventoryNum = inventoryNum;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
