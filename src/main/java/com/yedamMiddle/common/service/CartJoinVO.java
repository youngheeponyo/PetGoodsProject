package com.yedamMiddle.common.service;

//@Data
public class CartJoinVO implements Cloneable {
	private int cartNo;
	private String productName;
	private int productPrice;
	private int selCnt;
	private int productNo;
	private int productStock;
	private int categoryNo;
	private String petType;
	
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
				+ ", selCnt=" + selCnt + ", productNo=" + productNo + ",petType="+petType+",categoryNo="+categoryNo+"]";
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	
	 public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	@Override
	 public CartJoinVO clone() {
		 CartJoinVO newVO = new CartJoinVO();
		 newVO.cartNo = this.cartNo;
		 newVO.productName = new String(this.productName);
		 newVO.productPrice = this.productPrice;
		 newVO.selCnt = this.selCnt;
		 newVO.productNo = this.productNo;
		 
		 return newVO;
	 }

}
