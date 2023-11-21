package com.yedamMiddle.product.service;

import java.util.Date;

public class ProductReviewJoinVO {
	private int productNo;
	private String petType;
	private int categoryNo;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String productImage;
	private Date productRegistDate;
	private int productStock;
	private double avgStar;
	
	public int getProductNo() {
		return productNo;
	}
	public double getAvgStar() {
		return avgStar;
	}
	public void setAvgStar(double avgStar) {
		this.avgStar = avgStar;
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
	public Date getProductRegistDate() {
		return productRegistDate;
	}
	public void setProductRegistDate(Date productRegistDate) {
		this.productRegistDate = productRegistDate;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	@Override
	public String toString() {
		return "ProductReviewJoinVO [productNo=" + productNo + ", petType=" + petType + ", categoryNo=" + categoryNo
				+ ", productName=" + productName + ", productPrice=" + productPrice + ", productDesc=" + productDesc
				+ ", productImage=" + productImage + ", productRegistDate=" + productRegistDate + ", productStock="
				+ productStock + ", avgStar=" + avgStar + "]";
	}
	
}
