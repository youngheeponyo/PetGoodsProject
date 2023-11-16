package com.yedamMiddle.admin.service;

import java.util.List;

import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;

public interface AdminService {
	List<UserVO> userList();
	List<ProductVO> prodList();
	public ProductVO getProduct(int ProductNo);
	public boolean addProduct(ProductVO vo);
	public boolean editProduct(ProductVO vo);
	public boolean removeProduct(int productNo);
	public String cateName(int productNo);
}
