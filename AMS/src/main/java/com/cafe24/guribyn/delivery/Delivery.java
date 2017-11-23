package com.cafe24.guribyn.delivery;

import java.sql.Date;

public class Delivery {
	private String kCode;
	private String gCode;
	private String eId;
	private String dConame;
	private int dNumber;
	private String dDate;
	private String dDay;
	public String getkCode() {
		return kCode;
	}
	public void setkCode(String kCode) {
		this.kCode = kCode;
	}
	public String getgCode() {
		return gCode;
	}
	public void setgCode(String gCode) {
		this.gCode = gCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getdConame() {
		return dConame;
	}
	public void setdConame(String dConame) {
		this.dConame = dConame;
	}
	public int getdNumber() {
		return dNumber;
	}
	public void setdNumber(int dNumber) {
		this.dNumber = dNumber;
	}
	public String getdDate() {
		return dDate;
	}
	public void setdDate(String dDate) {
		this.dDate = dDate;
	}
	public String getdDay() {
		return dDay;
	}
	public void setdDay(String dDay) {
		this.dDay = dDay;
	}
	@Override
	public String toString() {
		return "Delivery [kCode=" + kCode + ", gCode=" + gCode + ", eId=" + eId + ", dConame=" + dConame + ", dNumber="
				+ dNumber + ", dDate=" + dDate + ", dDay=" + dDay + "]";
	}
}
