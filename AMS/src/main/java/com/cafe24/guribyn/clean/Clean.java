package com.cafe24.guribyn.clean;
public class Clean {
	private String cleanCode;
	private String roomCode;
	private String eId;
	private String cleanStart;
	private String cleanEnd;
	public String getCleanCode() {
		return cleanCode;
	}
	public void setCleanCode(String cleanCode) {
		this.cleanCode = cleanCode;
	}
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getCleanStart() {
		return cleanStart;
	}
	public void setCleanStart(String cleanStart) {
		this.cleanStart = cleanStart;
	}
	public String getCleanEnd() {
		return cleanEnd;
	}
	public void setCleanEnd(String cleanEnd) {
		this.cleanEnd = cleanEnd;
	}
	@Override
	public String toString() {
		return "Clean [cleanCode=" + cleanCode + ", roomCode=" + roomCode + ", eId=" + eId + ", cleanStart="
				+ cleanStart + ", cleanEnd=" + cleanEnd + "]";
	}
	
}
