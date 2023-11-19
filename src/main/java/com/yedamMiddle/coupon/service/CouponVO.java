package com.yedamMiddle.coupon.service;

import java.util.Date;

public class CouponVO {
	private int couponNo;
	private int userNo;
	private String couponName;
	private int discountPct;
	private Date endDate;
	private String couponState;
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getDiscountPct() {
		return discountPct;
	}
	public void setDiscountPct(int discountPct) {
		this.discountPct = discountPct;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCouponState() {
		return couponState;
	}
	public void setCouponState(String couponState) {
		this.couponState = couponState;
	}
	
	
}
