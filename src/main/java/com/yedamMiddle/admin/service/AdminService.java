package com.yedamMiddle.admin.service;

import java.util.List;

import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;

public interface AdminService {
	List<UserVO> userList();
	List<ProductVO> prodList();
	public boolean addProduct(ProductVO vo);
	public ProductVO getProduct(int ProductNo);
}
