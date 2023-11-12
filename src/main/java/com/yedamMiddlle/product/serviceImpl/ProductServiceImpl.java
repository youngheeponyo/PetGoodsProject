package com.yedamMiddlle.product.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.product.mapper.ProductMapper;
import com.yedamMiddlle.product.service.ProductService;

public class ProductServiceImpl implements ProductService {
	private SqlSession sql = Mybatis.getInstance().openSession(true);
	private ProductMapper mapper = sql.getMapper(ProductMapper.class);
	@Override
	public List<CategoryJoinVO> getCategoryList() {
		return mapper.getCategoryList();
	}
	
}
