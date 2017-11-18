package com.cafe24.guribyn.event;

public class Event {

	private int eventCode;
	private String eventFx;
	private String eId;
	private String eventDate;
	private String eventStart;
	private String eventEnd;
	public int getEventCode() {
		return eventCode;
	}
	public void setEventCode(int eventCode) {
		this.eventCode = eventCode;
	}
	public String getEventFx() {
		return eventFx;
	}
	public void setEventFx(String eventFx) {
		this.eventFx = eventFx;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventStart() {
		return eventStart;
	}
	public void setEventStart(String eventStart) {
		this.eventStart = eventStart;
	}
	public String getEventEnd() {
		return eventEnd;
	}
	public void setEventEnd(String eventEnd) {
		this.eventEnd = eventEnd;
	}
	@Override
	public String toString() {
		return "Event [eventCode=" + eventCode + ", eventFx=" + eventFx + ", eId=" + eId + ", eventDate=" + eventDate
				+ ", eventStart=" + eventStart + ", eventEnd=" + eventEnd + "]";
	}
	
}
