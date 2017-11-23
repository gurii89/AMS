package com.cafe24.guribyn.booking.extra;

public class BookingExtra {

	private int booExtraCode;
	private int booCode;
	private String extraCode;
	private String eId;
	private String booExtraCondition;
	private String booExtraDate;
	private int booExtraRate;
	public int getBooExtraCode() {
		return booExtraCode;
	}
	public void setBooExtraCode(int booExtraCode) {
		this.booExtraCode = booExtraCode;
	}
	public int getBooCode() {
		return booCode;
	}
	public void setBooCode(int booCode) {
		this.booCode = booCode;
	}
	public String getExtraCode() {
		return extraCode;
	}
	public void setExtraCode(String extraCode) {
		this.extraCode = extraCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getBooExtraCondition() {
		return booExtraCondition;
	}
	public void setBooExtraCondition(String booExtraCondition) {
		this.booExtraCondition = booExtraCondition;
	}
	public String getBooExtraDate() {
		return booExtraDate;
	}
	public void setBooExtraDate(String booExtraDate) {
		this.booExtraDate = booExtraDate;
	}
	public int getBooExtraRate() {
		return booExtraRate;
	}
	public void setBooExtraRate(int booExtraRate) {
		this.booExtraRate = booExtraRate;
	}
	@Override
	public String toString() {
		return "BookingExtra [booExtraCode=" + booExtraCode + ", booCode=" + booCode + ", extraCode=" + extraCode
				+ ", eId=" + eId + ", booExtraCondition=" + booExtraCondition + ", booExtraDate=" + booExtraDate
				+ ", booExtraRate=" + booExtraRate + "]";
	}	
}
