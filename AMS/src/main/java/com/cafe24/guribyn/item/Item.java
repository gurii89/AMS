package com.cafe24.guribyn.item;

public class Item {
	private String itemCode;
	private String cateCode;
	private String eId;
	private String itemName;
	private String itemCount;
	private String itemDate;
	
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
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
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemCount() {
		return itemCount;
	}
	public void setItemCount(String itemCount) {
		this.itemCount = itemCount;
	}
	public String getItemDate() {
		return itemDate;
	}
	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
	}
	@Override
	public String toString() {
		return "Item [itemCode=" + itemCode + ", cateCode=" + cateCode + ", eId=" + eId + ", itemName=" + itemName
				+ ", itemCount=" + itemCount + ", itemDate=" + itemDate + "]";
	}
	
	
}
