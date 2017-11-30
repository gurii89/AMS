package com.cafe24.guribyn.keep;

import java.sql.Date;

public class Keep {

	private int kCode;
	private int	eId;
	private String kName;
	private String kCondition;
	private Date kDate;
	private String kSite;
	private String kMemo;
	
	public int getkCode() {
		return kCode;
	}
	public void setkCode(int kCode) {
		this.kCode = kCode;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public String getkName() {
		return kName;
	}
	public void setkName(String kName) {
		this.kName = kName;
	}
	public String getkCondition() {
		return kCondition;
	}
	public void setkCondition(String kCondition) {
		this.kCondition = kCondition;
	}
	public Date getkDate() {
		return kDate;
	}
	public void setkDatetime(Date kDate) {
		this.kDate = kDate;
	}
	public String getkSite() {
		return kSite;
	}
	public void setkSite(String kSite) {
		this.kSite = kSite;
	}
	public String getkMemo() {
		return kMemo;
	}
	public void setkMemo(String kMemo) {
		this.kMemo = kMemo;
	}
	@Override
	public String toString() {
		return "Keep [kCode=" + kCode + ", eId=" + eId + ", kName=" + kName + ", kCondition=" + kCondition
				+ ", kDatetime=" + kDate + ", kSite=" + kSite + ", kMemo=" + kMemo + "]";
	}
}
