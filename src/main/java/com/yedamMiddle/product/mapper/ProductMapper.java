package com.yedamMiddle.product.mapper;

import java.util.List;

import com.yedamMiddle.common.service.CategoryJoinVO;

public interface ProductMapper {
	public List<CategoryJoinVO> getCategoryList();
}
