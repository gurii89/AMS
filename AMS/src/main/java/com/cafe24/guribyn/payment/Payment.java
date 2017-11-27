package com.cafe24.guribyn.payment;

public class Payment {

	private int pCode;
	private String pMethod;
	private int booCode;
	private String eId;
	private String pCondition;
	private String pDate;
	private int pRate;
	private String pMemo;
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
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
	public String getpCondition() {
		return pCondition;
	}
	public void setpCondition(String pCondition) {
		this.pCondition = pCondition;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public int getpRate() {
		return pRate;
	}
	public void setpRate(int pRate) {
		this.pRate = pRate;
	}
	public String getpMemo() {
		return pMemo;
	}
	public void setpMemo(String pMemo) {
		this.pMemo = pMemo;
	}
	public String getpMethod() {
		return pMethod;
	}
	public void setpMethod(String pMethod) {
		this.pMethod = pMethod;
	}
	@Override
	public String toString() {
		return "Payment [pCode=" + pCode + ", pMethod=" + pMethod + ", booCode=" + booCode + ", eId=" + eId
				+ ", pCondition=" + pCondition + ", pDate=" + pDate + ", pRate=" + pRate + ", pMemo=" + pMemo + "]";
	}
}
