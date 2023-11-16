package com.yedamMiddle.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.ApiInfoVO;
import com.yedamMiddle.common.service.CartJoinVO;
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
	public ApiInfoVO getApiInfo(String apiName);
	public boolean addPaymentInfo(List<ProductOrderVO> vo);
	
	public List<Integer> getProductPrice(int[] productNos);
	public List<ProductOrderVO> getProductOrder(int[] productNos, long merUid, int userNo);
	
	public List<ProductVO> searchRegistDateDescFromMain(String petType);
	public List<ProductVO> searchReviewDescFromMain(String petType);
	public List<ProductVO> searchStarCntDescFromMain(String petType);
}
