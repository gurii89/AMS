package com.cafe24.guribyn.check;

public class InOut {
	
	private int booCode;
	private String booCondition;
	private String booDate;
	private String roomCode;
	private String inDate;
	private String outDate;
	private String inId;
	private String outId;
	public int getBooCode() {
		return booCode;
	}
	public void setBooCode(int booCode) {
		this.booCode = booCode;
	}
	public String getBooCondition() {
		return booCondition;
	}
	public void setBooCondition(String booCondition) {
		this.booCondition = booCondition;
	}
	public String getBooDate() {
		return booDate;
	}
	public void setBooDate(String booDate) {
		this.booDate = booDate;
	}
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	public String getOutDate() {
		return outDate;
	}
	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}
	public String getInId() {
		return inId;
	}
	public void setInId(String inId) {
		this.inId = inId;
	}
	public String getOutId() {
		return outId;
	}
	public void setOutId(String outId) {
		this.outId = outId;
	}
	@Override
	public String toString() {
		return "CheckInOut [booCode=" + booCode + ", booCondition=" + booCondition + ", booDate=" + booDate
				+ ", roomCode=" + roomCode + ", inDate=" + inDate + ", outDate=" + outDate + ", inId=" + inId
				+ ", outId=" + outId + "]";
	}
}
