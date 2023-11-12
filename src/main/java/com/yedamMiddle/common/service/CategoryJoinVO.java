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
}
