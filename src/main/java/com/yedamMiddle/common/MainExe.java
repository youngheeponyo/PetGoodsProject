package com.yedamMiddle.common;

import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class MainExe {

	public static void main(String[] args) {
		ProductService s = new ProductServiceImpl();
		
		int a = s.reduceProductStock(1, 14);
		System.out.println(a);
	}// endmaim
}// end
