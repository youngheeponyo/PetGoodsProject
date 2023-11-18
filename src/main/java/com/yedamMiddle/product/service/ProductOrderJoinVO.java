package com.yedamMiddle.product.service;

import java.util.Date;

public class ProductOrderJoinVO {
	private long merUid;
	private String productName;
	private int productPrice;
	private int buyCnt;
	private int productNo;
	private Date orderDate;
	private int reviewNo;
	public long getMerUid() {
		return merUid;
	}
	public void setMerUid(long merUid) {
		this.merUid = merUid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getBuyCnt() {
		return buyCnt;
	}
	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	@Override
	public String toString() {
		return "ProductOrderJoinVO [merUid=" + merUid + ", productName=" + productName + ", productPrice="
				+ productPrice + ", buyCnt=" + buyCnt + ", productNo=" + productNo + ", orderDate=" + orderDate
				+ ", reviewNo=" + reviewNo + "]";
	}
	
}
