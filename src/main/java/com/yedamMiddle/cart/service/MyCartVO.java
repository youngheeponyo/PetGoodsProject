package com.yedamMiddle.cart.service;

import lombok.Data;

@Data
public class MyCartVO {
	private int cartNo;
	private int memberNo;
	private int productNo;
	private int selectCnt;
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getSelectCnt() {
		return selectCnt;
	}
	public void setSelectCnt(int selectCnt) {
		this.selectCnt = selectCnt;
	}
	
	
}
