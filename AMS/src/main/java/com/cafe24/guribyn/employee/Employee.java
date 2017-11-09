package com.cafe24.guribyn.employee;

import java.sql.Date;

public class Employee {
	private String eId;
	private int eNation;
	private int eLevel;
	private int eGender;
	private int ePosition;
	private int eDepartment;
	private int eLanguage1;
	private int eLanguage2;
	private int mId;
	private String eName;
	private String ePw;
	private String eBirthdate;
	private String eEmail;
	private String eAddress;
	private int ePhone;
	private String eMemo;
	private Date eDate;
	
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public int geteNation() {
		return eNation;
	}
	public void seteNation(int eNation) {
		this.eNation = eNation;
	}
	public int geteLevel() {
		return eLevel;
	}
	public void seteLevel(int eLevel) {
		this.eLevel = eLevel;
	}
	public int geteGender() {
		return eGender;
	}
	public void seteGender(int eGender) {
		this.eGender = eGender;
	}
	public int getePosition() {
		return ePosition;
	}
	public void setePosition(int ePosition) {
		this.ePosition = ePosition;
	}
	public int geteDepartment() {
		return eDepartment;
	}
	public void seteDepartment(int eDepartment) {
		this.eDepartment = eDepartment;
	}
	public int geteLanguage1() {
		return eLanguage1;
	}
	public void seteLanguage1(int eLanguage1) {
		this.eLanguage1 = eLanguage1;
	}
	public int geteLanguage2() {
		return eLanguage2;
	}
	public void seteLanguage2(int eLanguage2) {
		this.eLanguage2 = eLanguage2;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String getePw() {
		return ePw;
	}
	public void setePw(String ePw) {
		this.ePw = ePw;
	}
	public String geteBirthdate() {
		return eBirthdate;
	}
	public void seteBirthdate(String eBirthdate) {
		this.eBirthdate = eBirthdate;
	}
	public String geteEmail() {
		return eEmail;
	}
	public void seteEmail(String eEmail) {
		this.eEmail = eEmail;
	}
	public String geteAddress() {
		return eAddress;
	}
	public void seteAddress(String eAddress) {
		this.eAddress = eAddress;
	}
	public int getePhone() {
		return ePhone;
	}
	public void setePhone(int ePhone) {
		this.ePhone = ePhone;
	}
	public String geteMemo() {
		return eMemo;
	}
	public void seteMemo(String eMemo) {
		this.eMemo = eMemo;
	}
	public Date geteDate() {
		return eDate;
	}
	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}
	@Override
	public String toString() {
		return "EmployeeTest [eId=" + eId + ", eNation=" + eNation + ", eLevel=" + eLevel + ", eGender=" + eGender
				+ ", ePosition=" + ePosition + ", eDepartment=" + eDepartment + ", eLanguage1=" + eLanguage1
				+ ", eLanguage2=" + eLanguage2 + ", mId=" + mId + ", eName=" + eName + ", ePw=" + ePw + ", eBirthdate="
				+ eBirthdate + ", eEmail=" + eEmail + ", eAddress=" + eAddress + ", ePhone=" + ePhone + ", eMemo="
				+ eMemo + ", eDate=" + eDate + "]";
	}
	
}
