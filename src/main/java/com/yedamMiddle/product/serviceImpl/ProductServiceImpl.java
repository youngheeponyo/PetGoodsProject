package com.yedamMiddle.product.serviceImpl;

import java.util.List;




import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.product.mapper.ProductMapper;
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

}
