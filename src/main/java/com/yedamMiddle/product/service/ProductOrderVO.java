package com.yedamMiddle.product.service;

import java.util.Date;

public class ProductOrderVO {
	@Override
	public String toString() {
		return "ProductOrderVO [productOrderNo=" + productOrderNo + ", productNo=" + productNo + ", userNo=" + userNo
				+ ", couponNo=" + couponNo + ", orderDate=" + orderDate + ", impUid=" + impUid + ", merUid=" + merUid
				+ "]";
	}
	private int productOrderNo;
	private int productNo;
	private int userNo;
	private int couponNo;
	private Date orderDate;
	private String impUid;
	private long merUid;
	
	public int getProductOrderNo() {
		return productOrderNo;
	}
	public void setProductOrderNo(int productOrderNo) {
		this.productOrderNo = productOrderNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public long getMerUid() {
		return merUid;
	}
	public void setMerUid(long merUid) {
		this.merUid = merUid;
	}

}
