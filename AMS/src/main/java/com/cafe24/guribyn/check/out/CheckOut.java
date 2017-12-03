package com.cafe24.guribyn.check.out;

public class CheckOut {

	private int booCode;
	private String eId;
	private String outDate;
	public int getBooCode() {
		return booCode;
	}
	public void setBooCode(int booCode) {
		this.booCode = booCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getOutDate() {
		return outDate;
	}
	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	@Override
	public String toString() {
		return "CheckOut [booCode=" + booCode + ", eId=" + eId + ", outDate=" + outDate + "]";
	}	
}
