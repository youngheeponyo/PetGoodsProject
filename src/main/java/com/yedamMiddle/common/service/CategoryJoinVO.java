package com.yedamMiddle.common.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CategoryJoinVO {
	private int mainCateNo;
	private String mainCateName;
	private int subCateNo;
	private String subCateName;
	public int getMainCateNo() {
		return mainCateNo;
	}
	public void setMainCateNo(int mainCateNo) {
		this.mainCateNo = mainCateNo;
	}
	public String getMainCateName() {
		return mainCateName;
	}
	public void setMainCateName(String mainCateName) {
		this.mainCateName = mainCateName;
	}
	public int getSubCateNo() {
		return subCateNo;
	}
	public void setSubCateNo(int subCateNo) {
		this.subCateNo = subCateNo;
	}
	public String getSubCateName() {
		return subCateName;
	}
	public void setSubCateName(String subCateName) {
		this.subCateName = subCateName;
	}
	
	
}
