package com.yedamMiddle.common.service;

//@Data
public class CartJoinVO implements Cloneable {
	private int cartNo;
	private String productName;
	private int productPrice;
	private int selCnt;
	private int productNo;
	private int productStock;
	
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
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
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
