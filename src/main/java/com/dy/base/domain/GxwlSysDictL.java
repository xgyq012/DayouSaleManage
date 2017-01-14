package com.dy.base.domain;

import com.dy.base.core.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;


@Entity
@Table(name = "GXWL_SYS_DICT_L")
public class GxwlSysDictL extends BaseEntity {

	private static final long serialVersionUID = 8569801991390469271L;

	/**
	 * 数据字典ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DICT_ID", nullable = false)
	private Integer dictId;

	/**
	 * 数据字典类型,
	 */
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "DICT_TYPE_ID")
	private GxwlSysDictH gxwlSysDictH;

	/**
	 * 数据字典名称
	 */
	@Column(name = "DICT_NAME")
	private String dictName;

	/**
	 * 数据字典编码
	 */
	@Column(name = "DICT_CODE")
	private String dictCode;

	/**
	 * 序号
	 */
	@Column(name = "SEQ")
	private Integer seq;

	/**
	 * 是否显示
	 */
	@Column(name = "IS_DISPLAY")
	private String isDisplay;
	
	/**
	 * 备注
	 */
	@Column(name = "REMARK")
	private String remark;


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Integer getDictId() {
		return dictId;
	}

	public void setDictId(Integer dictId) {
		this.dictId = dictId;
	}

	public GxwlSysDictH getGxwlSysDictH() {
		return gxwlSysDictH;
	}

	public void setGxwlSysDictH(GxwlSysDictH gxwlSysDictH) {
		this.gxwlSysDictH = gxwlSysDictH;
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public String getDictCode() {
		return dictCode;
	}

	public void setDictCode(String dictCode) {
		this.dictCode = dictCode;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dictId == null) ? 0 : dictId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GxwlSysDictL other = (GxwlSysDictL) obj;
		if (dictId == null) {
			if (other.dictId != null)
				return false;
		} else if (!dictId.equals(other.dictId))
			return false;
		return true;
	}




}
