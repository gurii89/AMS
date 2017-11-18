package com.cafe24.guribyn.room;
public class Room {
	private String roomCode;
	private String roomTypeCode;
	private String eId;
	private String roomName;
	private String roomDate;
	private String roomSize;
	private String cateCode;
	private int booCode;
	public int getBooCode() {
		return booCode;
	}
	public void setBooCode(int booCode) {
		this.booCode = booCode;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomDate() {
		return roomDate;
	}
	public void setRoomDate(String roomDate) {
		this.roomDate = roomDate;
	}
	public String getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}
	@Override
	public String toString() {
		return "Room [roomCode=" + roomCode + ", roomTypeCode=" + roomTypeCode + ", eId=" + eId + ", roomName="
				+ roomName + ", roomDate=" + roomDate + ", roomSize=" + roomSize + ", cateCode=" + cateCode
				+ ", booCode=" + booCode + "]";
	}

}
