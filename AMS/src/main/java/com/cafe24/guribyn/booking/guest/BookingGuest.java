package com.cafe24.guribyn.booking.guest;

public class BookingGuest {

	private int booCode;
	private int gCode;
	public int getBooCode() {
		return booCode;
	}
	public void setBooCode(int booCode) {
		this.booCode = booCode;
	}
	public int getgCode() {
		return gCode;
	}
	public void setgCode(int gCode) {
		this.gCode = gCode;
	}
	@Override
	public String toString() {
		return "BookingGuest [booCode=" + booCode + ", gCode=" + gCode + "]";
	}	
}
