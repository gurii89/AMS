package com.cafe24.guribyn.keep;

import java.sql.Date;

public class Keep {

	private int kCode;
	private int	eId;
	private String kName;
	private String kCondition;
	private Date kDatetime;
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
	public Date getkDatetime() {
		return kDatetime;
	}
	public void setkDatetime(Date kDatetime) {
		this.kDatetime = kDatetime;
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
				+ ", kDatetime=" + kDatetime + ", kSite=" + kSite + ", kMemo=" + kMemo + "]";
	}
}
