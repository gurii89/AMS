package com.cafe24.guribyn.extra;

public class Extra {
	private String extraCode;
	private String cateCode;
	private String eId;
	private String extraName;
	private int extraRate;
	private String extraDate;
	public String getExtraCode() {
		return extraCode;
	}
	public void setExtraCode(String extraCode) {
		this.extraCode = extraCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
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
	public String getExtraDate() {
		return extraDate;
	}
	public void setExtraDate(String extraDate) {
		this.extraDate = extraDate;
	}
	@Override
	public String toString() {
		return "Extra [extraCode=" + extraCode + ", cateCode=" + cateCode + ", eId=" + eId + ", extraName=" + extraName
				+ ", extraRate=" + extraRate + ", extraDate=" + extraDate + "]";
	}
	
}
