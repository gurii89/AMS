package com.cafe24.guribyn.cate;

import java.sql.Date;

public class Cate {
	private int cateCode;
	private String eId;
	private String cateLarge;
	private String cateSmall;
	private String cateName;
	private Date cateDate;
	public int getCateCode() {
		return cateCode;
	}
	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getCateLarge() {
		return cateLarge;
	}
	public void setCateLarge(String cateLarge) {
		this.cateLarge = cateLarge;
	}
	public String getCateSmall() {
		return cateSmall;
	}
	public void setCateSmall(String cateSmall) {
		this.cateSmall = cateSmall;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public Date getCateDate() {
		return cateDate;
	}
	public void setCateDate(Date cateDate) {
		this.cateDate = cateDate;
	}
	@Override
	public String toString() {
		return "Cate [cateCode=" + cateCode + ", eId=" + eId + ", cateLarge=" + cateLarge + ", cateSmall=" + cateSmall
				+ ", cateName=" + cateName + ", cateDate=" + cateDate + "]";
	}	
}
