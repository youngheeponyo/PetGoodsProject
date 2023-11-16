package com.yedamMiddle.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.product.mapper.ProductMapper;
import com.yedamMiddle.product.service.ProductOrderVO;
import com.yedamMiddle.product.service.ProductVO;

public class MainExe {

	public static void main(String[] args) {
//		SqlSession sql = Mybatis.getInstance().openSession(true);
//		ProductMapper m = sql.getMapper(ProductMapper.class);
//		
//		int[] pr = new int[4];
//		pr[0] = 14;
//		pr[1] = 15;
//		pr[2] = 16;
//		pr[3] = 17;
//		
//		int userNo = 0;
//		long merUid = 17000295505990L;
//		List<ProductOrderVO> vo = m.selectProductOrder(pr,merUid, userNo);
//		
//		System.out.println(vo);
		ProductVO vo = new ProductVO();
		AdminService svc = new AdminServiceImpl();
		vo.setProductNo(50);
		vo.setCategoryNo(6);
		vo.setProductPrice(4567);
		vo.setProductStock(22);
		vo.setProductDesc("수정테스트");
		if(svc.editProduct(vo)) {
			System.out.println("변경성공");
		}else {
			System.out.println("변경실패");
		}
		
		
	}// endmaim
}// end
