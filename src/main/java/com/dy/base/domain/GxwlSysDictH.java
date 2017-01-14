package com.dy.base.domain;

import com.dy.base.core.BaseEntity;
import org.apache.commons.lang3.StringUtils;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "GXWL_SYS_DICT_H")
public class GxwlSysDictH extends BaseEntity {

	private static final long serialVersionUID = 1314235515011976689L;

	/**
	 * 数据字典类型ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DICT_TYPE_ID")
	private Integer dictTypeId;

	/**
	 * 数据字典类型名称
	 */
	@Column(name = "DICT_TYPE_NAME")
	private String dictTypeName;

	/**
	 * 数据字典类型编码
	 */
	@Column(name = "DICT_TYPE_CODE")
	private String dictTypeCode;

	/**
	 * 是否有效
	 */
	@Column(name = "ENABLE")
	private String enable;
	
	/**
	 * 备注
	 */
	@Column(name = "REMARK")
	private String remark;

	/**
	 * 数据字典
	 */
	@OneToMany(cascade = {CascadeType.REMOVE }, mappedBy = "gxwlSysDictH")
	private List<GxwlSysDictL> gxwlSysDictLs;



	public Integer getDictTypeId() {
		return dictTypeId;
	}

	public void setDictTypeId(Integer dictTypeId) {
		this.dictTypeId = dictTypeId;
	}

	public String getDictTypeName() {
		return dictTypeName;
	}

	public void setDictTypeName(String dictTypeName) {
		this.dictTypeName = dictTypeName;
	}

	public String getDictTypeCode() {
		return dictTypeCode;
	}

	public void setDictTypeCode(String dictTypeCode) {
		this.dictTypeCode = dictTypeCode;
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

	public List<GxwlSysDictL> getGxwlSysDictLs() {
		return gxwlSysDictLs;
	}

	public void setGxwlSysDictLs(List<GxwlSysDictL> gxwlSysDictLs) {
		this.gxwlSysDictLs = gxwlSysDictLs;
	}
}
