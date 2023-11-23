package com.yedamMiddle.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.admin.service.SalesRateVO;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.review.service.ReviewVO;

public interface AdminMapper {
	List<UserVO> userList();
	List<ProductVO> prodList();
	public ProductVO prodSelect(int ProductNo);
	public int prodInsert(ProductVO vo);
	public int prodUpdate(ProductVO vo);
	public int prodDelete(int productNo);
	public String cateName(int productNo);
	List<CategoryJoinVO> getJoinCateList();
	public int mainCateInsert(String categoryName);
	public int subCateInsert(@Param("subName") String subName, @Param("preName") String preName);
	List<ProductOrderVO> productOrder();
	List<SalesRateVO> getSalesRate();
	List<ReviewVO> selectReviewList();
	public int reviewDelete(int reviewNo);
}
