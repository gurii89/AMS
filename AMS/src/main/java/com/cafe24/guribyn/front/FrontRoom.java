package com.cafe24.guribyn.front;
public class FrontRoom {
	private int roomCodeF;
	private int roomCodeMarkF;
	private String roomTypeCodeNameF;
	private String roomConF;
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
	public String getRoomConF() {
		return roomConF;
	}
	public void setRoomConF(String roomConF) {
		this.roomConF = roomConF;
	}
	@Override
	public String toString() {
		return "FrontRoom [roomCodeF=" + roomCodeF + ", roomCodeMarkF=" + roomCodeMarkF + ", roomTypeCodeNameF="
				+ roomTypeCodeNameF + ", roomConF=" + roomConF + "]";
	}
	
}
