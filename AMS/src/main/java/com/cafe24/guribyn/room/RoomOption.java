package com.cafe24.guribyn.room;
public class RoomOption {
	private String roomTypeCode;
	private String cateCode;
	private String eId;
	private String roomOptDate;
	private String roomTypeName;
	private String cateCodeName;
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
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
	public String getCateCodeName() {
		return cateCodeName;
	}
	public void setCateCodeName(String cateCodeName) {
		this.cateCodeName = cateCodeName;
	}
	@Override
	public String toString() {
		return "RoomOption [roomTypeCode=" + roomTypeCode + ", cateCode=" + cateCode + ", eId=" + eId + ", roomOptDate="
				+ roomOptDate + ", roomTypeName=" + roomTypeName + ", cateCodeName=" + cateCodeName + "]";
	}
}
