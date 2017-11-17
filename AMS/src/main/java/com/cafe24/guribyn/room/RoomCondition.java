package com.cafe24.guribyn.room;
public class RoomCondition {
	private String rConCode;
	private String cateCode;
	private String eId;
	private String roomCode;
	private String rConDate;
	public String getrConCode() {
		return rConCode;
	}
	public void setrConCode(String rConCode) {
		this.rConCode = rConCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}
	public String getrConDate() {
		return rConDate;
	}
	public void setrConDate(String rConDate) {
		this.rConDate = rConDate;
	}
	@Override
	public String toString() {
		return "RoomCondition [rConCode=" + rConCode + ", cateCode=" + cateCode + ", eId=" + eId + ", roomCode="
				+ roomCode + ", rConDate=" + rConDate + "]";
	}
}
