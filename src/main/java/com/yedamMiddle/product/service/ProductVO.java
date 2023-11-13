package com.yedamMiddle.product.service;

import java.util.Date;


import lombok.Data;

//@Data
public class ProductVO {
	private int productNo;
	private String petType;
	private int categoryNo;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String productImage;
	private String productDetailImage;
	private Date productRegist;
	private int productStock;
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public Date getProductRegist() {
		return productRegist;
	}
	public void setProductRegist(Date productRegist) {
		this.productRegist = productRegist;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public String getProductDetailImage() {
		return productDetailImage;
	}
	public void setProductDetailImage(String productDetailImage) {
		this.productDetailImage = productDetailImage;
	}
	
}
