package com.cafe24.guribyn.booking.room;

public class BookingRoom {

	private int booRoomCode;
	private int booCode;
	private String roomTypeCode;
	private String eId;
	private String booRoomCondition;
	private int booRoomRate;
	public int getBooRoomCode() {
		return booRoomCode;
	}
	public void setBooRoomCode(int booRoomCode) {
		this.booRoomCode = booRoomCode;
	}
	public int getBooCode() {
		return booCode;
	}
	public void setBooCode(int booCode) {
		this.booCode = booCode;
	}
	public String getRoomTypeCode() {
		return roomTypeCode;
	}
	public void setRoomTypeCode(String roomTypeCode) {
		this.roomTypeCode = roomTypeCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getBooRoomCondition() {
		return booRoomCondition;
	}
	public void setBooRoomCondition(String booRoomCondition) {
		this.booRoomCondition = booRoomCondition;
	}
	public int getBooRoomRate() {
		return booRoomRate;
	}
	public void setBooRoomRate(int booRoomRate) {
		this.booRoomRate = booRoomRate;
	}
	@Override
	public String toString() {
		return "BookingRoom [booRoomCode=" + booRoomCode + ", booCode=" + booCode + ", roomTypeCode=" + roomTypeCode
				+ ", eId=" + eId + ", booRoomCondition=" + booRoomCondition + ", booRoomRate=" + booRoomRate + "]";
	}	
}
