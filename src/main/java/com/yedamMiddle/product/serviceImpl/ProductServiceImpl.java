package com.yedamMiddle.product.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.ApiInfoVO;
import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.CartJoinVO;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.product.mapper.ProductMapper;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;

public class ProductServiceImpl implements ProductService {
	private SqlSession sql = Mybatis.getInstance().openSession(true);
	private ProductMapper mapper = sql.getMapper(ProductMapper.class);
	@Override
	public List<CategoryJoinVO> getCategoryList() {
		return mapper.getCategoryList();
	}
	@Override
	public List<ProductVO> searchProductList(String query, String type, int page) {
		// TODO Auto-generated method stub
		return mapper.searchProductList(query, type, page);
	}
	@Override
	public List<ProductVO> searchCategory(int categoryNo, String type, int page) {
		// TODO Auto-generated method stub
		return mapper.searchCategory(categoryNo, type, page);
	}
	@Override
	public CategoryVO getCategoryInfo(int categoryNo) {
		// TODO Auto-generated method stub
		return mapper.getCategoryInfo(categoryNo);
	}
	
	 @Override
	public ProductVO productDetail(int productNo) {
		return mapper.productDetail(productNo);
	}
	 
	@Override
	public List<ProductVO> productList() {
		return mapper.productList();
	}
	@Override
	public int searchCategoryCount(int categoryNo, String type) {
		// TODO Auto-generated method stub
		return mapper.searchCategoryCount(categoryNo, type);
	}
	@Override
	public int searchProductListCount(String query, String type) {
		// TODO Auto-generated method stub
		return mapper.searchProductListCount(query, type);
	}

	@Override
	public ApiInfoVO getApiInfo(String apiName) {
		// TODO Auto-generated method stub
		return mapper.selectApiInfo(apiName);
	}
	@Override
	public boolean addPaymentInfo(List<ProductOrderVO> vo) {
		// TODO Auto-generated method stub
		sql.close();
		
		// insertMany를 효율적으로 처리하기위해.
		sql = Mybatis.getInstance().openSession(ExecutorType.BATCH);
		mapper = sql.getMapper(ProductMapper.class);
		 
		vo.forEach((obj) -> {
			mapper.insertProductOrder(obj);
		});
		
		sql.flushStatements();
		sql.commit();
		return true;
	}
	@Override
	public List<ProductVO> getProductPrice(int[] productNos) {
		// TODO Auto-generated method stub
		return mapper.selectProductPrice(productNos);
	}
	@Override
	public List<ProductOrderVO> getProductOrder(int[] productNos, long merUid, int userNo) {
		// TODO Auto-generated method stub
		return mapper.selectProductOrder(productNos, merUid, userNo);
	}
	@Override
	public List<ProductVO> searchRegistDateDescFromMain(String petType) {
		// TODO Auto-generated method stub
		return mapper.selectRegistDateDescFromMain(petType);
	}
	@Override
	public List<ProductVO> searchReviewDescFromMain(String petType) {
		// TODO Auto-generated method stub
		return mapper.selectReviewDescFromMain(petType);
	}
	@Override
	public List<ProductVO> searchStarCntDescFromMain(String petType) {
		// TODO Auto-generated method stub
		return mapper.selectStarCntDescFromMain(petType);
	}
	@Override
	public int reduceProductStock(int cnt, int productNo) {
		// TODO Auto-generated method stub
		return mapper.updateProductStock(cnt, productNo);
	}
	@Override
	public List<ProductOrderJoinVO> getAllMyProductOrderList(int userNo) {
		// TODO Auto-generated method stub
		return mapper.selectAllMyProductOrderList(userNo);
	}
	@Override
	public List<ProductVO> searchRegistDateDescFromTab(String petType) {
		// TODO Auto-generated method stub
		return mapper.selectRegistDateDescFromTab(petType);
	}
	@Override
	public List<ProductVO> searchBestSellProductFromTab(String petType) {
		// TODO Auto-generated method stub
		return mapper.selectBestSellProductFromTab(petType);
	}
	@Override
	public List<ProductVO> searchHighStarProductFromTab(String petType) {
		// TODO Auto-generated method stub
		return mapper.selectHighStarProductFromTab(petType);
	}
	
	@Override
	public List<ProductVO> categoryList(int categoryNo,int productNo) {
		return mapper.categoryList(categoryNo,productNo);
	}
}
