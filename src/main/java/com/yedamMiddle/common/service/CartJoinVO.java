package com.yedamMiddle.common.service;

//@Data
public class CartJoinVO {
	private int cartNo;
	private String productName;
	private int productPrice;
	private int selCnt;
	private int productNo;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getSelCnt() {
		return selCnt;
	}
	public void setSelCnt(int selCnt) {
		this.selCnt = selCnt;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "CartJoinVO [cartNo=" + cartNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", selCnt=" + selCnt + ", productNo=" + productNo + "]";
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
}
