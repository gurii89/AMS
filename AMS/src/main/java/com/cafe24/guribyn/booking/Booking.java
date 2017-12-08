package com.cafe24.guribyn.booking;

public class Booking {
 
    private int booCode;
    private String eId;
    private String booDate; 
    private String booIn;
    private String booOut;
    private int booCount;
    private String booPath;
    private String booMemo;
    private String booCondition;
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
	public String getBooDate() {
		return booDate;
	}
	public void setBooDate(String booDate) {
		this.booDate = booDate;
	}
	public String getBooIn() {
		return booIn;
	}
	public void setBooIn(String booIn) {
		this.booIn = booIn;
	}
	public String getBooOut() {
		return booOut;
	}
	public void setBooOut(String booOut) {
		this.booOut = booOut;
	}
	public int getBooCount() {
		return booCount;
	}
	public void setBooCount(int booCount) {
		this.booCount = booCount;
	}
	public String getBooPath() {
		return booPath;
	}
	public void setBooPath(String booPath) {
		this.booPath = booPath;
	}
	public String getBooMemo() {
		return booMemo;
	}
	public void setBooMemo(String booMemo) {
		this.booMemo = booMemo;
	}
	public String getBooCondition() {
		return booCondition;
	}
	public void setBooCondition(String booCondition) {
		this.booCondition = booCondition;
	}
	@Override
	public String toString() {
		return "Booking [booCode=" + booCode + ", eId=" + eId + ", booDate=" + booDate + ", booIn=" + booIn
				+ ", booOut=" + booOut + ", booCount=" + booCount + ", booPath=" + booPath + ", booMemo=" + booMemo
				+ ", booCondition=" + booCondition + "]";
	}
	
}
