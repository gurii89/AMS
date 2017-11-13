package com.cafe24.guribyn.employee;

public class Employee {
	private String eId;
	private String mId;
	private String eNation;
	private String eDepartment;
	private String eGender;
	private String ePosition;
	private String eLanguage;
	private String eName;
	private String ePw;
	private String eBirthdate;
	private String eEmail;
	private String eAddress;
	private String ePhone;
	private String eMemo;
	private String eDate;
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String geteNation() {
		return eNation;
	}
	public void seteNation(String eNation) {
		this.eNation = eNation;
	}
	public String geteDepartment() {
		return eDepartment;
	}
	public void seteDepartment(String eDepartment) {
		this.eDepartment = eDepartment;
	}
	public String geteGender() {
		return eGender;
	}
	public void seteGender(String eGender) {
		this.eGender = eGender;
	}
	public String getePosition() {
		return ePosition;
	}
	public void setePosition(String ePosition) {
		this.ePosition = ePosition;
	}
	public String geteLanguage() {
		return eLanguage;
	}
	public void seteLanguage(String eLanguage) {
		this.eLanguage = eLanguage;
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
	public String getePhone() {
		return ePhone;
	}
	public void setePhone(String ePhone) {
		this.ePhone = ePhone;
	}
	public String geteMemo() {
		return eMemo;
	}
	public void seteMemo(String eMemo) {
		this.eMemo = eMemo;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	@Override
	public String toString() {
		return "Employee [eId=" + eId + ", mId=" + mId + ", eNation=" + eNation + ", eDepartment=" + eDepartment
				+ ", eGender=" + eGender + ", ePosition=" + ePosition + ", eLanguage=" + eLanguage + ", eName=" + eName
				+ ", ePw=" + ePw + ", eBirthdate=" + eBirthdate + ", eEmail=" + eEmail + ", eAddress=" + eAddress
				+ ", ePhone=" + ePhone + ", eMemo=" + eMemo + ", eDate=" + eDate + "]";
	}
}
