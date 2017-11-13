package com.cafe24.guribyn.login;
public class Login {
	private int lCode;
	private String eId;
	private String ePw;
	private String eName;
	private String eDepartment;
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
	public String getePw() {
		return ePw;
	}
	public void setePw(String ePw) {
		this.ePw = ePw;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String geteDepartment() {
		return eDepartment;
	}
	public void seteDepartment(String eDepartment) {
		this.eDepartment = eDepartment;
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
		return "Login [lCode=" + lCode + ", eId=" + eId + ", ePw=" + ePw + ", eName=" + eName + ", eDepartment=" + eDepartment
				+ ", lDate=" + lDate + ", lCheack=" + lCheack + ", lIp=" + lIp + "]";
	}

}
