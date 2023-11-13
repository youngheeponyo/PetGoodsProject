package com.yedamMiddle.common.service;

import lombok.Data;

@Data
public class CategoryVO {
	private int categoryNo;
	private String categoryName;
	private int categoryPreno;
	public int getCategoryNo() {
		return categoryNo;
	}
	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryPreno="
				+ categoryPreno + "]";
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryPreno() {
		return categoryPreno;
	}
	public void setCategoryPreno(int categoryPreno) {
		this.categoryPreno = categoryPreno;
	}
}
