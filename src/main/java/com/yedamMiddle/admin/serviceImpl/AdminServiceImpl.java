package com.yedamMiddle.admin.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.admin.mapper.AdminMapper;
import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.common.Mybatis;
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
	public boolean removeProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
