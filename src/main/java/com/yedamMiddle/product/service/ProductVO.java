package com.yedamMiddle.product.service;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int productNo;
	private String petType;
	private int categoryNo;
	private String productName;
	private String productPrice;
	private String productDesc;
	private String productImage;
	private Date productRegistDate;
	private int productStock;
}
