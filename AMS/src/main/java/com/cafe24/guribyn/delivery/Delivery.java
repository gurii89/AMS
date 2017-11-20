package com.cafe24.guribyn.delivery;

import java.sql.Date;

public class Delivery {
	private String dCode;
	private String kCode;
	private String eId;
	private String dConame;
	private int dNumber;
	private Date dDate;
	public String getdCode() {
		return dCode;
	}
	public void setdCode(String dCode) {
		this.dCode = dCode;
	}
	public String getkCode() {
		return kCode;
	}
	public void setkCode(String kCode) {
		this.kCode = kCode;
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
	public Date getdDate() {
		return dDate;
	}
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	@Override
	public String toString() {
		return "Delivery [dCode=" + dCode + ", kCode=" + kCode + ", eId=" + eId + ", dConame=" + dConame + ", dNumber="
				+ dNumber + ", dDate=" + dDate + "]";
	}
	
	
}
