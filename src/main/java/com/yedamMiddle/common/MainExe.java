package com.yedamMiddle.common;
import com.yedamMiddle.product.service.ProductReviewJoinVO;
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
		ProductService svc = new ProductServiceImpl();
		List<ProductReviewJoinVO> list = svc.searchProductList("사조", "0", 1);
		
		int a = 10;
	}// endmaim
}// end
