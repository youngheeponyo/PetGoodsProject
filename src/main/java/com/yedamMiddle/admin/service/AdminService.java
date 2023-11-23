package com.yedamMiddle.admin.service;

import java.util.List;

import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.review.service.ReviewVO;

public interface AdminService {
	List<UserVO> userList();
	List<ProductVO> prodList();
	public ProductVO getProduct(int ProductNo);
	public boolean addProduct(ProductVO vo);
	public boolean editProduct(ProductVO vo);
	public boolean removeProduct(int productNo);
	public String cateName(int productNo);
	List<CategoryJoinVO> getJoinCateList();
	public boolean addMainCate(String categoryName);
	public boolean addSubCate(String subName, String preName);
	List<ProductOrderVO> productOrder();
	List<ReviewVO> getAllReview();
	public boolean removeReview(int reviewNo);
}

