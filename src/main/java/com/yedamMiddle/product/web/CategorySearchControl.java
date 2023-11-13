package com.yedamMiddle.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.CategoryVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class CategorySearchControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String category = req.getParameter("categoryNo");
		if(category == null || category.isEmpty())
			return;
		
		int categoryNo = Integer.parseInt(category);
		if(categoryNo <= 0)
			return;
		
		ProductService svc = new ProductServiceImpl();
		List<ProductVO> productList = svc.searchCategory(categoryNo);
		
		CategoryVO cateVO =  svc.getCategoryInfo(categoryNo);
		if(cateVO == null) {
			return;
		}
		
		String query = cateVO.getCategoryName() + " 카테고리";
		req.setAttribute("query", query);
		req.setAttribute("searchList", productList);
		try {
			req.getRequestDispatcher("product/productSearchPage.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
