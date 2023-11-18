package com.yedamMiddle.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.ApiInfoVO;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductVO;

public interface ProductMapper {
	public CategoryVO getCategoryInfo(int categoryNo);
	public List<CategoryJoinVO> getCategoryList();
	public ProductVO productDetail(@Param("productNo") int productNo);
	public List<ProductVO> productList();
	
	public List<ProductVO> searchProductList(@Param("query") String query, @Param("type") String type, @Param("page") int page);
	public List<ProductVO> searchCategory(@Param("categoryNo") int categoryNo,@Param("type") String type,  @Param("page") int page);
	public int searchCategoryCount(@Param("categoryNo") int categoryNo, @Param("type") String type);
	public int searchProductListCount(@Param("query") String query, @Param("type") String type);
	
	public ApiInfoVO selectApiInfo(String apiName);
	public int insertProductOrder(ProductOrderVO vo);
	public List<ProductVO> selectProductPrice(int[] productNos);
	
	public List<ProductOrderVO> selectProductOrder(@Param("productNos") int[] productNos, @Param("merUid") long merUid, @Param("uNo") int userNo);
	
	public List<ProductVO> selectRegistDateDescFromMain(String petType);
	public List<ProductVO> selectReviewDescFromMain(String petType);
	public List<ProductVO> selectStarCntDescFromMain(String petType);
	public int updateProductStock(@Param("cnt") int cnt, @Param("productNo") int productNo);
	public List<ProductOrderJoinVO> selectAllMyProductOrderList(int userNo);
}
