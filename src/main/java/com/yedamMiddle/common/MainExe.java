package com.yedamMiddle.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.product.mapper.ProductMapper;
import com.yedamMiddle.product.service.ProductOrderVO;

public class MainExe {

	public static void main(String[] args) {
//		SqlSession sql = Mybatis.getInstance().openSession(true);
//		AdminMapper mapper = sql.getMapper(AdminMapper.class);
//		
//		NoticeMapper nomapper = sql.getMapper(NoticeMapper.class);
//		
		SqlSession sql = Mybatis.getInstance().openSession(true);
		ProductMapper m = sql.getMapper(ProductMapper.class);
		
		int[] pr = new int[4];
		pr[0] = 14;
		pr[1] = 15;
		pr[2] = 16;
		pr[3] = 17;
		
		int userNo = 0;
		long merUid = 17000295505990L;
		List<ProductOrderVO> vo = m.selectProductOrder(pr,merUid, userNo);
		
		System.out.println(vo);
		
		
		
	}// endmaim
}// end
