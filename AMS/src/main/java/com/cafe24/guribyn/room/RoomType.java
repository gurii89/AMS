package com.cafe24.guribyn.room;
public class RoomType {
	private int roomTypeCode;
	private int eId;
	private String roomTypeName;
	private int roomTypeRate;
	private String roomTypeDate;
	private int roomTypeCount;
	public int getRoomTypeCode() {
		return roomTypeCode;
	}
	public void setRoomTypeCode(int roomTypeCode) {
		this.roomTypeCode = roomTypeCode;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
	public int getRoomTypeRate() {
		return roomTypeRate;
	}
	public void setRoomTypeRate(int roomTypeRate) {
		this.roomTypeRate = roomTypeRate;
	}
	public String getRoomTypeDate() {
		return roomTypeDate;
	}
	public void setRoomTypeDate(String roomTypeDate) {
		this.roomTypeDate = roomTypeDate;
	}
	public int getRoomTypeCount() {
		return roomTypeCount;
	}
	public void setRoomTypeCount(int roomTypeCount) {
		this.roomTypeCount = roomTypeCount;
	}
	@Override
	public String toString() {
		return "RoomType [roomTypeCode=" + roomTypeCode + ", eId=" + eId + ", roomTypeName=" + roomTypeName
				+ ", roomTypeRate=" + roomTypeRate + ", roomTypeDate=" + roomTypeDate + ", roomTypeCount="
				+ roomTypeCount + "]";
	}
}
