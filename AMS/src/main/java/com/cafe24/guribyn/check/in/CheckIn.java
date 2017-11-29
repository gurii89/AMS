package com.cafe24.guribyn.check.in;

public class CheckIn {

	private int booRoomCode;
	private int roomCode;
	private String eId;
	private String inDate;
	public int getBooRoomCode() {
		return booRoomCode;
	}
	public void setBooRoomCode(int booRoomCode) {
		this.booRoomCode = booRoomCode;
	}
	public int getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	@Override
	public String toString() {
		return "CheckIn [booRoomCode=" + booRoomCode + ", roomCode=" + roomCode + ", eId=" + eId + ", inDate=" + inDate
				+ "]";
	}	
}
