package com.cafe24.guribyn.booking;

import java.util.Arrays;

import com.cafe24.guribyn.extra.Extra;
import com.cafe24.guribyn.room.Room;

public class Booking {
 
    private int booCode;
    private String eId;
    private String booDate; 
    private String booIn;
    private int booNight;
    private int booCount;
    private String booPath;
    private String booMemo;
    private Extra[] useExtra;
    private Room[] useRoom;
	public int getBooCode() {
		return booCode;
	}
	public void setBooCode(int booCode) {
		this.booCode = booCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getBooDate() {
		return booDate;
	}
	public void setBooDate(String booDate) {
		this.booDate = booDate;
	}
	public String getBooIn() {
		return booIn;
	}
	public void setBooIn(String booIn) {
		this.booIn = booIn;
	}
	public int getBooNight() {
		return booNight;
	}
	public void setBooNight(int booNight) {
		this.booNight = booNight;
	}
	public int getBooCount() {
		return booCount;
	}
	public void setBooCount(int booCount) {
		this.booCount = booCount;
	}
	public String getBooPath() {
		return booPath;
	}
	public void setBooPath(String booPath) {
		this.booPath = booPath;
	}
	public String getBooMemo() {
		return booMemo;
	}
	public void setBooMemo(String booMemo) {
		this.booMemo = booMemo;
	}
	public Extra[] getUseExtra() {
		return useExtra;
	}
	public void setUseExtra(Extra[] useExtra) {
		this.useExtra = useExtra;
	}
	public Room[] getUseRoom() {
		return useRoom;
	}
	public void setUseRoom(Room[] useRoom) {
		this.useRoom = useRoom;
	}
	@Override
	public String toString() {
		return "Booking [booCode=" + booCode + ", eId=" + eId + ", booDate=" + booDate + ", booIn=" + booIn
				+ ", booNight=" + booNight + ", booCount=" + booCount + ", booPath=" + booPath + ", booMemo=" + booMemo
				+ ", useExtra=" + Arrays.toString(useExtra) + ", useRoom=" + Arrays.toString(useRoom) + "]";
	}
	
}
