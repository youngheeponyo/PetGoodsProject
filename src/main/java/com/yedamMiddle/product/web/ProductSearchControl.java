package com.yedamMiddle.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class ProductSearchControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String query = req.getParameter("q");
		String petType = req.getParameter("type");
		String page = req.getParameter("page");

		if(query == null || petType == null || page == null)
			return;
		
		
		int pageNo = Integer.parseInt(page);
		
		ProductService svc = new ProductServiceImpl();
		List<ProductVO> list = svc.searchProductList(query, petType, pageNo);
		
		//req.setAttribute("searchPage", "1");
		req.setAttribute("searchList", list);
		req.setAttribute("query", query);
		req.setAttribute("curPage", page);
		try {
			req.getRequestDispatcher("product/productSearchPage.tiles").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
