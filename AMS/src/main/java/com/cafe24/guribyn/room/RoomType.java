package com.cafe24.guribyn.room;
public class RoomType {
	private String roomTypeCode;
	private String eId;
	private String roomTypeName;
	private String roomTypeRate;
	private String roomTypeDate;
	private String roomTypeCount;
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
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
	public String getRoomTypeRate() {
		return roomTypeRate;
	}
	public void setRoomTypeRate(String roomTypeRate) {
		this.roomTypeRate = roomTypeRate;
	}
	public String getRoomTypeDate() {
		return roomTypeDate;
	}
	public void setRoomTypeDate(String roomTypeDate) {
		this.roomTypeDate = roomTypeDate;
	}
	public String getRoomTypeCount() {
		return roomTypeCount;
	}
	public void setRoomTypeCount(String roomTypeCount) {
		this.roomTypeCount = roomTypeCount;
	}
	@Override
	public String toString() {
		return "RoomType [roomTypeCode=" + roomTypeCode + ", eId=" + eId + ", roomTypeName=" + roomTypeName
				+ ", roomTypeRate=" + roomTypeRate + ", roomTypeDate=" + roomTypeDate + ", roomTypeCount="
				+ roomTypeCount + "]";
	}
}
