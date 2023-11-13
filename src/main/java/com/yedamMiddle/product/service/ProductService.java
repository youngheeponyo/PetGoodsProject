package com.yedamMiddle.product.service;

import java.util.List;

import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;

public interface ProductService {
	public CategoryVO getCategoryInfo(int categoryNo);
	public List<CategoryJoinVO> getCategoryList();
	public List<ProductVO> searchProductList(String query, String type);
	public List<ProductVO> searchCategory(int categoryNo);
}
