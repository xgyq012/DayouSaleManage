package com.dy.sale.domain;

import com.dy.base.core.BaseEntity;

import javax.persistence.*;

@Entity
@Table(name = "SALE_GOODS_TYPE")
public class SaleGoodsType extends BaseEntity {

	private static final long serialVersionUID = -1169669951017592443L;

	/**
	 * 资源ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TYPE_ID")
	private Integer typeId;

	/**
	 * 资源编码
	 */
	@Column(name = "TYPE_CODE")
	private String typeCode;

	/**
	 * 资源名称
	 */
	@Column(name = "TYPE_NAME")
	private String typeName;


	/**
	 * 父资源
	 */
	@Column(name = "PARENT_TYPE_ID")
	private Integer parentTypeId;


	/**
	 * 显示顺序
	 */
	@Column(name = "SEQ")
	private Integer seq;



	/**
	 * 全路径
	 */
	@Column(name = "FULLPATH")
	private String fullpath;
	

	/**
	 * 是否有效
	 */
	@Column(name = "ENABLE")
	private String enable;
	

	/**
	 * 资源说明
	 */
	@Column(name = "REMARK")
	private String remark;


	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getParentTypeId() {
		return parentTypeId;
	}

	public void setParentTypeId(Integer parentTypeId) {
		this.parentTypeId = parentTypeId;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getFullpath() {
		return fullpath;
	}

	public void setFullpath(String fullpath) {
		this.fullpath = fullpath;
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
