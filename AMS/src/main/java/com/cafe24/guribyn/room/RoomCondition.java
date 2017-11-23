package com.cafe24.guribyn.room;
public class RoomCondition {
	private String roomConCode;
	private String eId;
	private String roomCode;
	private String roomConCondition;
	private String roomConDate;
	public String getRoomConCode() {
		return roomConCode;
	}
	public void setRoomConCode(String roomConCode) {
		this.roomConCode = roomConCode;
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
	public String getRoomConCondition() {
		return roomConCondition;
	}
	public void setRoomConCondition(String roomConCondition) {
		this.roomConCondition = roomConCondition;
	}
	public String getRoomConDate() {
		return roomConDate;
	}
	public void setRoomConDate(String roomConDate) {
		this.roomConDate = roomConDate;
	}
	@Override
	public String toString() {
		return "RoomCondition [roomConCode=" + roomConCode + ", eId=" + eId + ", roomCode=" + roomCode
				+ ", roomConCondition=" + roomConCondition + ", roomConDate=" + roomConDate + "]";
	}
}
