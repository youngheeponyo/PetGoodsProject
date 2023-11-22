package com.yedamMiddle.admin.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.admin.mapper.AdminMapper;
import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.service.SalesRateVO;
import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductVO;

public class AdminServiceImpl implements AdminService {
	SqlSession sql = Mybatis.getInstance().openSession(true);
	AdminMapper mapper = sql.getMapper(AdminMapper.class);

	@Override
	public List<UserVO> userList() {
		return mapper.userList();
	}

	@Override
	public List<ProductVO> prodList() {
		return mapper.prodList();
	}

	@Override
	public ProductVO getProduct(int ProductNo) {
		return mapper.prodSelect(ProductNo);
	}

	@Override
	public boolean addProduct(ProductVO vo) {
		return mapper.prodInsert(vo) == 1;
	}

	@Override
	public boolean editProduct(ProductVO vo) {
		return mapper.prodUpdate(vo) == 1;
	}

	@Override
	public boolean removeProduct(int productNo) {
		return mapper.prodDelete(productNo) == 1;
	}

	@Override
	public String cateName(int productNo) {
		return mapper.cateName(productNo);
	}

	@Override
	public List<CategoryJoinVO> getJoinCateList() {
		return mapper.getJoinCateList();
	}

	@Override
	public boolean addMainCate(String categoryName) {
		return mapper.mainCateInsert(categoryName) == 1;
	}

	@Override
	public boolean addSubCate(String subName, String preName) {
		return mapper.subCateInsert(subName, preName) == 1;
	}

	@Override
	public List<SalesRateVO> getSalesRate() {
		return mapper.getSalesRate();
	}




	
	
}
