package com.cafe24.guribyn.room;
public class RoomCate {
	private String roomOptCode;
	private String roomTypeCode;
	private String cateCode;
	private String eId;
	private String roomOptDate;
	public String getRoomOptCode() {
		return roomOptCode;
	}
	public void setRoomOptCode(String roomOptCode) {
		this.roomOptCode = roomOptCode;
	}
	public String getRoomTypeCode() {
		return roomTypeCode;
	}
	public void setRoomTypeCode(String roomTypeCode) {
		this.roomTypeCode = roomTypeCode;
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
	public String getRoomOptDate() {
		return roomOptDate;
	}
	public void setRoomOptDate(String roomOptDate) {
		this.roomOptDate = roomOptDate;
	}
	@Override
	public String toString() {
		return "RoomCate [roomOptCode=" + roomOptCode + ", roomTypeCode=" + roomTypeCode + ", cateCode=" + cateCode
				+ ", eId=" + eId + ", roomOptDate=" + roomOptDate + "]";
	}
}
