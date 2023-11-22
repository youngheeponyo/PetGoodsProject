package com.yedamMiddle.admin.service;

public class SalesRateVO {
	private String productName;
	private int sellCnt;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getSellCnt() {
		return sellCnt;
	}
	public void setSellCnt(int sellCnt) {
		this.sellCnt = sellCnt;
	}
	@Override
	public String toString() {
		return "SalesRateVO [productName=" + productName + ", sellCnt=" + sellCnt + "]";
	}
	
	
}
