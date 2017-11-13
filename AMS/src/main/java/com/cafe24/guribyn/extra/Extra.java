package com.cafe24.guribyn.extra;

import java.sql.Date;

public class Extra {
	private int extraCode;
	private int cateCode;
	private int eId;
	private String extraName;
	private int extraRate;
	private Date extraDate;
	public int getExtraCode() {
		return extraCode;
	}
	public void setExtraCode(int extraCode) {
		this.extraCode = extraCode;
	}
	public int getCateCode() {
		return cateCode;
	}
	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public String getExtraName() {
		return extraName;
	}
	public void setExtraName(String extraName) {
		this.extraName = extraName;
	}
	public int getExtraRate() {
		return extraRate;
	}
	public void setExtraRate(int extraRate) {
		this.extraRate = extraRate;
	}
	public Date getExtraDate() {
		return extraDate;
	}
	public void setExtraDate(Date extraDate) {
		this.extraDate = extraDate;
	}
	@Override
	public String toString() {
		return "extra [extraCode=" + extraCode + ", cateCode=" + cateCode + ", eId=" + eId + ", extraName=" + extraName
				+ ", extraRate=" + extraRate + ", extraDate=" + extraDate + "]";
	}
}
