package com.yedamMiddle.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.CategoryJoinVO;

public interface ProductService {
	public List<CategoryJoinVO> getCategoryList();
	public List<ProductVO> searchProductList(String query, String type);
}
