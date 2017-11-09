package com.cafe24.guribyn.notice;

public class Notice {
	private String nCode;
	private int eId;
	private String nDate;
	private String nMemo;
	public String getnCode() {
		return nCode;
	}
	public void setnCode(String nCode) {
		this.nCode = nCode;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public String getnDate() {
		return nDate;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public String getnMemo() {
		return nMemo;
	}
	public void setnMemo(String nMemo) {
		this.nMemo = nMemo;
	}
	@Override
	public String toString() {
		return "Notice [nCode=" + nCode + ", eId=" + eId + ", nDate=" + nDate + ", nMemo=" + nMemo + "]";
	}

}
