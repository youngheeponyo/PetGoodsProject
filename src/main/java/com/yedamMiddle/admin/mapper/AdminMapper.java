package com.yedamMiddle.admin.mapper;

import java.util.List;

import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;

public interface AdminMapper {
	List<UserVO> userList();
	List<ProductVO> prodList();
	public int insert(ProductVO vo);
}
