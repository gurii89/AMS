package com.cafe24.guribyn.login;
public class LoginHistory {
	private int lCode;
	private String eId;
	private String lDate;
	private String lCheack;
	private String lIp;
	public int getlCode() {
		return lCode;
	}
	public void setlCode(int lCode) {
		this.lCode = lCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getlDate() {
		return lDate;
	}
	public void setlDate(String lDate) {
		this.lDate = lDate;
	}
	public String getlCheack() {
		return lCheack;
	}
	public void setlCheack(String lCheack) {
		this.lCheack = lCheack;
	}
	public String getlIp() {
		return lIp;
	}
	public void setlIp(String lIp) {
		this.lIp = lIp;
	}
	@Override
	public String toString() {
		return "LoginHistory [lCode=" + lCode + ", eId=" + eId + ", lDate=" + lDate + ", lCheack=" + lCheack + ", lIp="
				+ lIp + "]";
	}
	
}
