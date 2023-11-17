package com.yedamMiddle.common;
import com.yedamMiddle.product.service.ProductService;
import java.util.List;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class MainExe {

	public static void main(String[] args) {
		ProductService s = new ProductServiceImpl();
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
		AdminService svc = new AdminServiceImpl();
		List<ProductVO> list = svc.prodList();
		System.out.println(svc.cateName(50));
		ProductService psvc = new ProductServiceImpl();
		List<CategoryJoinVO> cateList = psvc.getCategoryList();
		System.out.println(cateList);
		
		int a = s.reduceProductStock(1, 14);
		System.out.println(a);
		
		
		
	}// endmaim
}// end
