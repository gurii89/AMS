package com.cafe24.guribyn.guest;

import java.sql.Date;

public class Guest {
	private int gCode;
	private String eId;
	private String gName;
	private String gCountry;
	private String gGender;
	private String gPhone;
	private Date gBirthdate;
	private String gJob;
	private String gEmail;
	private Date gDate;
	public int getgCode() {
		return gCode;
	}
	public void setgCode(int gCode) {
		this.gCode = gCode;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgCountry() {
		return gCountry;
	}
	public void setgCountry(String gCountry) {
		this.gCountry = gCountry;
	}
	public String getgGender() {
		return gGender;
	}
	public void setgGender(String gGender) {
		this.gGender = gGender;
	}
	public String getgPhone() {
		return gPhone;
	}
	public void setgPhone(String gPhone) {
		this.gPhone = gPhone;
	}
	public Date getgBirthdate() {
		return gBirthdate;
	}
	public void setgBirthdate(Date gBirthdate) {
		this.gBirthdate = gBirthdate;
	}
	public String getgJob() {
		return gJob;
	}
	public void setgJob(String gJob) {
		this.gJob = gJob;
	}
	public String getgEmail() {
		return gEmail;
	}
	public void setgEmail(String gEmail) {
		this.gEmail = gEmail;
	}
	public Date getgDate() {
		return gDate;
	}
	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}
	@Override
	public String toString() {
		return "Guest [gCode=" + gCode + ", eId=" + eId + ", gName=" + gName + ", gCountry=" + gCountry + ", gGender="
				+ gGender + ", gPhone=" + gPhone + ", gBirthdate=" + gBirthdate + ", gJob=" + gJob + ", gEmail="
				+ gEmail + ", gDate=" + gDate + "]";
	}
}