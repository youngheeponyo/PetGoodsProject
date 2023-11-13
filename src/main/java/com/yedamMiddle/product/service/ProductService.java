package com.yedamMiddle.product.service;

import java.util.List;

import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;

public interface ProductService {
	public CategoryVO getCategoryInfo(int categoryNo);
	public List<CategoryJoinVO> getCategoryList();
	public List<ProductVO> searchProductList(String query, String type, int page);
	public ProductVO productDetail(int productNo);
	
	public List<ProductVO> productList();
	public List<ProductVO> searchCategory(int categoryNo, String type, int page);
	
	public int searchCategoryCount(int categoryNo, String type);
	public int searchProductListCount(String query, String type); 
}
