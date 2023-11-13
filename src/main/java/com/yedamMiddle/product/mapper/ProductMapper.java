package com.yedamMiddle.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.product.service.ProductVO;

public interface ProductMapper {
	public List<CategoryJoinVO> getCategoryList();
	public List<ProductVO> searchProductList(@Param("query") String query, @Param("type") String type);
	public ProductVO productDetail(@Param("productNo") int productNo);
	public List<ProductVO> productList();
	
}
