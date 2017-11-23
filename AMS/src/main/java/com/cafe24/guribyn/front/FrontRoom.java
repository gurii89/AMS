package com.cafe24.guribyn.front;
public class FrontRoom {
	private int roomCodeF;
	private int roomCodeMarkF;
	private String roomTypeCodeNameF;
	public int getRoomCodeF() {
		return roomCodeF;
	}
	public void setRoomCodeF(int roomCodeF) {
		this.roomCodeF = roomCodeF;
	}
	public int getRoomCodeMarkF() {
		return roomCodeMarkF;
	}
	public void setRoomCodeMarkF(int roomCodeMarkF) {
		this.roomCodeMarkF = roomCodeMarkF;
	}
	public String getRoomTypeCodeNameF() {
		return roomTypeCodeNameF;
	}
	public void setRoomTypeCodeNameF(String roomTypeCodeNameF) {
		this.roomTypeCodeNameF = roomTypeCodeNameF;
	}
	@Override
	public String toString() {
		return "FrontRoom [roomCodeF=" + roomCodeF + ", roomCodeMarkF=" + roomCodeMarkF + ", roomTypeCodeNameF="
				+ roomTypeCodeNameF + "]";
	}
}
