package com.cafe24.guribyn.keep;

import java.sql.Date;

public class Keep {

	private int kCode;
	private String cateCode;
	private String e_id;
	private String kName;
	private Date kDatetime;
	private String kSite;
	private String kMemo;
	public int getkCode() {
		return kCode;
	}
	public void setkCode(int kCode) {
		this.kCode = kCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getkName() {
		return kName;
	}
	public void setkName(String kName) {
		this.kName = kName;
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
		return "Keep [kCode=" + kCode + ", cateCode=" + cateCode + ", e_id=" + e_id + ", kName=" + kName
				+ ", kDatetime=" + kDatetime + ", kSite=" + kSite + ", kMemo=" + kMemo + "]";
	}
}
