package com.yedamMiddle.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.product.service.ProductVO;

public interface ProductMapper {
	public CategoryVO getCategoryInfo(int categoryNo);
	public List<CategoryJoinVO> getCategoryList();
	public List<ProductVO> searchProductList(@Param("query") String query, @Param("type") String type);
	public List<ProductVO> searchCategory(int categoryNo);
}
